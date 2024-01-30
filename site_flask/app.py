from flask import Flask, render_template
from flask_sqlalchemy import SQLAlchemy

app = Flask(__name__)
app.config['SQLALCHEMY_DATABASE_URI'] = 'mysql+pymysql://flask_admin:Password&1@10.10.20.11:3306/flask_test'
db = SQLAlchemy(app)

class Test(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(255))

@app.route('/', methods=['GET'])
def index():
    # Get all data from the test table
    tests = Test.query.all()

    # Convert the data into a list of dictionaries
    data = []
    for test in tests:
        test_data = {
            'id': test.id,
            'name': test.name
        }
        data.append(test_data)

    return render_template('index.html', data=data)

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000, debug= True)
