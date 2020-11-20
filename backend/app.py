from enum import unique
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
    coms = db.relationship('Com', backref = 'owner')


#Init client class and model
class Client(db.Model):
    id = db.Column(db.Integer, primary_key = True)
    name = db.Column(db.String(20), unique = True)
    latitude = db.Column(db.String(20), nullable = False)
    longitude = db.Column(db.String(20), nullable = False)    


#Init order class and model
class Order(db.Model):
    id = db.Column(db.Integer, primary_key = True)
    client_id = db.Column(db.Integer)
    bus_id = db.Column(db.Integer)
    c_latitude = db.Column(db.String(20))
    c_longitude = db.Column(db.String(20))
    ofoods = db.relationship('Ofood', backref = 'order')


#Init ordedfoodlist class and model
class Ofood(db.Model):
    id = db.Column(db.Integer, primary_key = True)
    food_id = db.Column(db.Integer)
    order_id = db.Column(db.Integer, db.ForeignKey('order.id'))


#Init commodities class and model
class Com(db.Model):
    id = db.Column(db.Integer, primary_key = True)
    com_name = db.Column(db.String(200))
    com_price = db.Column(db.Integer)
    owner_id = db.Column(db.Integer,db.ForeignKey('business.id'))  


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

class orderSchema(ma.Schema):
    class Meta:
        fields = ('id', 'client_id', 'bus_id', 'c_latitude', 'c_longitude')

class ofoodSchema(ma.Schema):
    class Meta:
        fields = ('food_id', 'order_id')

class comSchema(ma.Schema):
    class Meta:
        fields = ('id', 'com_name', 'com_price', 'owner_id')


#Init Schema
food_schema = foodSchema()
foods_schema = foodSchema(many = True)

com_schema = comSchema()
coms_schema = comSchema(many = True)

business_Schema = businessSchema()
morebusiness_Schema = businessSchema(many = True)

client_schema = clientSchema()
clients_schema = clientSchema(many = True)

order_schema = orderSchema()
orders_schema = orderSchema(many = True)

ofood_schema = ofoodSchema()
ofoods_schema = ofoodSchema(many = True)

#Input food item
@app.route('/food', methods=['POST'])
def add_food():
    name = request.json["name"]
    price = int(request.json["price"])*100
    tmpownerid = request.json["owner"] #parse the owner
    print(tmpownerid)
    owner = Business.query.filter_by(id = tmpownerid).first() #fetch the owner

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


#Input commodity item
@app.route('/com', methods=['POST'])
def add_com():
    name = request.json["name"]
    price = int(request.json["price"])*100
    tmpownerid = request.json["owner"] #parse the owner
    print(tmpownerid)
    owner = Business.query.filter_by(id = tmpownerid).first() #fetch the owner

    ncom = Com(com_name = name, com_price = price, owner = owner)

    db.session.add(ncom)
    db.session.commit()

    return com_schema.jsonify(ncom)

#Fetch a list of commodities
@app.route('/com', methods=['GET'])
def get_com():
    allcoms = Com.query.all()
    result = coms_schema.dump(allcoms)
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

#Fetch a list of businesses
@app.route('/business', methods=['GET'])
def get_business():
    allbusiness = Business.query.all()
    result = morebusiness_Schema.dump(allbusiness)
    return jsonify(result)


#Add client
@app.route('/client', methods=['POST'])
def add_client():
    name = request.json["name"]
    latitude = request.json["latitude"]
    longitude = request.json["longitude"]

    n_client = Client(name = name, latitude = latitude, longitude = longitude)

    db.session.add(n_client)
    db.session.commit()
    
    return client_schema.jsonify(n_client)

#Get client
@app.route('/client', methods=['GET'])
def get_client():
    name = request.json["name"]
    client = Client.query.filter_by(name = name)
    
    result = clients_schema.dump(client)
    return jsonify(result)


#Add order
@app.route('/order', methods=['POST'])
def add_order():
    client_id = request.json["client"]
    bus_id = request.json["restaurant"]
    food_list = request.json["foodList"]
    c_latitude = request.json["latitude"]
    c_longitude = request.json["longitude"]

    n_order = Order(client_id = client_id, bus_id = bus_id, c_latitude = c_latitude, c_longitude = c_longitude)

    db.session.add(n_order)
    db.session.commit()

    for food_id in food_list:
        n_ofood = Ofood(food_id = food_id, order = n_order)
        db.session.add(n_ofood)
        db.session.commit()

    return order_schema.jsonify(n_order)

#Fetch a list of orders
@app.route('/order', methods=['GET'])
def get_order():
    allorders = Order.query.all()
    result = orders_schema.dump(allorders)
    return jsonify(result)

#Fetch a list of ordered food
@app.route('/ofood', methods=['GET'])
def get_ofood():
    all_ofood = Ofood.query.all()
    result = ofoods_schema.dump(all_ofood)
    return jsonify(result)


#Testing
@app.route('/', methods=['GET'])
def index():
    return jsonify({'msg':True})

if __name__ ==  '__main__':
    app.run(debug=True)