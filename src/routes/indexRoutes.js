import { Router } from "express";

import userRouter from "./userRoutes.js";
import servicesRouter from "./servicesRoutes.js";


const router = Router()

router.use(userRouter)
router.use(servicesRouter)




export default router;