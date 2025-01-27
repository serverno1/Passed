from flask import Flask, render_template
from flask_socketio import SocketIO, emit

app = Flask(__name__)
socketio = SocketIO(app)

@app.route('/')
def index():
    return render_template('index.html')

@socketio.on('start_task')
def handle_task(data):
    print(f"Task started with data: {data}")
    # Process the task and send a response
    emit('task_complete', {'message': 'Task completed!'})

if __name__ == "__main__":
    socketio.run(app, host='0.0.0.0', port=8080)
