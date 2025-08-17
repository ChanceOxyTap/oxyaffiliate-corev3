Write-Host "🔄 Resetting Yarn environment..."

# Kill background processes that lock files
Write-Host "🔨 Killing esbuild.exe and workerd.exe if running..."
taskkill /F /IM esbuild.exe 2>$null
taskkill /F /IM workerd.exe 2>$null

# Remove Yarn + node_modules artifacts
Write-Host "🗑 Removing node_modules, Yarn cache, and state files..."
Remove-Item -Recurse -Force node_modules -ErrorAction SilentlyContinue
Remove-Item -Recurse -Force .yarn\cache -ErrorAction SilentlyContinue
Remove-Item -Force yarn.lock -ErrorAction SilentlyContinue
Remove-Item -Force .pnp.* -ErrorAction SilentlyContinue
Remove-Item -Force .yarn\install-state.gz -ErrorAction SilentlyContinue

# Reinstall clean
Write-Host "📦 Running yarn.cmd install..."
yarn.cmd install

# Verify workspaces
Write-Host "`n✅ Current Yarn workspaces:"
yarn.cmd workspaces list --verbose
