#!/bin/bash
# Deploy script for Vercel deployment

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

echo -e "${YELLOW}=== Socio 2026 v2 Vercel Deployment Checklist ===${NC}\n"

# Check if we're in the right directory
if [ ! -f "vercel.json" ]; then
    echo -e "${RED}✗ vercel.json not found. Are you in the project root?${NC}"
    exit 1
fi

echo -e "${GREEN}✓ Project root detected${NC}\n"

# Check dependencies
echo -e "${YELLOW}Checking dependencies...${NC}"
if [ ! -d "server/node_modules" ]; then
    echo -e "${YELLOW}Installing server dependencies...${NC}"
    cd server && npm install && cd ..
fi

if [ ! -d "client/node_modules" ]; then
    echo -e "${YELLOW}Installing client dependencies...${NC}"
    cd client && npm install && cd ..
fi

echo -e "${GREEN}✓ All dependencies installed${NC}\n"

# Check environment files
echo -e "${YELLOW}Checking environment configuration...${NC}"
if [ ! -f ".env.example" ]; then
    echo -e "${YELLOW}⚠ .env.example not found${NC}"
fi

echo -e "${YELLOW}⚠ Make sure the following env vars are set in Vercel:${NC}"
echo -e "\n${YELLOW}Server Variables (Backend):${NC}"
echo "  - SUPABASE_URL"
echo "  - SUPABASE_SERVICE_ROLE_KEY"
echo "  - SUPABASE_ANON_KEY"
echo "  - ALLOWED_ORIGINS (include your Vercel domain)"
echo "  - RESEND_API_KEY"
echo "  - VAPID_PRIVATE_KEY"
echo "  - VAPID_PUBLIC_KEY"
echo "  - SENTRY_DSN"

echo -e "\n${YELLOW}Client Variables (Frontend):${NC}"
echo "  - NEXT_PUBLIC_SUPABASE_URL"
echo "  - NEXT_PUBLIC_SUPABASE_ANON_KEY"
echo "  - NEXT_PUBLIC_APP_URL (your Vercel domain)"
echo "  - NEXT_PUBLIC_API_URL (your Vercel domain/api)"
echo "  - NEXT_PUBLIC_VAPID_KEY"

echo -e "\n${YELLOW}Deployment Steps:${NC}"
echo "1. Push to GitHub"
echo "2. Go to Vercel Dashboard"
echo "3. Import the GitHub repository"
echo "4. Configure environment variables (see above)"
echo "5. Deploy!"
echo -e "\n${GREEN}For detailed instructions, see VERCEL_DEPLOYMENT.md${NC}"
