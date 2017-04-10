module SimpleStomp
  HOST = 'localhost'
  PORT = '61613'

  def self.receive(options = {})
    # TODO: lack selector
    options.symbolize_keys!

    # add reply-to if do not exist

    # expires in millisecond
    expires = options.fetch :expires, 3000

    limit = options.fetch :time_limit, 12
    dest_reply = options.fetch :dest_reply, "INFO"
    max_retries = options.fetch(:max_retries, 2)
    tries = 0
    begin
        tries += 1 # NOTE: first line
        clt = SimpleStomp::Client.new
        clt.subscribe dest_reply
        @msg = clt.receive
        clt.ack @msg
        raise 'nil message received' if @msg.nil?
    rescue StandardError => e
        if tries < max_retries
            Rails.logger.error "stomp: #{e.message}\ntype: #{e.class}\ntime: #{Time.now}\nat: #{$@}"
            sleep 0.1 * 2 ** tries
            retry
        else
            raise e
        end
    ensure
        clt.try :close
    end
    @msg
  end



  def self.send_receive(to, from, msg, options = {})
      # TODO: lack selector
      msg.symbolize_keys!
      options.symbolize_keys!

      # add reply-to if do not exist
      ( msg[:header] ||= {} )[:'reply-to'] ||= from

      # expires in millisecond
      expires = options.fetch :expires, 3000
      msg[:header][:expires] = (Time.now.to_f * 1000).round + expires

      subscribe_header = {ack: 'client-individual'}
      subscribe_header.merge!(options[:subscribe_header]) if options[:subscribe_header]

      max_retries = options.fetch(:max_retries, 2)
      tries = 0
      begin
          tries += 1 # NOTE: first line
          clt = SimpleStomp::Client.new
          clt.send to, msg[:body], msg[:header] || {}
          clt.subscribe from, subscribe_header
          msg = clt.receive
          clt.ack msg
          raise 'nil message received' if msg.nil?
      rescue StandardError => e
          if tries < max_retries
              Rails.logger.error "stomp: #{e.message}\ntype: #{e.class}\ntime: #{Time.now}\nat: #{$@}"
              sleep 0.1 * 2 ** tries
              retry
          else
              raise e
          end
      ensure
          clt.try :close
      end

      msg
  end

  module Helper
      def destination(name = nil, options = {})
          type = options.fetch(:type, 'queue')
          reply = options.fetch(:reply, nil)
          name ||= "#{action_name}_#{controller_name.singularize}"
          reply ? "/#{type}/#{name}.#{reply}" : "/#{type}/#{name}"
      end
      alias_method :dest, :destination

      # TODO: make it a sync version with largest waiting time
      def send_receive(msg, options = {})
          limit = options.fetch :time_limit, 15
          thr = Thread.new do
              SimpleStomp::send_receive(options[:dest] || dest, options[:dest_reply] || dest(nil, reply: :reply), msg, options).body
          end

          if thr.join(limit)
              JSON.parse thr.value
          else
              thr.kill
              { 'status' => 'not_respond', 'error' => I18n.t('workflow.errors.not_respond')}
          end

      end

      def receive(options = {})
          limit = options.fetch :time_limit, 1
          dest_reply = options.fetch :dest_reply, "INFO"
          thr = Thread.new do
              SimpleStomp::receive(options).body
          end
          if thr.join(limit)
              JSON.parse(thr.value)
          else
              thr.kill
              { 'status' => 'not_respond', 'error' => I18n.t('workflow.errors.not_respond')}
          end
      end


      def selector(hsh)
          { selector: hsh.each_with_object([]){ |(key, val), obj| obj << "#{key}='#{val}'"}.join(' and ') }
      end
  end

  # Typical Stomp client class. Uses a listener thread to receive frames
  # from the server, any thread can send.
  #
  # Receives all happen in one thread, so consider not doing much processing
  # in that thread if you have much message volume.
  class Client
      extend Forwardable

      # Parameters hash
      attr_reader :ids

      def_delegators :@connection, :login, :passcode, :port, :host, :ssl
      def_delegator :@parameters, :reliable

      def initialize(login = '', password = '', host = HOST, port = PORT,
                     reliable = false, reconnect_delay = 5,
                     connect_headers = {'accept-version' => '1.1', 'host' => 'localhost'})
          @ids = {}
          @connection = Stomp::Connection.new(login, password, host, port, reliable,
                                              reconnect_delay, connect_headers)

      end

      def subscribe(destination, headers = {})
          headers[:ack] ="client"
          headers.symbolize_keys!

          # if lack id
          headers[:id] ||= sha1(destination)
          @ids[destination] = headers[:id]

          @connection.subscribe(destination, headers)
      end

      # Unsubscribe from a subscription by name.
      def unsubscribe(destination, headers = {})
          headers[:id] = sha1(destination) unless headers[:id]
          @connection.unsubscribe(destination, headers)
      end

      def receive
          @connection.receive
      end

      # Unreceive a message, sending it back to its queue or to the DLQ.
      def unreceive(message, options = {})
          @connection.unreceive(message, options)
      end

      def publish(destination, message, headers = {})
          raise 'The message or body should be text' unless String === message
          @connection.publish(destination, message, headers)
      end

      alias_method :send, :publish

      def ack(message, headers = {})
          context = ack_context_for(message, headers)
          @connection.ack context[:message_id], context[:headers]
      end

      alias_method :acknowledge, :ack

      # Stomp 1.1+ NACK.
      def nack(message, headers = {})
          context = ack_context_for(message, headers)
          @connection.nack context[:message_id], context[:headers]
      end

      def ack_context_for(message, headers)
          id = case protocol
               when Stomp::SPL_12
                   'ack'
               when Stomp::SPL_11
                   headers.merge!(:subscription => message.headers['subscription'])
                   'message-id'
               else
                   'message-id'
               end
          {:message_id => message.headers[id], :headers => headers}
      end

      # Return the broker's CONNECTED frame to the client.  Misnamed.
      def connection_frame
          @connection.connection_frame
      end

      # Return any RECEIPT frame received by DISCONNECT.
      def disconnect_receipt
          @connection.disconnect_receipt
      end

      # open? tests if this client connection is open.
      def open?
          @connection.open?
      end

      # close? tests if this client connection is closed.
      def closed?
          @connection.closed?
      end

      # jruby? tests if the connection has detcted a JRuby environment
      def jruby?
          @connection.jruby
      end

      # close frees resources in use by this client.  The listener thread is
      # terminated, and disconnect on the connection is called.
      def close(headers={})
          @connection.disconnect(headers)
      end

      # running checks if the thread was created and is not dead.

      # set_logger identifies a new callback logger.
      def set_logger(logger)
          @logger = logger
          @connection.set_logger(logger)
      end

      # protocol returns the current client's protocol level.
      def protocol
          @connection.protocol
      end

      # valid_utf8? validates any given string for UTF8 compliance.
      def valid_utf8?(str)
          @connection.valid_utf8?(str)
      end

      # sha1 returns a SHA1 sum of a given string.
      def sha1(data)
          @connection.sha1(data)
      end

      # uuid returns a type 4 UUID.
      def uuid
          @connection.uuid
      end

      # hbsend_interval returns the connection's heartbeat send interval.
      def hbsend_interval
          @connection.hbsend_interval
      end

      # hbrecv_interval returns the connection's heartbeat receive interval.
      def hbrecv_interval
          @connection.hbrecv_interval
      end

      # hbsend_count returns the current connection's heartbeat send count.
      def hbsend_count
          @connection.hbsend_count
      end

      # hbrecv_count returns the current connection's heartbeat receive count.
      def hbrecv_count
          @connection.hbrecv_count
      end

      # Poll for asynchronous messages issued by broker.
      # Return nil of no message available, else the message
      def poll
          @connection.poll
      end

      # autoflush= sets the current connection's autoflush setting.
      def autoflush=(autoflush)
          @connection.autoflush = autoflush
      end

      # autoflush returns the current connection's autoflush setting.
      def autoflush
          @connection.autoflush
      end

  end # Class

end # Module

