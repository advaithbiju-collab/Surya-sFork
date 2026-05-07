# Vercel Deployment Guide for Socio 2026 v2

## Overview
This deployment uses Vercel's monorepo structure to deploy:
- **Client**: Next.js app (frontend)
- **Server**: Express.js app (backend APIs)

## Deployment Steps

### 1. Prerequisites
- GitHub repo connected to Vercel
- Vercel account with MCP integration enabled

### 2. Environment Variables Setup

#### Server Environment Variables (Backend)
Add these to Vercel Project Settings → Environment Variables:

```
# Supabase
SUPABASE_URL=<your-supabase-url>
SUPABASE_SERVICE_ROLE_KEY=<your-supabase-service-role-key>
SUPABASE_ANON_KEY=<your-supabase-anon-key>

# Gated Supabase (if applicable)
GATED_SUPABASE_URL=<your-gated-supabase-url>
GATED_SUPABASE_SERVICE_ROLE_KEY=<your-gated-supabase-service-role-key>
GATED_APP_URL=<your-gated-app-url>

# API Configuration
NODE_ENV=production
ALLOWED_ORIGINS=https://your-vercel-domain.vercel.app,https://yourdomain.com
CRON_SECRET=<your-cron-secret>

# Email & Notifications
RESEND_API_KEY=<your-resend-api-key>
QR_SECRET=<your-qr-secret>
SENTRY_DSN=<your-sentry-dsn>

# Push Notifications
VAPID_PRIVATE_KEY=<your-vapid-private-key>
VAPID_PUBLIC_KEY=<your-vapid-public-key>
ONESIGNAL_APP_ID=<your-onesignal-app-id>
ONESIGNAL_REST_API_KEY=<your-onesignal-rest-api-key>

# Strava Integration
STRAVA_CLIENT_ID=<your-strava-client-id>
STRAVA_CLIENT_SECRET=<your-strava-client-secret>
STRAVA_REDIRECT_URI=https://your-vercel-domain.vercel.app/api/strava/callback
STRAVA_SCOPE=activity:read_all
```

#### Client Environment Variables (Frontend)
Add these to Vercel Project Settings → Environment Variables:

```
# Supabase
NEXT_PUBLIC_SUPABASE_URL=<your-supabase-url>
NEXT_PUBLIC_SUPABASE_ANON_KEY=<your-supabase-anon-key>

# Application URLs
NEXT_PUBLIC_APP_URL=https://your-vercel-domain.vercel.app
NEXT_PUBLIC_API_URL=https://your-vercel-domain.vercel.app/api

# Optional
NEXT_PUBLIC_PWA_URL=https://your-vercel-domain.vercel.app
NEXT_PUBLIC_REMOTE_IMAGE_HOSTS=<your-image-hosts>
NEXT_PUBLIC_VAPID_KEY=<your-vapid-public-key>
NEXT_PUBLIC_ONESIGNAL_APP_ID=<your-onesignal-app-id>
```

### 3. Important Configuration Notes

- **Root Directory**: Leave blank (project root contains vercel.json)
- **Build Command**: Uses default from vercel.json
- **Output Directory**: Handled by vercel.json configuration
- **Install Command**: Uses default npm install

### 4. Production Deployment Checklist

- [ ] All environment variables set in Vercel dashboard
- [ ] Supabase service role key configured (not just anon key)
- [ ] ALLOWED_ORIGINS includes your Vercel domain
- [ ] Strava redirect URI updated if using Strava integration
- [ ] Database migrations applied to Supabase
- [ ] Test auth flow after deployment
- [ ] Monitor Sentry for errors in production

### 5. Monitoring

After deployment:
1. Check Vercel deployments dashboard for build logs
2. Test API endpoints: `https://your-domain.vercel.app/api/health` (if available)
3. Monitor Sentry for runtime errors
4. Check browser console for client-side errors

### 6. Rollback

If issues occur:
```bash
# Rollback to previous deployment in Vercel Dashboard
# Or push a fix and redeploy
```
