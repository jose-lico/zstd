project "zstd"
	kind "StaticLib"
	language "C"
	configmap 
	{
		["ReleaseWithInfo"] = "Release",
		["ReleaseNoImGui"] = "Release"
	}

	targetdir ("%{wks.location}/bin/" .. outputDir .. "/%{prj.name}")
	objdir ("%{wks.location}/bin-int/" .. outputDir .. "/%{prj.name}")

	files
	{
		"lib/zstd.h",
		"lib/zstd_errors.h",
        
        "lib/common/**.c",
        "lib/common/**.h",
        
        "lib/compress/**.c",
        "lib/compress/**.h",

        "lib/decompress/**.c",
        "lib/decompress/**.h",
	}

	includedirs
	{
		"lib"
	}

	defines
    {
        "_CRT_SECURE_NO_WARNINGS",
        "ZSTD_MULTITHREAD"
    }

	filter "system:windows"
		systemversion "latest"
		staticruntime "On"

	filter "system:linux"
		systemversion "latest"
        links "pthread"

	filter "configurations:Debug"
		runtime "Debug"
		symbols "On"
	
	filter "configurations:Release"
		runtime "Release"
		optimize "On"
