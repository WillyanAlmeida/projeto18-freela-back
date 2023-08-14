import bcrypt from 'bcrypt';
import { db } from "../database/databaseconnections.js";
import jwt from 'jsonwebtoken';


export async function getCategorys(req, res) {

    try {
        const categoryList = await db.query(`SELECT id,name FROM category`);
             
        res.status(200).send( categoryList.rows);
    } catch (error) {
        console.log(error);
        res.sendStatus(500);
    }
}

export async function NewService(req, res) {
    const { name, description, url, price, categoryId } = req.body;
    const createdBy = Number(res.locals.session) 

    try {
        const serviceCad = await db.query(`INSERT INTO services ( name, description, price, "createdBy", "categoryId") VALUES
        ($1, $2, $3, $4, $5) RETURNING id `, [name, description, price, createdBy, categoryId]);
        
        if(serviceCad.rows.length >0){
        const picservice = await db.query(`INSERT INTO pictures ("createdBy", url) VALUES ($1, $2) RETURNING id `, [serviceCad.rows[0].id, url])
            
        if(picservice?.rows.length >0){
            await db.query(`UPDATE services SET "pictureMain" = $1 WHERE id = $2;`, [picservice.rows[0].id, serviceCad.rows[0].id]);
        }}
             
        res.sendStatus(200);
    }
    catch (error) {
        console.log(error);
        res.sendStatus(401);
    }
}

export async function getServicesAll(req, res) {
    
    try {
        const categoryList = await db.query(`SELECT *,services.id AS servid, services.name AS servicename, users.name AS username
        FROM services 
        JOIN pictures ON "pictureMain" = pictures.id 
        JOIN users ON services."createdBy" = users.id 
        JOIN category ON services."categoryId" = category.id
        WHERE services.available = true`);
             
        res.status(200).send( categoryList.rows);
    } catch (error) {
        console.log(error);
        res.sendStatus(500);
    }
}

export async function getMyservices(req, res) {

    console.log(res.locals.session)
    
    try {
        const categoryList = await db.query(`SELECT *, services.id AS servid, services.name AS servicename, users.name AS username FROM services JOIN pictures ON "pictureMain" = pictures.id JOIN users ON services."createdBy" = users.id WHERE services."createdBy"=$1`,[res.locals.session]);
             
        res.status(200).send( categoryList.rows);
    } catch (error) {
        console.log(error);
        res.sendStatus(500);
    }
}
export async function availableservice(req, res) {

    const id = Number(req.params.id);  
   
    
    try {
        const checkid = await db.query(`SELECT * FROM services WHERE id=$1`, [id])
        
        if(checkid?.rows.length >0 ) { 
            const change = await db.query(`UPDATE services SET "available" = $1 WHERE id = $2;`, [!checkid?.rows[0].available, id])
            console.log(change?.rows[0])
        }
           
        res.status(200).send( "ok");
    } catch (error) {
        console.log(error);
        res.sendStatus(500);
    }
}

export async function getServiceId(req, res) {

    const id = Number(req.params.id); 
    
    try {
        const ServicebyId = await db.query(`SELECT *, services.id AS servid, services.name AS servicename, users.name AS username FROM services JOIN pictures ON "pictureMain" = pictures.id JOIN users ON services."createdBy" = users.id  JOIN category ON services."categoryId" = category.id WHERE services.id=$1`,[id]);
             
        res.status(200).send( ServicebyId.rows[0]);
    } catch (error) {
        console.log(error);
        res.sendStatus(500);
    }
}

