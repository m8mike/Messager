import openfl.display.Sprite;
import openfl.events.Event;
import sys.net.Socket;
import sys.net.Host;

class Main extends Sprite {
    var socket:Socket;

	public function new() {
		super();
        socket = new Socket();
        socket.connect(new Host("localhost"), 5000);
        addEventListener(Event.ENTER_FRAME, update);
	}

    function update(e:Event) {
        var line = socket.input.readLine();
        trace(line);
        if (line == "exit") {
            socket.close();
            removeEventListener(Event.ENTER_FRAME, update);
        }
    }
}
