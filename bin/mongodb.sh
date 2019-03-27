 #!/bin/bash 

# Regular Colors
Black='\033[0;30m'        # Black
Red='\033[0;31m'          # Red
Green='\033[0;32m'        # Green
Yellow='\033[0;33m'       # Yellow
Blue='\033[0;34m'         # Blue
Purple='\033[0;35m'       # Purple
Cyan='\033[0;36m'         # Cyan
White='\033[0;37m'        # White

Cof='\033[0m'             # Reset


install(){
    echo -e " ============= installation ==============
        [1]   sudo apt-get update
        [2]   sudo apt install -y mongodb
        [2]   sudo systemctl status mongodb
    "
}

general(){
    echo -e "
        mongod --dbpath <path-of-data-folder> ===> launch mongodb with certaining database folder 
        cls      ===> clear screen
        show dbs ===> Print a list of all databases on the server
        use <db> ===> Switch current database to <db>

    "
} 

create(){
    echo -e " ================ create ==================
        db.collection.insertOne(${Purple}data${Cof}, ${Purple}option${Cof})   ===> Create or insert operations addd a new documents to a collection [https://bit.ly/2IibWwv]
        db.collection.insertMany(${Purple}data${Cof}, ${Purple}option${Cof})  ===> Create or insert operations add many documents to a collectio [https://bit.ly/2DNjZfn]
    "
}

read(){
    echo -e " ================ read ==================
        db.collection.find(${Purple}filter${Cof}, ${Purple}option${Cof})           ===> Read operations retrieves documents from a collection [https://bit.ly/2RgY3On]
        db.collection.find(${Purple}filter${Cof}, ${Purple}option${Cof}).pretty()  ===> Read operations retrieves documents from a collection in pretty format
        db.collection.find(${Purple}filter${Cof}, ${Purple}option${Cof}).toArray() ===> Returns an array that contains all the documents from a cursor [https://bit.ly/2S92ues]
        db.collection.find(${Purple}filter${Cof}, ${Purple}option${Cof}).forEach() ===> Iterates the cursor to apply a JavaScript function to each document from the cursor [https://bit.ly/2IkUlEjl]
        db.collection.findOne(${Purple}filter${Cof}, ${Purple}option${Cof})        ===> Read operations retrieves of first matching document it find in a collection [https://bit.ly/2Edb2NB]

    "
}

update(){
    echo -e " ================ update  ==================
        db.collection.updateOne(${Purple}filter${Cof}, ${Purple}update${Cof}, ${Purple}option${Cof})   ===> Updates a single document within the collection based on the filter [https://bit.ly/2X8pZYJ]
        db.collection.updateMany(${Purple}filter${Cof},${Purple}update${Cof}, ${Purple}option${Cof})  ===> Updates multiple documents within the collection based on the filter [https://bit.ly/2TNU65P]
        db.collection.replaceOne(${Purple}filter${Cof}, ${Purple}update${Cof}, ${Purple}option${Cof})  ===> Replaces a single document within the collection based on the filter [https://bit.ly/2S8VZs6]
                                                               
    "
}

delete(){ 
    echo -e " ================ delete ==================
        db.collection.deleteOne(${Purple}filter${Cof}, ${Purple}option${Cof}) [https://bit.ly/2S7pivl]
        db.collection.deleteMany(${Purple}filter${Cof}, ${Purple}option${Cof}) [https://bit.ly/2BD19aA]
    "
  }


if [[ $1 == "create" ]] ;then
   create 
elif [[ $1 == "read" ]] ;then
   read
elif [[ $1 == "update" ]] ;then
   update
elif [[ $1 == "delete" ]] ;then
   delete
fi


