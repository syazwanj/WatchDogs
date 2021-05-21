require("Vector3")

local script = Script()
local angles = {}
local function setCamera(posX, posY, posZ)
    
    ScriptHook.CameraSetCustom(posX, posY, posZ, rotX, rotY, rotZ)
    --print("Successfully set camera to "..posX..","..posY..","..posZ.."("..rotX..","..rotY..","..rotZ)
end

local view_angles = {'person','surveillance','drone'}

local function getCoordinates(yaw, pitch, radius)
    --[[
        This function gives the Vector3 coordinates of where the camera should be located, w.r.t. the Player.
        Parameters:
            yaw: The yaw of the camera, between 0-360 degrees. (0 is the front of the player, 180 is the back.)
            pitch: dependent on view_angle, person = 0f, surveillance = 40f, drone = 70f
            radius: radius of the camera to the player.

            In WD2, x is the pitch, y is the roll, z is the yaw(?)
        Returns a Vector3 for the camera.
    --]]

    tmpX = 0.0
    tmpY = 0.0
    tmpZ = 0.0

    if (yaw >= 0) and (yaw <= 90) then
        tmpY = math.sqrt((math.pow(radius, 2) - math.pow(math.sin(math.pi / 180 * pitch) * radius, 2)) / (math.pow(math.tan(math.pi / 180 * yaw), 2) + 1));
        tmpX = (math.sqrt((math.pow(radius, 2) - math.pow(math.sin(math.pi / 180 * pitch) * radius, 2)) / (math.pow(math.tan(math.pi / 180 * yaw), 2) + 1))) * (math.tan(math.pi / 180 * yaw));
        tmpZ = (math.sin(math.pi / 180 * pitch) * radius);
    end

    elseif (yaw >= 91) and (yaw <= 180) then
        yaw = 180 - yaw;
        tmpY = math.sqrt((math.pow(radius, 2) - math.pow(math.sin(math.pi / 180 * pitch) * radius, 2)) / (math.pow(math.tan(math.pi / 180 * yaw), 2) + 1));
        tmpX = (math.sqrt((math.pow(radius, 2) - math.pow(math.sin(math.pi / 180 * pitch) * radius, 2)) / (math.pow(math.tan(math.pi / 180 * yaw), 2) + 1))) * (math.tan(math.pi / 180 * yaw));
        tmpZ = (math.sin(math.pi / 180 * pitch) * radius);
        tmpY = -tmpY;
    end

    elseif (yaw >= 181) and (yaw <= 270) then
        yaw = 180 + yaw;
        tmpY = math.sqrt((math.pow(radius, 2) - math.pow(math.sin(math.pi / 180 * pitch) * radius, 2)) / (math.pow(math.tan(math.pi / 180 * yaw), 2) + 1));
        tmpX = (math.sqrt((math.pow(radius, 2) - math.pow(math.sin(math.pi / 180 * pitch) * radius, 2)) / (math.pow(math.tan(math.pi / 180 * yaw), 2) + 1))) * (math.tan(math.pi / 180 * yaw));
        tmpZ = (math.sin(math.pi / 180 * pitch) * radius);
        tmpX = -tmpX;
        tmpY = -tmpY;
    end

    elseif (yaw >= 271) and (yaw <= 360) then
        yaw = 360 - yaw;
        tmpY = math.sqrt((math.pow(radius, 2) - math.pow(math.sin(math.pi / 180 * pitch) * radius, 2)) / (math.pow(math.tan(math.pi / 180 * yaw), 2) + 1));
        tmpX = (math.sqrt((math.pow(radius, 2) - math.pow(math.sin(math.pi / 180 * pitch) * radius, 2)) / (math.pow(math.tan(math.pi / 180 * yaw), 2) + 1))) * (math.tan(math.pi / 180 * yaw));
        tmpZ = (math.sin(math.pi / 180 * pitch) * radius);
        tmpX = -tmpX;
    end

    return {tmpX, tmpY, tmpZ}

local function generateCams(view_angle, radius)
    --[[
        This function generates a Vector3 list of the coordinates for the camera, to be used to capturing the 8 different yaw angles and 3 different pitch angles.

        If different yaw angles, view angles or radius are desired, change the parameters of GetCoordinates() below, accoedingly.
        getCoordinates(yawangle, viewangle, radius)
    --]]
    cams = {}
    if view_angle == 'person' then
        return new Vector3[] { GetCoordinates(0d, 0d, radius), GetCoordinates(45d, 0d, radius), GetCoordinates(90d, 0d, radius), GetCoordinates(135d, 0d, radius), GetCoordinates(180d, 0d, radius), GetCoordinates(225d, 0d, radius), GetCoordinates(270d, 0d, radius), GetCoordinates(315d, 0d, radius), GetCoordinates(315d, 0d, radius), };
    end

    elseif view_angle == 'surveillance' then
        return new Vector3[] { GetCoordinates(0d, 40d, radius), GetCoordinates(45d, 40d, radius), GetCoordinates(90d, 40d, radius), GetCoordinates(135d, 40d, radius), GetCoordinates(180d, 40d, radius), GetCoordinates(225d, 40d, radius), GetCoordinates(270d, 40d, radius), GetCoordinates(315d, 40d, radius), GetCoordinates(315d, 40d, radius), };
    end

    elseif view_angle == 'drone' then
        return new Vector3[] { GetCoordinates(0d, 70d, radius), GetCoordinates(45d, 70d, radius), GetCoordinates(90d, 70d, radius), GetCoordinates(135d, 70d, radius), GetCoordinates(180d, 70d, radius), GetCoordinates(225d, 70d, radius), GetCoordinates(270d, 70d, radius), GetCoordinates(315d, 70d, radius), GetCoordinates(315d, 70d, radius), };
    end

    else
        return new Vector3[] { GetCoordinates(0d, 0d, radius), GetCoordinates(45d, 0d, radius), GetCoordinates(90d, 0d, radius), GetCoordinates(135d, 0d, radius), GetCoordinates(180d, 0d, radius), GetCoordinates(225d, 0d, radius), GetCoordinates(270d, 0d, radius), GetCoordinates(315d, 0d, radius), GetCoordinates(315d, 0d, radius), };
    end

end

local locCoords = {
    'a'
}