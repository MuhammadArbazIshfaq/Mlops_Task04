from flask import Flask, request, jsonify

import pickle

app = Flask(__name__)

# Load the pickled model
with open('my_model.pkl', 'rb') as f:
    loaded_model = pickle.load(f)

# Endpoint for prediction
@app.route('/predict', methods=['POST'])
def predict():
    try:
        # Check if Content-Type is 'application/json'
        if request.headers['Content-Type'] != 'application/json':
            return jsonify({'error': 'Unsupported Media Type: Content-Type must be application/json'}), 415
        
        # Get data from request
        data = request.json
        
        # Print the received data
        print("Received data:", data)

        # Perform inference
        result = loaded_model.predict(data['input'])
        
        # Return the result
        return jsonify({'prediction': result.tolist()})
    except Exception as e:
        return jsonify({'error': str(e)}), 400

if __name__ == '__main__':
    app.run(debug=True)
