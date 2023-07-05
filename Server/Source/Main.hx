import openfl.display.Sprite;
import openfl.events.Event;
import sys.net.Socket;
import sys.net.Host;

class Main extends Sprite {
	var socket:Socket;

	public function new() {
		super();
		socket = new Socket();
        socket.bind(new Host("localhost"), 5000);
        socket.listen(1);
        trace("Starting server...");
		addEventListener(Event.ENTER_FRAME, update);
	}

	function update (e:Event) {
		var clientSocket:Socket = socket.accept();
		trace("Client connected...");
		clientSocket.write("hello\n");
		clientSocket.write("your IP is " + clientSocket.peer().host.toString() + "\n");
		clientSocket.write("exit");
		clientSocket.close();
	}
}