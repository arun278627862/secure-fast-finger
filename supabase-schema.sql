-- Fast Finger Response Database Schema for Supabase

-- Enable necessary extensions
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

-- Teams table
CREATE TABLE teams (
    id UUID DEFAULT uuid_generate_v4() PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    index INTEGER NOT NULL,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- Game sessions table
CREATE TABLE game_sessions (
    id UUID DEFAULT uuid_generate_v4() PRIMARY KEY,
    session_name VARCHAR(200),
    is_active BOOLEAN DEFAULT FALSE,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    ended_at TIMESTAMP WITH TIME ZONE
);

-- Game logs table
CREATE TABLE game_logs (
    id UUID DEFAULT uuid_generate_v4() PRIMARY KEY,
    session_id UUID REFERENCES game_sessions(id) ON DELETE CASCADE,
    team_id UUID REFERENCES teams(id) ON DELETE CASCADE,
    team_name VARCHAR(100) NOT NULL,
    rank INTEGER,
    timestamp TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    round_number INTEGER DEFAULT 1
);

-- Team rankings table
CREATE TABLE team_rankings (
    id UUID DEFAULT uuid_generate_v4() PRIMARY KEY,
    session_id UUID REFERENCES game_sessions(id) ON DELETE CASCADE,
    team_id UUID REFERENCES teams(id) ON DELETE CASCADE,
    team_name VARCHAR(100) NOT NULL,
    rank INTEGER NOT NULL,
    score INTEGER DEFAULT 0,
    timestamp TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    round_number INTEGER DEFAULT 1
);

-- Team scores table
CREATE TABLE team_scores (
    id UUID DEFAULT uuid_generate_v4() PRIMARY KEY,
    session_id UUID REFERENCES game_sessions(id) ON DELETE CASCADE,
    team_id UUID REFERENCES teams(id) ON DELETE CASCADE,
    team_name VARCHAR(100) NOT NULL,
    score INTEGER DEFAULT 0,
    submitted_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    round_number INTEGER DEFAULT 1
);

-- Winners announcements table
CREATE TABLE winners_announcements (
    id UUID DEFAULT uuid_generate_v4() PRIMARY KEY,
    session_id UUID REFERENCES game_sessions(id) ON DELETE CASCADE,
    announcement_data JSONB NOT NULL,
    announced_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- Insert default teams
INSERT INTO teams (name, index) VALUES 
('Team A', 0),
('Team B', 1),
('Team C', 2),
('Team D', 3),
('Team E', 4),
('Team F', 5);

-- Create indexes for better performance
CREATE INDEX idx_game_logs_session_id ON game_logs(session_id);
CREATE INDEX idx_game_logs_timestamp ON game_logs(timestamp);
CREATE INDEX idx_team_rankings_session_id ON team_rankings(session_id);
CREATE INDEX idx_team_scores_session_id ON team_scores(session_id);
CREATE INDEX idx_winners_announcements_session_id ON winners_announcements(session_id);

-- Create updated_at trigger function
CREATE OR REPLACE FUNCTION update_updated_at_column()
RETURNS TRIGGER AS $$
BEGIN
    NEW.updated_at = NOW();
    RETURN NEW;
END;
$$ language 'plpgsql';

-- Create trigger for teams table
CREATE TRIGGER update_teams_updated_at 
    BEFORE UPDATE ON teams 
    FOR EACH ROW 
    EXECUTE FUNCTION update_updated_at_column();

-- Row Level Security (RLS) policies
ALTER TABLE teams ENABLE ROW LEVEL SECURITY;
ALTER TABLE game_sessions ENABLE ROW LEVEL SECURITY;
ALTER TABLE game_logs ENABLE ROW LEVEL SECURITY;
ALTER TABLE team_rankings ENABLE ROW LEVEL SECURITY;
ALTER TABLE team_scores ENABLE ROW LEVEL SECURITY;
ALTER TABLE winners_announcements ENABLE ROW LEVEL SECURITY;

-- Allow all operations for authenticated users
CREATE POLICY "Allow all for authenticated users" ON teams FOR ALL TO authenticated USING (true);
CREATE POLICY "Allow all for authenticated users" ON game_sessions FOR ALL TO authenticated USING (true);
CREATE POLICY "Allow all for authenticated users" ON game_logs FOR ALL TO authenticated USING (true);
CREATE POLICY "Allow all for authenticated users" ON team_rankings FOR ALL TO authenticated USING (true);
CREATE POLICY "Allow all for authenticated users" ON team_scores FOR ALL TO authenticated USING (true);
CREATE POLICY "Allow all for authenticated users" ON winners_announcements FOR ALL TO authenticated USING (true);

-- Allow read access for anonymous users (for public game access)
CREATE POLICY "Allow read for anonymous users" ON teams FOR SELECT TO anon USING (true);
CREATE POLICY "Allow read for anonymous users" ON game_sessions FOR SELECT TO anon USING (true);
CREATE POLICY "Allow read for anonymous users" ON game_logs FOR SELECT TO anon USING (true);
CREATE POLICY "Allow read for anonymous users" ON team_rankings FOR SELECT TO anon USING (true);
CREATE POLICY "Allow read for anonymous users" ON team_scores FOR SELECT TO anon USING (true);
CREATE POLICY "Allow read for anonymous users" ON winners_announcements FOR SELECT TO anon USING (true);
