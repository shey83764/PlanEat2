import express from "express";
import { saveObjetivos } from "../controllers/objetivosController";

const router = express.Router();

// POST /api/objetivos
router.post("/", saveObjetivos);

export default router;
