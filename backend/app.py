from os import name
from flask import Flask, request, jsonify
from flask_sqlalchemy import SQLAlchemy
from flask_marshmallow import Marshmallow
import os
from flask_sqlalchemy.model import camel_to_snake_case

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
    price = db.Column(db.Integer)

    def __init__(self, name , price):
        self.name = name
        self.price = price
    

#Init business class and model
class business(db.Model):
    id = db.Column(db.Integer, primary_key = True)
    name = db.Column(db.String(200))
    address = db.Column(db.String(200))
    latitude = db.Column(db.String(20))
    longitude = db.Column(db.String(20))


#Schema
class foodSchema(ma.Schema):
    class Meta:
        fields = ('id', 'name', 'price')

class businessSchema(ma.Schema):
    class Meta:
        fields = ('id', 'name', 'address', 'latitude', 'longitude')


#Init Schema
food_schema = foodSchema()
foods_schema = foodSchema(many = True)

business_Schema = businessSchema()
morebusiness_Schema = businessSchema(many = True)


#Input food item
@app.route('/food', methods=['POST'])
def add_food():
    name = request.json["name"]
    price = int(request.json["price"])*100

    nfood = food(name = name, price = price)

    db.session.add(nfood)
    db.session.commit()

    return food_schema.jsonify(nfood)


#Fetch a list of foods
@app.route('/food', methods=['GET'])
def get_food():
    allFoods = food.query.all()
    result = foods_schema.dump(allFoods)
    return jsonify(result)


#Input business
@app.route('/business', methods=['POST'])
def add_business():
    name = request.json["name"]
    address = request.json["address"]
    latitude = request.json["latitude"]
    longitude = request.json["longitude"]
    
    nbus = business(name = name, address = address, latitude = latitude, longitude = longitude)

    db.session.add(nbus)
    db.session.commit()

    return business_Schema.jsonify(nbus)


#Fetch a list of businesses
@app.route('/business', methods=['GET'])
def get_business():
    allbusiness = business.query.all()
    result = morebusiness_Schema.dump(allbusiness)
    return jsonify(result)




#Testing
@app.route('/', methods=['GET'])
def index():
    return jsonify({'msg':True})

if __name__ ==  '__main__':
    app.run(debug=True)