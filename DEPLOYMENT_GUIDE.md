# 🚀 Netlify Deployment Guide

## 📁 Files Ready for Netlify

Your `netlify-deploy` folder contains all the files needed for Netlify deployment:

### **Core Files:**
- `index.html` - Admin panel
- `display.html` - Display screen  
- `buzz.html` - Team buzz-in page
- `package.json` - Dependencies
- `vite.config.js` - Build configuration
- `netlify.toml` - Netlify configuration

### **Source Code:**
- `src/` - All JavaScript modules
- `netlify/functions/` - Backend API
- `static/` - Assets (CSS, images, etc.)

### **Database:**
- `supabase-schema.sql` - Database setup

## 🚀 Deployment Steps

### **1. Upload to GitHub**
```bash
cd netlify-deploy
git init
git add .
git commit -m "Fast Finger Response Game"
git branch -M main
git remote add origin https://github.com/yourusername/fast-finger-response.git
git push -u origin main
```

### **2. Deploy to Netlify**
1. Go to [netlify.com](https://netlify.com)
2. Click **"New site from Git"**
3. Connect your GitHub repository
4. Set build settings:
   - **Build command:** `npm run build`
   - **Publish directory:** `dist`
5. Click **"Deploy site"**

### **3. Set Up Supabase Database**
1. Go to your Supabase dashboard
2. Click **"SQL Editor"**
3. Copy and paste the contents of `supabase-schema.sql`
4. Click **"Run"**

### **4. Add Environment Variables**
In Netlify dashboard → Site settings → Environment variables:

```
VITE_SUPABASE_URL=https://fnhdseldroycgytaehnw.supabase.co
VITE_SUPABASE_ANON_KEY=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImZuaGRzZWxkcm95Y2d5dGFlbmh3Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTk1MTI4NTAsImV4cCI6MjA3NTA4ODg1MH0.tUyRABxLz1wK4PiyX5wKJLgsYcH0Mf3eJxu1Ri-P7aM
SUPABASE_URL=https://fnhdseldroycgytaehnw.supabase.co
SUPABASE_ANON_KEY=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImZuaGRzZWxkcm95Y2d5dGFlbmh3Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTk1MTI4NTAsImV4cCI6MjA3NTA4ODg1MH0.tUyRABxLz1wK4PiyX5wKJLgsYcH0Mf3eJxu1Ri-P7aM
```

### **5. Redeploy**
After adding environment variables, click **"Trigger deploy"** → **"Deploy site"**

## ✅ Your Game is Ready!

- **Admin Panel:** `https://your-site.netlify.app/`
- **Display Screen:** `https://your-site.netlify.app/display.html`
- **Buzz-in Page:** `https://your-site.netlify.app/buzz.html`

## 🎮 How to Use

1. **Open Admin Panel** - Manage teams and control the game
2. **Open Display Screen** - Show results on a big screen
3. **Teams Buzz In** - Use the buzz-in page on phones/tablets

## 🔧 Troubleshooting

- **Build fails:** Check that all dependencies are in package.json
- **Database errors:** Verify Supabase schema is applied
- **API errors:** Check environment variables are set correctly
- **Real-time not working:** This is normal - the game works without real-time

## 📞 Need Help?

Your game will work perfectly even without real-time features! All core functionality is included.
