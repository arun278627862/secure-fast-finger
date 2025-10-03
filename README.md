# Fast Finger Response Game

A team-based response game built with Netlify and Supabase.

## Features

- **Game Management**: Start, stop, and reset games
- **Team Management**: Customize team names and manage up to 6 teams
- **Buzz-in System**: Teams can buzz in with ranking system
- **Manual Scoring**: Enter scores manually and announce winners
- **Display Screen**: Full-screen display for showing game results
- **Responsive Design**: Works on desktop, tablet, and mobile devices

## Tech Stack

- **Frontend**: HTML5, CSS3, JavaScript (ES6+), Vite
- **Backend**: Supabase (PostgreSQL + Real-time)
- **Deployment**: Netlify
- **Real-time**: Supabase Real-time subscriptions
- **Styling**: Modern CSS with CSS Grid and Flexbox

## Project Structure

```
├── index.html              # Admin panel
├── display.html            # Display screen
├── buzz.html               # Team buzz-in page
├── src/
│   ├── config.js           # Configuration
│   ├── supabase.js         # Supabase service
│   ├── socket.js           # Socket service
│   ├── admin.js            # Admin panel logic
│   ├── display.js          # Display screen logic
│   └── buzz.js             # Buzz screen logic
├── netlify/
│   └── functions/
│       └── game.js         # Netlify Functions API
├── static/                 # Static assets
├── supabase-schema.sql     # Database schema
├── netlify.toml           # Netlify configuration
├── package.json           # Dependencies
└── vite.config.js         # Vite configuration
```

## Setup Instructions

### 1. Supabase Setup

1. Create a new Supabase project at [supabase.com](https://supabase.com)
2. Go to the SQL Editor and run the `supabase-schema.sql` file
3. Note down your project URL and anon key

### 2. Environment Variables

Create a `.env` file in the root directory:

```env
# Supabase Configuration
VITE_SUPABASE_URL=https://your-project.supabase.co
VITE_SUPABASE_ANON_KEY=your-anon-key

# API Configuration
VITE_API_BASE_URL=/api

# Socket Configuration
VITE_SOCKET_URL=wss://your-domain.netlify.app

# Netlify Functions Environment Variables
SUPABASE_URL=https://your-project.supabase.co
SUPABASE_ANON_KEY=your-anon-key
```

### 3. Local Development

```bash
# Install dependencies
npm install

# Start development server
npm run dev

# Or use Netlify CLI
npm run netlify:dev
```

### 4. Deployment to Netlify

1. Connect your GitHub repository to Netlify
2. Set build command: `npm run build`
3. Set publish directory: `dist`
4. Add environment variables in Netlify dashboard:
   - `SUPABASE_URL`
   - `SUPABASE_ANON_KEY`
   - `VITE_SUPABASE_URL`
   - `VITE_SUPABASE_ANON_KEY`

## Usage

### Admin Panel (`/`)

- **Team Management**: Update team names
- **Game Controls**: Start, stop, and reset games
- **Manual Scoring**: Enter scores and announce winners
- **Game Logs**: View and manage game logs
- **Display Control**: Open display screen in new window

### Display Screen (`/display.html`)

- **Full-screen Display**: Shows current game state
- **Team Rankings**: Displays buzz-in order
- **Winners Announcement**: Shows final results
- **Real-time Updates**: Live updates from admin panel

### Buzz-in Page (`/buzz.html`)

- **Team Selection**: Teams can buzz in by clicking their button
- **Real-time Feedback**: Instant response to buzz attempts
- **Mobile Optimized**: Touch-friendly interface

## API Endpoints

All API endpoints are handled by Netlify Functions:

- `GET /api/teams` - Get all teams
- `POST /api/teams` - Update team names
- `GET /api/game-state` - Get current game state
- `POST /api/start` - Start a new game
- `POST /api/stop` - Stop current game
- `POST /api/buzz` - Team buzz-in
- `POST /api/scores` - Submit team scores
- `POST /api/announce-winners` - Announce winners
- `GET /api/logs` - Get game logs
- `DELETE /api/logs` - Delete game logs

## Database Schema

The application uses the following Supabase tables:

- `teams` - Team information
- `game_sessions` - Game session management
- `game_logs` - Game activity logs
- `team_rankings` - Team rankings per session
- `team_scores` - Manual team scores
- `winners_announcements` - Winners announcements

## Real-time Features

- **Live Game State**: Real-time updates of game status
- **Team Buzz-in**: Instant buzz-in notifications
- **Score Updates**: Live score updates
- **Winners Announcement**: Real-time winners display

## Browser Support

- Chrome 80+
- Firefox 75+
- Safari 13+
- Edge 80+

## Mobile Support

- iOS Safari 13+
- Android Chrome 80+
- Responsive design for all screen sizes
- Touch-optimized interface

## Security

- Row Level Security (RLS) enabled on all tables
- Anonymous read access for public game features
- Authenticated access for admin functions
- CORS enabled for cross-origin requests

## Performance

- Optimized for fast loading
- Minimal JavaScript bundle
- Efficient real-time updates
- Responsive images and assets

## Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Test thoroughly
5. Submit a pull request

## License

MIT License - see LICENSE file for details

## Support

For support and questions, please open an issue in the GitHub repository.