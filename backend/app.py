from os import name
from flask import Flask, request, jsonify
from flask_sqlalchemy import SQLAlchemy
from flask_marshmallow import Marshmallow
import os

from marshmallow.fields import Method

# Init app
app = Flask(__name__)
basedir = os.path.abspath(os.path.dirname(__file__))

#Database
app.config['SQLALCHEMY_DATABASE_URI'] = 'sqlite:///' + os.path.join(basedir, 'db.sqlite')
app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False

#Init database db
db = SQLAlchemy(app)   #lol db looks like dick

#Init marshmallow ma
ma = Marshmallow(app)

#Init food class and model
class food(db.Model):
    id = db.Column(db.Integer, primary_key = True)
    name = db.Column(db.String(200))
    price = db.Column(db.Float)

    def __init__(self, name , price):
        self.name = name
        self.price = price
        

#Schema
class foodSchema(ma.Schema):
    class Meta:
        fields = ('id', 'name', 'price')

#Init Schema
food_schema = foodSchema()
foods_schema = foodSchema(many = True)

#Input food item
@app.route('/food', methods=['POST'])
def add_food():
    name = request.json["name"]
    price = request.json["price"]

    print(name, price)
    
    nfood = food(name = name, price = price)

    db.session.add(nfood)
    db.session.commit()

    return food_schema.jsonify(nfood)


#Fetch a list of products
@app.route('/getfood', methods=['GET'])
def get_food():
    allFoods = food.query.all()
    result = foods_schema.dump(allFoods)
    return jsonify(result)

@app.route('/', methods=['GET'])
def index():
    return jsonify({'msg':True})

if __name__ ==  '__main__':
    app.run(debug=True)