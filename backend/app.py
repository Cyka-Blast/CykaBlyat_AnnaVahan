from os import name
from flask import Flask, request, jsonify
from flask import json
from flask_sqlalchemy import SQLAlchemy
from flask_marshmallow import Marshmallow
import os
from flask_sqlalchemy.model import camel_to_snake_case

from marshmallow.fields import Method
from sqlalchemy.orm import backref

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
class Food(db.Model):
    id = db.Column(db.Integer, primary_key = True)
    name = db.Column(db.String(200))
    price = db.Column(db.Integer)
    owner_id = db.Column(db.Integer,db.ForeignKey('business.id'))

    # def __init__(self, name , price): #Looks like this was unnecessary
    #     self.name = name
    #     self.price = price
    

#Init business class and model
class Business(db.Model):
    id = db.Column(db.Integer, primary_key = True)
    name = db.Column(db.String(200))
    address = db.Column(db.String(200))
    latitude = db.Column(db.String(20))
    longitude = db.Column(db.String(20))
    foods = db.relationship('Food', backref = 'owner')


#Init client class and model
class Client(db.Model):
    id = db.Column(db.Integer, primary_key = True)
    name = db.Column(db.String(20))
    latitude = db.Column(db.String(20), nullable= False)
    longitude = db.Column(db.String(20), nullable = False)    

#Schema
class foodSchema(ma.Schema):
    class Meta:
        fields = ('id', 'name', 'price', 'owner_id')

class businessSchema(ma.Schema):
    class Meta:
        fields = ('id', 'name', 'address', 'latitude', 'longitude')


class clientSchema(ma.Schema):
    class Meta:
        fields = ('id', 'name', 'latitude', 'longitude')


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
    tmpowner = request.json["owner"]
    print(tmpowner)
    owner = Business.query.filter_by(name = tmpowner).first()

    nfood = Food(name = name, price = price, owner = owner)

    db.session.add(nfood)
    db.session.commit()

    return food_schema.jsonify(nfood)


#Fetch a list of foods
@app.route('/food', methods=['GET'])
def get_food():
    allFoods = Food.query.all()
    result = foods_schema.dump(allFoods)
    return jsonify(result)


#Input business
@app.route('/business', methods=['POST'])
def add_business():
    name = request.json["name"]
    address = request.json["address"]
    latitude = request.json["latitude"]
    longitude = request.json["longitude"]
    
    nbus = Business(name = name, address = address, latitude = latitude, longitude = longitude)

    db.session.add(nbus)
    db.session.commit()

    return business_Schema.jsonify(nbus)


@app.route('/client', methods=['GET'])
def get_client():
    id = 1
    client = Client.query.filter_by(id)
    return clientSchema.jsonify(client)

#Fetch a list of businesses
@app.route('/business', methods=['GET'])
def get_business():
    allbusiness = Business.query.all()
    result = morebusiness_Schema.dump(allbusiness)
    return jsonify(result)




#Testing
@app.route('/', methods=['GET'])
def index():
    return jsonify({'msg':True})

if __name__ ==  '__main__':
    app.run(debug=True)