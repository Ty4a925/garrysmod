
function file.Read( filename, path )

	if ( path == true ) then path = "GAME" end
	if ( path == nil || path == false ) then path = "DATA" end

	local f = file.Open( filename, "rb", path )
	if ( !f ) then return nil end

	local str = f:Read( f:Size() )

	f:Close()

	if ( !str ) then str = "" end
	return str

end

local function AB_WB( filename, contents, type )
	local f = file.Open( filename, type, "DATA" )
	if !f then return false end

	f:Write( contents )
	f:Close()

	return true
end

function file.Write( a, b ) return AB_WB( a, b, "wb" ) end
function file.Append( a, b ) return AB_WB( a, b, "ab" ) end
