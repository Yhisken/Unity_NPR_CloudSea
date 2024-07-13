Shader "Cloud"
{
    Properties
    {
        _Rotate_Projection("Rotate Projection", Vector) = (1, 0, 0, 0)
        _Noise_Scale("Noise Scale", Float) = 0.1
        _Speed("Speed", Float) = 1
        _Vertexoffset("Vertexoffset", Float) = 5
        _Remap_xy_zw("Remap xy-zw", Vector) = (0, 1, -1, 1)
        _Color_Peak("Color Peak", Color) = (0, 0, 0, 0)
        _Color_Valley("Color Valley", Color) = (0, 0, 0, 0)
        _SmoothEdge1("SmoothEdge1", Float) = 0
        _SmoothEdge2("SmoothEdge2", Float) = 1
        _Cloud_Pow("Cloud Pow", Float) = 2
        _Base_Scale("Base Scale", Float) = 0
        _Base_Speed("Base Speed", Float) = 1
        _BaseStrength("BaseStrength", Float) = 1
        _Emission_Strength("Emission Strength", Float) = 0
        _Curvate_Radius("Curvate Radius", Float) = 0
        _Fresnel_Power("Fresnel Power", Float) = 1
        _Fresnel_Opacity("Fresnel Opacity", Float) = 1
        _Depth_Fade("Depth Fade", Float) = 100
        [HideInInspector]_EmissionColor("Color", Color) = (1, 1, 1, 1)
        [HideInInspector]_RenderQueueType("Float", Float) = 4
        [HideInInspector][ToggleUI]_AddPrecomputedVelocity("Boolean", Float) = 0
        [HideInInspector][ToggleUI]_DepthOffsetEnable("Boolean", Float) = 0
        [HideInInspector][ToggleUI]_ConservativeDepthOffsetEnable("Boolean", Float) = 0
        [HideInInspector][ToggleUI]_TransparentWritingMotionVec("Boolean", Float) = 0
        [HideInInspector][ToggleUI]_AlphaCutoffEnable("Boolean", Float) = 0
        [HideInInspector]_TransparentSortPriority("_TransparentSortPriority", Float) = 0
        [HideInInspector][ToggleUI]_UseShadowThreshold("Boolean", Float) = 0
        [HideInInspector][ToggleUI]_DoubleSidedEnable("Boolean", Float) = 0
        [HideInInspector][Enum(Flip, 0, Mirror, 1, None, 2)]_DoubleSidedNormalMode("Float", Float) = 2
        [HideInInspector]_DoubleSidedConstants("Vector4", Vector) = (1, 1, -1, 0)
        [HideInInspector][Enum(Auto, 0, On, 1, Off, 2)]_DoubleSidedGIMode("Float", Float) = 0
        [HideInInspector][ToggleUI]_TransparentDepthPrepassEnable("Boolean", Float) = 0
        [HideInInspector][ToggleUI]_TransparentDepthPostpassEnable("Boolean", Float) = 0
        [HideInInspector]_SurfaceType("Float", Float) = 1
        [HideInInspector]_BlendMode("Float", Float) = 0
        [HideInInspector]_SrcBlend("Float", Float) = 1
        [HideInInspector]_DstBlend("Float", Float) = 0
        [HideInInspector]_AlphaSrcBlend("Float", Float) = 1
        [HideInInspector]_AlphaDstBlend("Float", Float) = 0
        [HideInInspector][ToggleUI]_AlphaToMask("Boolean", Float) = 0
        [HideInInspector][ToggleUI]_AlphaToMaskInspectorValue("Boolean", Float) = 0
        [HideInInspector][ToggleUI]_ZWrite("Boolean", Float) = 0
        [HideInInspector][ToggleUI]_TransparentZWrite("Boolean", Float) = 0
        [HideInInspector]_CullMode("Float", Float) = 2
        [HideInInspector][ToggleUI]_EnableFogOnTransparent("Boolean", Float) = 0
        [HideInInspector]_CullModeForward("Float", Float) = 2
        [HideInInspector][Enum(Front, 1, Back, 2)]_TransparentCullMode("Float", Float) = 2
        [HideInInspector][Enum(UnityEditor.Rendering.HighDefinition.OpaqueCullMode)]_OpaqueCullMode("Float", Float) = 2
        [HideInInspector]_ZTestDepthEqualForOpaque("Float", Int) = 4
        [HideInInspector][Enum(UnityEngine.Rendering.CompareFunction)]_ZTestTransparent("Float", Float) = 4
        [HideInInspector][ToggleUI]_TransparentBackfaceEnable("Boolean", Float) = 0
        [HideInInspector][ToggleUI]_EnableBlendModePreserveSpecularLighting("Boolean", Float) = 0
        [HideInInspector]_StencilRef("Float", Int) = 0
        [HideInInspector]_StencilWriteMask("Float", Int) = 6
        [HideInInspector]_StencilRefDepth("Float", Int) = 0
        [HideInInspector]_StencilWriteMaskDepth("Float", Int) = 8
        [HideInInspector]_StencilRefMV("Float", Int) = 32
        [HideInInspector]_StencilWriteMaskMV("Float", Int) = 40
        [HideInInspector]_StencilRefDistortionVec("Float", Int) = 4
        [HideInInspector]_StencilWriteMaskDistortionVec("Float", Int) = 4
        [HideInInspector]_StencilWriteMaskGBuffer("Float", Int) = 14
        [HideInInspector]_StencilRefGBuffer("Float", Int) = 2
        [HideInInspector]_ZTestGBuffer("Float", Int) = 4
        [HideInInspector][NoScaleOffset]unity_Lightmaps("unity_Lightmaps", 2DArray) = "" {}
        [HideInInspector][NoScaleOffset]unity_LightmapsInd("unity_LightmapsInd", 2DArray) = "" {}
        [HideInInspector][NoScaleOffset]unity_ShadowMasks("unity_ShadowMasks", 2DArray) = "" {}
    }
    SubShader
    {
        Tags
        {
            "RenderPipeline"="HDRenderPipeline"
            "RenderType"="HDUnlitShader"
            "Queue"="Transparent+0"
            "ShaderGraphShader"="true"
            "ShaderGraphTargetId"="HDUnlitSubTarget"
        }
        Pass
        {
            Name "ShadowCaster"
            Tags
            {
                "LightMode" = "ShadowCaster"
            }
        
            // Render State
            Cull [_CullMode]
        ZWrite On
        ColorMask 0
        ZClip [_ZClip]
        
            // Debug
            // <None>
        
            // --------------------------------------------------
            // Pass
        
            HLSLPROGRAM
        
            // Pragmas
            #pragma instancing_options renderinglayer
        #pragma target 4.5
        #pragma vertex Vert
        #pragma fragment Frag
        #pragma only_renderers d3d11 playstation xboxone xboxseries vulkan metal switch
        #pragma multi_compile_instancing
        
            // Keywords
            #pragma shader_feature _ _SURFACE_TYPE_TRANSPARENT
        #pragma shader_feature_local _BLENDMODE_OFF _BLENDMODE_ALPHA _BLENDMODE_ADD _BLENDMODE_PRE_MULTIPLY
        #pragma shader_feature_local _ _ADD_PRECOMPUTED_VELOCITY
        #pragma shader_feature_local _ _TRANSPARENT_WRITES_MOTION_VEC
        #pragma shader_feature_local_fragment _ _ENABLE_FOG_ON_TRANSPARENT
            // GraphKeywords: <None>
        
            // Early Instancing Defines
            // DotsInstancingOptions: <None>
        
            // Injected Instanced Properties (must be included before UnityInstancing.hlsl)
            // HybridV1InjectedBuiltinProperties: <None>
        
            // For custom interpolators to inject a substruct definition before FragInputs definition,
            // allowing for FragInputs to capture CI's intended for ShaderGraph's SDI.
            struct CustomInterpolators
        {
        };
        #define USE_CUSTOMINTERP_SUBSTRUCT
        
        
        
            // TODO: Merge FragInputsVFX substruct with CustomInterpolators.
        	#ifdef HAVE_VFX_MODIFICATION
        	struct FragInputsVFX
            {
                /* WARNING: $splice Could not find named fragment 'FragInputsVFX' */
            };
            #endif
        
            #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Common.hlsl"
        	#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/GeometricTools.hlsl" // Required by Tessellation.hlsl
        	#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Tessellation.hlsl"
            #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Texture.hlsl"
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderVariables.hlsl"
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/ShaderPass/ShaderPass.cs.hlsl"
            #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/TextureStack.hlsl" // Required to be include before we include properties as it define DECLARE_STACK_CB
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderGraphHeader.hlsl" // Need to be here for Gradient struct definition
        
            // --------------------------------------------------
            // Defines
        
            // Attribute
            #define ATTRIBUTES_NEED_NORMAL
            #define ATTRIBUTES_NEED_TANGENT
            #define VARYINGS_NEED_POSITION_WS
        
            #define HAVE_MESH_MODIFICATION
        
            //Strip down the FragInputs.hlsl (on graphics), so we can only optimize the interpolators we use.
            //if by accident something requests contents of FragInputs.hlsl, it will be caught as a compiler error
            //Frag inputs stripping is only enabled when FRAG_INPUTS_ENABLE_STRIPPING is set
            #if !defined(SHADER_STAGE_RAY_TRACING) && SHADERPASS != SHADERPASS_RAYTRACING_GBUFFER && SHADERPASS != SHADERPASS_FULL_SCREEN_DEBUG
            #define FRAG_INPUTS_ENABLE_STRIPPING
            #endif
        
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/ShaderPass/FragInputs.hlsl"
        
        
        
            #define SHADERPASS SHADERPASS_SHADOWS
        #define REQUIRE_DEPTH_TEXTURE
        
        
            // Following two define are a workaround introduce in 10.1.x for RaytracingQualityNode
            // The ShaderGraph don't support correctly migration of this node as it serialize all the node data
            // in the json file making it impossible to uprgrade. Until we get a fix, we do a workaround here
            // to still allow us to rename the field and keyword of this node without breaking existing code.
            #ifdef RAYTRACING_SHADER_GRAPH_DEFAULT
            #define RAYTRACING_SHADER_GRAPH_HIGH
            #endif
        
            #ifdef RAYTRACING_SHADER_GRAPH_RAYTRACED
            #define RAYTRACING_SHADER_GRAPH_LOW
            #endif
            // end
        
            #ifndef SHADER_UNLIT
            // We need isFrontFace when using double sided - it is not required for unlit as in case of unlit double sided only drive the cullmode
            // VARYINGS_NEED_CULLFACE can be define by VaryingsMeshToPS.FaceSign input if a IsFrontFace Node is included in the shader graph.
            #if defined(_DOUBLESIDED_ON) && !defined(VARYINGS_NEED_CULLFACE)
                #define VARYINGS_NEED_CULLFACE
            #endif
            #endif
        
            // Specific Material Define
        // Setup a define to say we are an unlit shader
        #define SHADER_UNLIT
        
        // Following Macro are only used by Unlit material
        #if defined(_ENABLE_SHADOW_MATTE) && (SHADERPASS == SHADERPASS_FORWARD_UNLIT || SHADERPASS == SHADERPASS_PATH_TRACING)
        #define LIGHTLOOP_DISABLE_TILE_AND_CLUSTER
        #define HAS_LIGHTLOOP
        #endif
            // Caution: we can use the define SHADER_UNLIT onlit after the above Material include as it is the Unlit template who define it
        
            // To handle SSR on transparent correctly with a possibility to enable/disable it per framesettings
            // we should have a code like this:
            // if !defined(_DISABLE_SSR_TRANSPARENT)
            // pragma multi_compile _ WRITE_NORMAL_BUFFER
            // endif
            // i.e we enable the multicompile only if we can receive SSR or not, and then C# code drive
            // it based on if SSR transparent in frame settings and not (and stripper can strip it).
            // this is currently not possible with our current preprocessor as _DISABLE_SSR_TRANSPARENT is a keyword not a define
            // so instead we used this and chose to pay the extra cost of normal write even if SSR transaprent is disabled.
            // Ideally the shader graph generator should handle it but condition below can't be handle correctly for now.
            #if SHADERPASS == SHADERPASS_TRANSPARENT_DEPTH_PREPASS
            #if !defined(_DISABLE_SSR_TRANSPARENT) && !defined(SHADER_UNLIT)
                #define WRITE_NORMAL_BUFFER
            #endif
            #endif
        
            #ifndef DEBUG_DISPLAY
                // In case of opaque we don't want to perform the alpha test, it is done in depth prepass and we use depth equal for ztest (setup from UI)
                // Don't do it with debug display mode as it is possible there is no depth prepass in this case
                #if !defined(_SURFACE_TYPE_TRANSPARENT)
                    #if SHADERPASS == SHADERPASS_FORWARD
                    #define SHADERPASS_FORWARD_BYPASS_ALPHA_TEST
                    #elif SHADERPASS == SHADERPASS_GBUFFER
                    #define SHADERPASS_GBUFFER_BYPASS_ALPHA_TEST
                    #endif
                #endif
            #endif
        
            // Define _DEFERRED_CAPABLE_MATERIAL for shader capable to run in deferred pass
            #if defined(SHADER_LIT) && !defined(_SURFACE_TYPE_TRANSPARENT)
                #define _DEFERRED_CAPABLE_MATERIAL
            #endif
        
            // Translate transparent motion vector define
            #if defined(_TRANSPARENT_WRITES_MOTION_VEC) && defined(_SURFACE_TYPE_TRANSPARENT)
                #define _WRITE_TRANSPARENT_MOTION_VECTOR
            #endif
        
            // -- Graph Properties
            CBUFFER_START(UnityPerMaterial)
        float4 _Rotate_Projection;
        float _Noise_Scale;
        float _Speed;
        float _Vertexoffset;
        float4 _Remap_xy_zw;
        float4 _Color_Peak;
        float4 _Color_Valley;
        float _SmoothEdge1;
        float _SmoothEdge2;
        float _Cloud_Pow;
        float _Base_Scale;
        float _Base_Speed;
        float _BaseStrength;
        float _Emission_Strength;
        float _Curvate_Radius;
        float _Fresnel_Power;
        float _Fresnel_Opacity;
        float _Depth_Fade;
        float4 _EmissionColor;
        float _UseShadowThreshold;
        float4 _DoubleSidedConstants;
        float _BlendMode;
        float _EnableBlendModePreserveSpecularLighting;
        CBUFFER_END
        
        // Object and Global properties
        
            // -- Property used by ScenePickingPass
            #ifdef SCENEPICKINGPASS
            float4 _SelectionID;
            #endif
        
            // -- Properties used by SceneSelectionPass
            #ifdef SCENESELECTIONPASS
            int _ObjectId;
            int _PassValue;
            #endif
        
            // Includes
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/Debug/DebugDisplay.hlsl"
        #include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Material.hlsl"
        #include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Unlit/Unlit.hlsl"
        #include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/BuiltinUtilities.hlsl"
        #include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/MaterialUtilities.hlsl"
        #include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderGraphFunctions.hlsl"
        	// GraphIncludes: <None>
        
            // --------------------------------------------------
            // Structs and Packing
        
            struct AttributesMesh
        {
             float3 positionOS : POSITION;
             float3 normalOS : NORMAL;
             float4 tangentOS : TANGENT;
            #if UNITY_ANY_INSTANCING_ENABLED
             uint instanceID : INSTANCEID_SEMANTIC;
            #endif
        };
        struct VaryingsMeshToPS
        {
            SV_POSITION_QUALIFIERS float4 positionCS : SV_POSITION;
             float3 positionRWS;
            #if UNITY_ANY_INSTANCING_ENABLED
             uint instanceID : CUSTOM_INSTANCE_ID;
            #endif
        };
        struct VertexDescriptionInputs
        {
             float3 ObjectSpaceNormal;
             float3 ObjectSpaceTangent;
             float3 ObjectSpacePosition;
             float3 TimeParameters;
        };
        struct SurfaceDescriptionInputs
        {
             float3 WorldSpacePosition;
             float4 ScreenPosition;
        };
        struct PackedVaryingsMeshToPS
        {
            SV_POSITION_QUALIFIERS float4 positionCS : SV_POSITION;
             float3 interp0 : INTERP0;
            #if UNITY_ANY_INSTANCING_ENABLED
             uint instanceID : CUSTOM_INSTANCE_ID;
            #endif
        };
        
            PackedVaryingsMeshToPS PackVaryingsMeshToPS (VaryingsMeshToPS input)
        {
            PackedVaryingsMeshToPS output;
            ZERO_INITIALIZE(PackedVaryingsMeshToPS, output);
            output.positionCS = input.positionCS;
            output.interp0.xyz =  input.positionRWS;
            #if UNITY_ANY_INSTANCING_ENABLED
            output.instanceID = input.instanceID;
            #endif
            return output;
        }
        
        VaryingsMeshToPS UnpackVaryingsMeshToPS (PackedVaryingsMeshToPS input)
        {
            VaryingsMeshToPS output;
            output.positionCS = input.positionCS;
            output.positionRWS = input.interp0.xyz;
            #if UNITY_ANY_INSTANCING_ENABLED
            output.instanceID = input.instanceID;
            #endif
            return output;
        }
        
        
            // --------------------------------------------------
            // Graph
        
        
            // Graph Functions
            
        void Unity_Distance_float3(float3 A, float3 B, out float Out)
        {
            Out = distance(A, B);
        }
        
        void Unity_Divide_float(float A, float B, out float Out)
        {
            Out = A / B;
        }
        
        void Unity_Power_float(float A, float B, out float Out)
        {
            Out = pow(A, B);
        }
        
        void Unity_Multiply_float3_float3(float3 A, float3 B, out float3 Out)
        {
            Out = A * B;
        }
        
        void Unity_Rotate_About_Axis_Radians_float(float3 In, float3 Axis, float Rotation, out float3 Out)
        {
            float s = sin(Rotation);
            float c = cos(Rotation);
            float one_minus_c = 1.0 - c;
        
            Axis = normalize(Axis);
        
            float3x3 rot_mat = { one_minus_c * Axis.x * Axis.x + c,            one_minus_c * Axis.x * Axis.y - Axis.z * s,     one_minus_c * Axis.z * Axis.x + Axis.y * s,
                                      one_minus_c * Axis.x * Axis.y + Axis.z * s,   one_minus_c * Axis.y * Axis.y + c,              one_minus_c * Axis.y * Axis.z - Axis.x * s,
                                      one_minus_c * Axis.z * Axis.x - Axis.y * s,   one_minus_c * Axis.y * Axis.z + Axis.x * s,     one_minus_c * Axis.z * Axis.z + c
                                    };
        
            Out = mul(rot_mat,  In);
        }
        
        void Unity_Multiply_float_float(float A, float B, out float Out)
        {
            Out = A * B;
        }
        
        void Unity_TilingAndOffset_float(float2 UV, float2 Tiling, float2 Offset, out float2 Out)
        {
            Out = UV * Tiling + Offset;
        }
        
        
        float2 Unity_GradientNoise_Dir_float(float2 p)
        {
            // Permutation and hashing used in webgl-nosie goo.gl/pX7HtC
            p = p % 289;
            // need full precision, otherwise half overflows when p > 1
            float x = float(34 * p.x + 1) * p.x % 289 + p.y;
            x = (34 * x + 1) * x % 289;
            x = frac(x / 41) * 2 - 1;
            return normalize(float2(x - floor(x + 0.5), abs(x) - 0.5));
        }
        
        void Unity_GradientNoise_float(float2 UV, float Scale, out float Out)
        {
            float2 p = UV * Scale;
            float2 ip = floor(p);
            float2 fp = frac(p);
            float d00 = dot(Unity_GradientNoise_Dir_float(ip), fp);
            float d01 = dot(Unity_GradientNoise_Dir_float(ip + float2(0, 1)), fp - float2(0, 1));
            float d10 = dot(Unity_GradientNoise_Dir_float(ip + float2(1, 0)), fp - float2(1, 0));
            float d11 = dot(Unity_GradientNoise_Dir_float(ip + float2(1, 1)), fp - float2(1, 1));
            fp = fp * fp * fp * (fp * (fp * 6 - 15) + 10);
            Out = lerp(lerp(d00, d01, fp.y), lerp(d10, d11, fp.y), fp.x) + 0.5;
        }
        
        void Unity_Add_float(float A, float B, out float Out)
        {
            Out = A + B;
        }
        
        void Unity_Saturate_float(float In, out float Out)
        {
            Out = saturate(In);
        }
        
        void Unity_Combine_float(float R, float G, float B, float A, out float4 RGBA, out float3 RGB, out float2 RG)
        {
            RGBA = float4(R, G, B, A);
            RGB = float3(R, G, B);
            RG = float2(R, G);
        }
        
        void Unity_Remap_float(float In, float2 InMinMax, float2 OutMinMax, out float Out)
        {
            Out = OutMinMax.x + (In - InMinMax.x) * (OutMinMax.y - OutMinMax.x) / (InMinMax.y - InMinMax.x);
        }
        
        void Unity_Absolute_float(float In, out float Out)
        {
            Out = abs(In);
        }
        
        void Unity_Smoothstep_float(float Edge1, float Edge2, float In, out float Out)
        {
            Out = smoothstep(Edge1, Edge2, In);
        }
        
        void Unity_Add_float3(float3 A, float3 B, out float3 Out)
        {
            Out = A + B;
        }
        
        void Unity_SceneDepth_Eye_float(float4 UV, out float Out)
        {
            if (unity_OrthoParams.w == 1.0)
            {
                Out = LinearEyeDepth(ComputeWorldSpacePosition(UV.xy, SHADERGRAPH_SAMPLE_SCENE_DEPTH(UV.xy), UNITY_MATRIX_I_VP), UNITY_MATRIX_V);
            }
            else
            {
                Out = LinearEyeDepth(SHADERGRAPH_SAMPLE_SCENE_DEPTH(UV.xy), _ZBufferParams);
            }
        }
        
        void Unity_Subtract_float(float A, float B, out float Out)
        {
            Out = A - B;
        }
        
            // Graph Vertex
            struct VertexDescription
        {
            float3 Position;
            float3 Normal;
            float3 Tangent;
        };
        
        VertexDescription VertexDescriptionFunction(VertexDescriptionInputs IN)
        {
            VertexDescription description = (VertexDescription)0;
            float _Distance_389dd396e31949b9a8a01d35896316a6_Out_2;
            Unity_Distance_float3(SHADERGRAPH_OBJECT_POSITION, IN.ObjectSpacePosition, _Distance_389dd396e31949b9a8a01d35896316a6_Out_2);
            float _Property_d58669debb0246fe82fb0fb0bffa2edc_Out_0 = _Curvate_Radius;
            float _Divide_0b143990dbbc4cbdb5129fcbf5511012_Out_2;
            Unity_Divide_float(_Distance_389dd396e31949b9a8a01d35896316a6_Out_2, _Property_d58669debb0246fe82fb0fb0bffa2edc_Out_0, _Divide_0b143990dbbc4cbdb5129fcbf5511012_Out_2);
            float _Power_89ab1e29e2cb42a9acd2aed36f4fdcfe_Out_2;
            Unity_Power_float(_Divide_0b143990dbbc4cbdb5129fcbf5511012_Out_2, 2, _Power_89ab1e29e2cb42a9acd2aed36f4fdcfe_Out_2);
            float3 _Multiply_22e187ffacc7402bbe63087272b7efb5_Out_2;
            Unity_Multiply_float3_float3(IN.ObjectSpaceNormal, (_Power_89ab1e29e2cb42a9acd2aed36f4fdcfe_Out_2.xxx), _Multiply_22e187ffacc7402bbe63087272b7efb5_Out_2);
            float _Property_7d8e49b5efe94dea8210c34a6319b1ef_Out_0 = _SmoothEdge1;
            float _Property_09307b889e8945078bacabda50cca5c6_Out_0 = _SmoothEdge2;
            float4 _Property_a8d53d7ea07349e0979b956475bdd7cc_Out_0 = _Rotate_Projection;
            float _Split_7d12b2bb5feb46d685603473d0cf5818_R_1 = _Property_a8d53d7ea07349e0979b956475bdd7cc_Out_0[0];
            float _Split_7d12b2bb5feb46d685603473d0cf5818_G_2 = _Property_a8d53d7ea07349e0979b956475bdd7cc_Out_0[1];
            float _Split_7d12b2bb5feb46d685603473d0cf5818_B_3 = _Property_a8d53d7ea07349e0979b956475bdd7cc_Out_0[2];
            float _Split_7d12b2bb5feb46d685603473d0cf5818_A_4 = _Property_a8d53d7ea07349e0979b956475bdd7cc_Out_0[3];
            float3 _RotateAboutAxis_1b91481bceed4e9a82a13975af123b02_Out_3;
            Unity_Rotate_About_Axis_Radians_float(IN.ObjectSpacePosition, (_Property_a8d53d7ea07349e0979b956475bdd7cc_Out_0.xyz), _Split_7d12b2bb5feb46d685603473d0cf5818_A_4, _RotateAboutAxis_1b91481bceed4e9a82a13975af123b02_Out_3);
            float _Property_258f4645340c46f69274c9f077f1a73c_Out_0 = _Speed;
            float _Multiply_94f6d857831c4e69b53b9bfc92dd852f_Out_2;
            Unity_Multiply_float_float(IN.TimeParameters.x, _Property_258f4645340c46f69274c9f077f1a73c_Out_0, _Multiply_94f6d857831c4e69b53b9bfc92dd852f_Out_2);
            float2 _TilingAndOffset_6cb9fd57231c4a429c9c0fe5aeb7cc58_Out_3;
            Unity_TilingAndOffset_float((_RotateAboutAxis_1b91481bceed4e9a82a13975af123b02_Out_3.xy), float2 (1, 1), (_Multiply_94f6d857831c4e69b53b9bfc92dd852f_Out_2.xx), _TilingAndOffset_6cb9fd57231c4a429c9c0fe5aeb7cc58_Out_3);
            float _Property_2b9001a870d04f8eb60f5d7e1ce909c5_Out_0 = _Noise_Scale;
            float _GradientNoise_061679506b214bb8b4792ec4dfe82ec6_Out_2;
            Unity_GradientNoise_float(_TilingAndOffset_6cb9fd57231c4a429c9c0fe5aeb7cc58_Out_3, _Property_2b9001a870d04f8eb60f5d7e1ce909c5_Out_0, _GradientNoise_061679506b214bb8b4792ec4dfe82ec6_Out_2);
            float2 _TilingAndOffset_1d2491b5855e49d3b2e6b5dbe5db07d4_Out_3;
            Unity_TilingAndOffset_float((_RotateAboutAxis_1b91481bceed4e9a82a13975af123b02_Out_3.xy), float2 (1, 1), float2 (0, 0), _TilingAndOffset_1d2491b5855e49d3b2e6b5dbe5db07d4_Out_3);
            float _GradientNoise_8a27c3fb323f4db1b38f287380605198_Out_2;
            Unity_GradientNoise_float(_TilingAndOffset_1d2491b5855e49d3b2e6b5dbe5db07d4_Out_3, _Property_2b9001a870d04f8eb60f5d7e1ce909c5_Out_0, _GradientNoise_8a27c3fb323f4db1b38f287380605198_Out_2);
            float _Add_a6dd2d6e3f564decbca34ec03a419130_Out_2;
            Unity_Add_float(_GradientNoise_061679506b214bb8b4792ec4dfe82ec6_Out_2, _GradientNoise_8a27c3fb323f4db1b38f287380605198_Out_2, _Add_a6dd2d6e3f564decbca34ec03a419130_Out_2);
            float _Divide_a757ea7167f343ecaec30e69b58c9bae_Out_2;
            Unity_Divide_float(_Add_a6dd2d6e3f564decbca34ec03a419130_Out_2, 2, _Divide_a757ea7167f343ecaec30e69b58c9bae_Out_2);
            float _Saturate_f355ba5a467f4488b7ec89e8a08484a3_Out_1;
            Unity_Saturate_float(_Divide_a757ea7167f343ecaec30e69b58c9bae_Out_2, _Saturate_f355ba5a467f4488b7ec89e8a08484a3_Out_1);
            float _Property_96da655cc17e4594836aa02d74efe33c_Out_0 = _Cloud_Pow;
            float _Power_318bede735044ec6811f2a5c345b7d73_Out_2;
            Unity_Power_float(_Saturate_f355ba5a467f4488b7ec89e8a08484a3_Out_1, _Property_96da655cc17e4594836aa02d74efe33c_Out_0, _Power_318bede735044ec6811f2a5c345b7d73_Out_2);
            float4 _Property_317e8becc0724841a13cbcf8d4c4efbc_Out_0 = _Remap_xy_zw;
            float _Split_3dee68ff9a374966b7612da59c6ac20a_R_1 = _Property_317e8becc0724841a13cbcf8d4c4efbc_Out_0[0];
            float _Split_3dee68ff9a374966b7612da59c6ac20a_G_2 = _Property_317e8becc0724841a13cbcf8d4c4efbc_Out_0[1];
            float _Split_3dee68ff9a374966b7612da59c6ac20a_B_3 = _Property_317e8becc0724841a13cbcf8d4c4efbc_Out_0[2];
            float _Split_3dee68ff9a374966b7612da59c6ac20a_A_4 = _Property_317e8becc0724841a13cbcf8d4c4efbc_Out_0[3];
            float4 _Combine_4e3ec9a6e4064091bba919631e732b7a_RGBA_4;
            float3 _Combine_4e3ec9a6e4064091bba919631e732b7a_RGB_5;
            float2 _Combine_4e3ec9a6e4064091bba919631e732b7a_RG_6;
            Unity_Combine_float(_Split_3dee68ff9a374966b7612da59c6ac20a_R_1, _Split_3dee68ff9a374966b7612da59c6ac20a_G_2, 0, 0, _Combine_4e3ec9a6e4064091bba919631e732b7a_RGBA_4, _Combine_4e3ec9a6e4064091bba919631e732b7a_RGB_5, _Combine_4e3ec9a6e4064091bba919631e732b7a_RG_6);
            float4 _Combine_6f976751f1234c77908b163e59da18bb_RGBA_4;
            float3 _Combine_6f976751f1234c77908b163e59da18bb_RGB_5;
            float2 _Combine_6f976751f1234c77908b163e59da18bb_RG_6;
            Unity_Combine_float(_Split_3dee68ff9a374966b7612da59c6ac20a_B_3, _Split_3dee68ff9a374966b7612da59c6ac20a_A_4, 0, 0, _Combine_6f976751f1234c77908b163e59da18bb_RGBA_4, _Combine_6f976751f1234c77908b163e59da18bb_RGB_5, _Combine_6f976751f1234c77908b163e59da18bb_RG_6);
            float _Remap_a11bf825d8d54f198c2355e6d3cc1fba_Out_3;
            Unity_Remap_float(_Power_318bede735044ec6811f2a5c345b7d73_Out_2, _Combine_4e3ec9a6e4064091bba919631e732b7a_RG_6, _Combine_6f976751f1234c77908b163e59da18bb_RG_6, _Remap_a11bf825d8d54f198c2355e6d3cc1fba_Out_3);
            float _Absolute_553a57701af34a45a18ca7b2af677c8a_Out_1;
            Unity_Absolute_float(_Remap_a11bf825d8d54f198c2355e6d3cc1fba_Out_3, _Absolute_553a57701af34a45a18ca7b2af677c8a_Out_1);
            float _Smoothstep_6babd4aa745b40db842b941b96adf7e9_Out_3;
            Unity_Smoothstep_float(_Property_7d8e49b5efe94dea8210c34a6319b1ef_Out_0, _Property_09307b889e8945078bacabda50cca5c6_Out_0, _Absolute_553a57701af34a45a18ca7b2af677c8a_Out_1, _Smoothstep_6babd4aa745b40db842b941b96adf7e9_Out_3);
            float _Property_17631cb6b51c44b593b4fb1f0ac8fa75_Out_0 = _Base_Speed;
            float _Multiply_2e98faddc46143bea8e48ab17d0e1c15_Out_2;
            Unity_Multiply_float_float(IN.TimeParameters.x, _Property_17631cb6b51c44b593b4fb1f0ac8fa75_Out_0, _Multiply_2e98faddc46143bea8e48ab17d0e1c15_Out_2);
            float2 _TilingAndOffset_d8c83d87b12649f7b6a3902973c4457a_Out_3;
            Unity_TilingAndOffset_float((_RotateAboutAxis_1b91481bceed4e9a82a13975af123b02_Out_3.xy), float2 (1, 1), (_Multiply_2e98faddc46143bea8e48ab17d0e1c15_Out_2.xx), _TilingAndOffset_d8c83d87b12649f7b6a3902973c4457a_Out_3);
            float _Property_2792df33a4d44e20b2f71fe244d5f369_Out_0 = _Base_Scale;
            float _GradientNoise_702d412fe90e4c64b91e9defbe1ffff2_Out_2;
            Unity_GradientNoise_float(_TilingAndOffset_d8c83d87b12649f7b6a3902973c4457a_Out_3, _Property_2792df33a4d44e20b2f71fe244d5f369_Out_0, _GradientNoise_702d412fe90e4c64b91e9defbe1ffff2_Out_2);
            float _Property_a965b78b3be84255ae4ff1617bd2df01_Out_0 = _BaseStrength;
            float _Multiply_9880df30952a454781c1f0c8356100dd_Out_2;
            Unity_Multiply_float_float(_GradientNoise_702d412fe90e4c64b91e9defbe1ffff2_Out_2, _Property_a965b78b3be84255ae4ff1617bd2df01_Out_0, _Multiply_9880df30952a454781c1f0c8356100dd_Out_2);
            float _Add_98d9cdbb65e44e0282692d35bd9d237b_Out_2;
            Unity_Add_float(_Smoothstep_6babd4aa745b40db842b941b96adf7e9_Out_3, _Multiply_9880df30952a454781c1f0c8356100dd_Out_2, _Add_98d9cdbb65e44e0282692d35bd9d237b_Out_2);
            float _Add_d305fd085a9b459da3d4bd5108430b3f_Out_2;
            Unity_Add_float(1, _Property_a965b78b3be84255ae4ff1617bd2df01_Out_0, _Add_d305fd085a9b459da3d4bd5108430b3f_Out_2);
            float _Divide_55db7b7a0b8b481d83fb512a13a2dba6_Out_2;
            Unity_Divide_float(_Add_98d9cdbb65e44e0282692d35bd9d237b_Out_2, _Add_d305fd085a9b459da3d4bd5108430b3f_Out_2, _Divide_55db7b7a0b8b481d83fb512a13a2dba6_Out_2);
            float3 _Multiply_639bbd01ca0947fdbb4245744090b06e_Out_2;
            Unity_Multiply_float3_float3(IN.ObjectSpaceNormal, (_Divide_55db7b7a0b8b481d83fb512a13a2dba6_Out_2.xxx), _Multiply_639bbd01ca0947fdbb4245744090b06e_Out_2);
            float _Property_8b198d3112494fb98defdd5dc1b13601_Out_0 = _Vertexoffset;
            float3 _Multiply_2119a238e1d14c34879c4926fe468be5_Out_2;
            Unity_Multiply_float3_float3(_Multiply_639bbd01ca0947fdbb4245744090b06e_Out_2, (_Property_8b198d3112494fb98defdd5dc1b13601_Out_0.xxx), _Multiply_2119a238e1d14c34879c4926fe468be5_Out_2);
            float3 _Add_18a07d3e52a847f594f01810747a3393_Out_2;
            Unity_Add_float3(IN.ObjectSpacePosition, _Multiply_2119a238e1d14c34879c4926fe468be5_Out_2, _Add_18a07d3e52a847f594f01810747a3393_Out_2);
            float3 _Add_b9cf96b2dcd84792b2e40dd036537586_Out_2;
            Unity_Add_float3(_Multiply_22e187ffacc7402bbe63087272b7efb5_Out_2, _Add_18a07d3e52a847f594f01810747a3393_Out_2, _Add_b9cf96b2dcd84792b2e40dd036537586_Out_2);
            description.Position = _Add_b9cf96b2dcd84792b2e40dd036537586_Out_2;
            description.Normal = IN.ObjectSpaceNormal;
            description.Tangent = IN.ObjectSpaceTangent;
            return description;
        }
        
            // Graph Pixel
            struct SurfaceDescription
        {
            float Alpha;
        };
        
        SurfaceDescription SurfaceDescriptionFunction(SurfaceDescriptionInputs IN)
        {
            SurfaceDescription surface = (SurfaceDescription)0;
            float _SceneDepth_619a7e0097894c29ba4557fde6cbb174_Out_1;
            Unity_SceneDepth_Eye_float(float4(IN.ScreenPosition.xy / IN.ScreenPosition.w, 0, 0), _SceneDepth_619a7e0097894c29ba4557fde6cbb174_Out_1);
            float4 _ScreenPosition_ee728e739f744068b0d15c1205d618a0_Out_0 = IN.ScreenPosition;
            float _Split_d5d8a30c527c46a19ab94602c057016e_R_1 = _ScreenPosition_ee728e739f744068b0d15c1205d618a0_Out_0[0];
            float _Split_d5d8a30c527c46a19ab94602c057016e_G_2 = _ScreenPosition_ee728e739f744068b0d15c1205d618a0_Out_0[1];
            float _Split_d5d8a30c527c46a19ab94602c057016e_B_3 = _ScreenPosition_ee728e739f744068b0d15c1205d618a0_Out_0[2];
            float _Split_d5d8a30c527c46a19ab94602c057016e_A_4 = _ScreenPosition_ee728e739f744068b0d15c1205d618a0_Out_0[3];
            float _Subtract_07eb78fa00d74ade84172a64a4a4616c_Out_2;
            Unity_Subtract_float(_Split_d5d8a30c527c46a19ab94602c057016e_A_4, 1, _Subtract_07eb78fa00d74ade84172a64a4a4616c_Out_2);
            float _Subtract_3ef0962257844c2c87b9ff8d165099f3_Out_2;
            Unity_Subtract_float(_SceneDepth_619a7e0097894c29ba4557fde6cbb174_Out_1, _Subtract_07eb78fa00d74ade84172a64a4a4616c_Out_2, _Subtract_3ef0962257844c2c87b9ff8d165099f3_Out_2);
            float _Property_9167e3d66076450baeb620b8f8b66552_Out_0 = _Depth_Fade;
            float _Divide_9a1ae8922923443883cbd9e71941de32_Out_2;
            Unity_Divide_float(_Subtract_3ef0962257844c2c87b9ff8d165099f3_Out_2, _Property_9167e3d66076450baeb620b8f8b66552_Out_0, _Divide_9a1ae8922923443883cbd9e71941de32_Out_2);
            float _Saturate_791ce4d2963e420ba68a97fca0bef8f9_Out_1;
            Unity_Saturate_float(_Divide_9a1ae8922923443883cbd9e71941de32_Out_2, _Saturate_791ce4d2963e420ba68a97fca0bef8f9_Out_1);
            surface.Alpha = _Saturate_791ce4d2963e420ba68a97fca0bef8f9_Out_1;
            return surface;
        }
        
            // --------------------------------------------------
            // Build Graph Inputs
            #ifdef HAVE_VFX_MODIFICATION
            #define VFX_SRP_ATTRIBUTES AttributesMesh
            #define VaryingsMeshType VaryingsMeshToPS
            #define VFX_SRP_VARYINGS VaryingsMeshType
            #define VFX_SRP_SURFACE_INPUTS FragInputs
            #endif
            
        VertexDescriptionInputs AttributesMeshToVertexDescriptionInputs(AttributesMesh input)
        {
            VertexDescriptionInputs output;
            ZERO_INITIALIZE(VertexDescriptionInputs, output);
        
            output.ObjectSpaceNormal =                          input.normalOS;
            output.ObjectSpaceTangent =                         input.tangentOS.xyz;
            output.ObjectSpacePosition =                        input.positionOS;
            output.TimeParameters =                             _TimeParameters.xyz; // Note: in case of animation this will be overwrite (allow to handle motion vector)
        
            return output;
        }
        
        VertexDescription GetVertexDescription(AttributesMesh input, float3 timeParameters
        #ifdef HAVE_VFX_MODIFICATION
            , AttributesElement element
        #endif
        )
        {
            // build graph inputs
            VertexDescriptionInputs vertexDescriptionInputs = AttributesMeshToVertexDescriptionInputs(input);
            // Override time parameters with used one (This is required to correctly handle motion vector for vertex animation based on time)
            vertexDescriptionInputs.TimeParameters = timeParameters;
        
            // evaluate vertex graph
        #ifdef HAVE_VFX_MODIFICATION
            GraphProperties properties;
            ZERO_INITIALIZE(GraphProperties, properties);
        
            // Fetch the vertex graph properties for the particle instance.
            GetElementVertexProperties(element, properties);
        
            VertexDescription vertexDescription = VertexDescriptionFunction(vertexDescriptionInputs, properties);
        #else
            VertexDescription vertexDescription = VertexDescriptionFunction(vertexDescriptionInputs);
        #endif
            return vertexDescription;
        
        }
        
        AttributesMesh ApplyMeshModification(AttributesMesh input, float3 timeParameters
        #ifdef USE_CUSTOMINTERP_SUBSTRUCT
            #ifdef TESSELLATION_ON
            , inout VaryingsMeshToDS varyings
            #else
            , inout VaryingsMeshToPS varyings
            #endif
        #endif
        #ifdef HAVE_VFX_MODIFICATION
                , AttributesElement element
        #endif
            )
        {
            VertexDescription vertexDescription = GetVertexDescription(input, timeParameters
        #ifdef HAVE_VFX_MODIFICATION
                , element
        #endif
            );
        
            // copy graph output to the results
            input.positionOS = vertexDescription.Position;
            input.normalOS = vertexDescription.Normal;
            input.tangentOS.xyz = vertexDescription.Tangent;
        
            
        
            return input;
        }
        
        #if defined(_ADD_CUSTOM_VELOCITY) // For shader graph custom velocity
        // Return precomputed Velocity in object space
        float3 GetCustomVelocity(AttributesMesh input
        #ifdef HAVE_VFX_MODIFICATION
            , AttributesElement element
        #endif
        )
        {
            VertexDescription vertexDescription = GetVertexDescription(input, _TimeParameters.xyz
        #ifdef HAVE_VFX_MODIFICATION
                , element
        #endif
            );
            return vertexDescription.CustomVelocity;
        }
        #endif
        
        FragInputs BuildFragInputs(VaryingsMeshToPS input)
        {
            FragInputs output;
            ZERO_INITIALIZE(FragInputs, output);
        
            // Init to some default value to make the computer quiet (else it output 'divide by zero' warning even if value is not used).
            // TODO: this is a really poor workaround, but the variable is used in a bunch of places
            // to compute normals which are then passed on elsewhere to compute other values...
            output.tangentToWorld = k_identity3x3;
            output.positionSS = input.positionCS;       // input.positionCS is SV_Position
        
            output.positionRWS =                input.positionRWS;
        
        #ifdef HAVE_VFX_MODIFICATION
            // FragInputs from VFX come from two places: Interpolator or CBuffer.
            /* WARNING: $splice Could not find named fragment 'VFXSetFragInputs' */
        
        #endif
        
            // splice point to copy custom interpolator fields from varyings to frag inputs
            
        
            return output;
        }
        
        // existing HDRP code uses the combined function to go directly from packed to frag inputs
        FragInputs UnpackVaryingsMeshToFragInputs(PackedVaryingsMeshToPS input)
        {
            UNITY_SETUP_INSTANCE_ID(input);
            VaryingsMeshToPS unpacked = UnpackVaryingsMeshToPS(input);
            return BuildFragInputs(unpacked);
        }
            SurfaceDescriptionInputs FragInputsToSurfaceDescriptionInputs(FragInputs input, float3 viewWS)
        {
            SurfaceDescriptionInputs output;
            ZERO_INITIALIZE(SurfaceDescriptionInputs, output);
        
            #if defined(SHADER_STAGE_RAY_TRACING)
            #else
            #endif
            output.WorldSpacePosition =                         input.positionRWS;
            output.ScreenPosition =                             ComputeScreenPos(TransformWorldToHClip(input.positionRWS), _ProjectionParams.x);
        
            // splice point to copy frag inputs custom interpolator pack into the SDI
            
        
            return output;
        }
        
            // --------------------------------------------------
            // Build Surface Data (Specific Material)
        
        void BuildSurfaceData(FragInputs fragInputs, inout SurfaceDescription surfaceDescription, float3 V, PositionInputs posInput, out SurfaceData surfaceData)
        {
            // setup defaults -- these are used if the graph doesn't output a value
            ZERO_INITIALIZE(SurfaceData, surfaceData);
        
            // copy across graph values, if defined
        
            #ifdef WRITE_NORMAL_BUFFER
            // When we need to export the normal (in the depth prepass, we write the geometry one)
            surfaceData.normalWS = fragInputs.tangentToWorld[2];
            #endif
        
            #if defined(DEBUG_DISPLAY)
            if (_DebugMipMapMode != DEBUGMIPMAPMODE_NONE)
            {
                // TODO
            }
            #endif
        
            #ifdef _ENABLE_SHADOW_MATTE
        
                #if (SHADERPASS == SHADERPASS_FORWARD_UNLIT) || (SHADERPASS == SHADERPASS_RAYTRACING_GBUFFER) || (SHADERPASS == SHADERPASS_RAYTRACING_INDIRECT) || (SHADERPASS == SHADERPASS_RAYTRACING_FORWARD)
        
                    HDShadowContext shadowContext = InitShadowContext();
        
                    // Evaluate the shadow, the normal is guaranteed if shadow matte is enabled on this shader.
                    float3 shadow3;
                    ShadowLoopMin(shadowContext, posInput, normalize(fragInputs.tangentToWorld[2]), asuint(_ShadowMatteFilter), GetMeshRenderingLightLayer(), shadow3);
        
                    // Compute the average value in the fourth channel
                    float4 shadow = float4(shadow3, dot(shadow3, float3(1.0/3.0, 1.0/3.0, 1.0/3.0)));
        
                    float4 shadowColor = (1.0 - shadow) * surfaceDescription.ShadowTint.rgba;
                    float  localAlpha  = saturate(shadowColor.a + surfaceDescription.Alpha);
        
                    // Keep the nested lerp
                    // With no Color (bsdfData.color.rgb, bsdfData.color.a == 0.0f), just use ShadowColor*Color to avoid a ring of "white" around the shadow
                    // And mix color to consider the Color & ShadowColor alpha (from texture or/and color picker)
                    #ifdef _SURFACE_TYPE_TRANSPARENT
                        surfaceData.color = lerp(shadowColor.rgb * surfaceData.color, lerp(lerp(shadowColor.rgb, surfaceData.color, 1.0 - surfaceDescription.ShadowTint.a), surfaceData.color, shadow.rgb), surfaceDescription.Alpha);
                    #else
                        surfaceData.color = lerp(lerp(shadowColor.rgb, surfaceData.color, 1.0 - surfaceDescription.ShadowTint.a), surfaceData.color, shadow.rgb);
                    #endif
                    localAlpha = ApplyBlendMode(surfaceData.color, localAlpha).a;
        
                    surfaceDescription.Alpha = localAlpha;
        
                #elif SHADERPASS == SHADERPASS_PATH_TRACING
        
                    surfaceData.normalWS = fragInputs.tangentToWorld[2];
                    surfaceData.shadowTint = surfaceDescription.ShadowTint.rgba;
        
                #endif
        
            #endif // _ENABLE_SHADOW_MATTE
        }
        
            // --------------------------------------------------
            // Get Surface And BuiltinData
        
            void GetSurfaceAndBuiltinData(FragInputs fragInputs, float3 V, inout PositionInputs posInput, out SurfaceData surfaceData, out BuiltinData builtinData RAY_TRACING_OPTIONAL_PARAMETERS)
            {
                // Don't dither if displaced tessellation (we're fading out the displacement instead to match the next LOD)
                #if !defined(SHADER_STAGE_RAY_TRACING) && !defined(_TESSELLATION_DISPLACEMENT)
                #ifdef LOD_FADE_CROSSFADE // enable dithering LOD transition if user select CrossFade transition in LOD group
                LODDitheringTransition(ComputeFadeMaskSeed(V, posInput.positionSS), unity_LODFade.x);
                #endif
                #endif
        
                #ifndef SHADER_UNLIT
                #ifdef _DOUBLESIDED_ON
                    float3 doubleSidedConstants = _DoubleSidedConstants.xyz;
                #else
                    float3 doubleSidedConstants = float3(1.0, 1.0, 1.0);
                #endif
        
                ApplyDoubleSidedFlipOrMirror(fragInputs, doubleSidedConstants); // Apply double sided flip on the vertex normal
                #endif // SHADER_UNLIT
        
                SurfaceDescriptionInputs surfaceDescriptionInputs = FragInputsToSurfaceDescriptionInputs(fragInputs, V);
        
                #if defined(HAVE_VFX_MODIFICATION)
                GraphProperties properties;
                ZERO_INITIALIZE(GraphProperties, properties);
        
                GetElementPixelProperties(fragInputs, properties);
        
                SurfaceDescription surfaceDescription = SurfaceDescriptionFunction(surfaceDescriptionInputs, properties);
                #else
                SurfaceDescription surfaceDescription = SurfaceDescriptionFunction(surfaceDescriptionInputs);
                #endif
        
                // Perform alpha test very early to save performance (a killed pixel will not sample textures)
                // TODO: split graph evaluation to grab just alpha dependencies first? tricky..
                #ifdef _ALPHATEST_ON
                    float alphaCutoff = surfaceDescription.AlphaClipThreshold;
                    #if SHADERPASS == SHADERPASS_TRANSPARENT_DEPTH_PREPASS
                    // The TransparentDepthPrepass is also used with SSR transparent.
                    // If an artists enable transaprent SSR but not the TransparentDepthPrepass itself, then we use AlphaClipThreshold
                    // otherwise if TransparentDepthPrepass is enabled we use AlphaClipThresholdDepthPrepass
                    #elif SHADERPASS == SHADERPASS_TRANSPARENT_DEPTH_POSTPASS
                    // DepthPostpass always use its own alpha threshold
                    alphaCutoff = surfaceDescription.AlphaClipThresholdDepthPostpass;
                    #elif (SHADERPASS == SHADERPASS_SHADOWS) || (SHADERPASS == SHADERPASS_RAYTRACING_VISIBILITY)
                    // If use shadow threshold isn't enable we don't allow any test
                    #endif
        
                    GENERIC_ALPHA_TEST(surfaceDescription.Alpha, alphaCutoff);
                #endif
        
                #if !defined(SHADER_STAGE_RAY_TRACING) && _DEPTHOFFSET_ON
                ApplyDepthOffsetPositionInput(V, surfaceDescription.DepthOffset, GetViewForwardDir(), GetWorldToHClipMatrix(), posInput);
                #endif
        
                #ifndef SHADER_UNLIT
                float3 bentNormalWS;
                BuildSurfaceData(fragInputs, surfaceDescription, V, posInput, surfaceData, bentNormalWS);
        
                #ifdef FRAG_INPUTS_USE_TEXCOORD1
                    float4 lightmapTexCoord1 = fragInputs.texCoord1;
                #else
                    float4 lightmapTexCoord1 = float4(0,0,0,0);
                #endif
        
                #ifdef FRAG_INPUTS_USE_TEXCOORD2
                    float4 lightmapTexCoord2 = fragInputs.texCoord2;
                #else
                    float4 lightmapTexCoord2 = float4(0,0,0,0);
                #endif
        
                // Builtin Data
                // For back lighting we use the oposite vertex normal
                InitBuiltinData(posInput, surfaceDescription.Alpha, bentNormalWS, -fragInputs.tangentToWorld[2], lightmapTexCoord1, lightmapTexCoord2, builtinData);
        
                #else
                BuildSurfaceData(fragInputs, surfaceDescription, V, posInput, surfaceData);
        
                ZERO_BUILTIN_INITIALIZE(builtinData); // No call to InitBuiltinData as we don't have any lighting
                builtinData.opacity = surfaceDescription.Alpha;
        
                #if defined(DEBUG_DISPLAY)
                    // Light Layers are currently not used for the Unlit shader (because it is not lit)
                    // But Unlit objects do cast shadows according to their rendering layer mask, which is what we want to
                    // display in the light layers visualization mode, therefore we need the renderingLayers
                    builtinData.renderingLayers = GetMeshRenderingLightLayer();
                #endif
        
                #endif // SHADER_UNLIT
        
                #ifdef _ALPHATEST_ON
                    // Used for sharpening by alpha to mask - Alpha to covertage is only used with depth only and forward pass (no shadow pass, no transparent pass)
                    builtinData.alphaClipTreshold = alphaCutoff;
                #endif
        
                // override sampleBakedGI - not used by Unlit
        
        
                // Note this will not fully work on transparent surfaces (can check with _SURFACE_TYPE_TRANSPARENT define)
                // We will always overwrite vt feeback with the nearest. So behind transparent surfaces vt will not be resolved
                // This is a limitation of the current MRT approach.
                #ifdef UNITY_VIRTUAL_TEXTURING
                #endif
        
                #if _DEPTHOFFSET_ON
                builtinData.depthOffset = surfaceDescription.DepthOffset;
                #endif
        
                // TODO: We should generate distortion / distortionBlur for non distortion pass
                #if (SHADERPASS == SHADERPASS_DISTORTION)
                builtinData.distortion = surfaceDescription.Distortion;
                builtinData.distortionBlur = surfaceDescription.DistortionBlur;
                #endif
        
                #ifndef SHADER_UNLIT
                // PostInitBuiltinData call ApplyDebugToBuiltinData
                PostInitBuiltinData(V, posInput, surfaceData, builtinData);
                #else
                ApplyDebugToBuiltinData(builtinData);
                #endif
        
                RAY_TRACING_OPTIONAL_ALPHA_TEST_PASS
            }
        
            // --------------------------------------------------
            // Main
        
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/ShaderPass/ShaderPassDepthOnly.hlsl"
        
            // --------------------------------------------------
            // Visual Effect Vertex Invocations
        
        	#ifdef HAVE_VFX_MODIFICATION
        	#include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/VisualEffectVertex.hlsl"
        	#endif
        
            ENDHLSL
        }
        Pass
        {
            Name "META"
            Tags
            {
                "LightMode" = "META"
            }
        
            // Render State
            Cull Off
        
            // Debug
            // <None>
        
            // --------------------------------------------------
            // Pass
        
            HLSLPROGRAM
        
            // Pragmas
            #pragma instancing_options renderinglayer
        #pragma target 4.5
        #pragma vertex Vert
        #pragma fragment Frag
        #pragma only_renderers d3d11 playstation xboxone xboxseries vulkan metal switch
        #pragma multi_compile_instancing
        
            // Keywords
            #pragma shader_feature _ EDITOR_VISUALIZATION
        #pragma shader_feature _ _SURFACE_TYPE_TRANSPARENT
        #pragma shader_feature_local _BLENDMODE_OFF _BLENDMODE_ALPHA _BLENDMODE_ADD _BLENDMODE_PRE_MULTIPLY
        #pragma shader_feature_local _ _ADD_PRECOMPUTED_VELOCITY
        #pragma shader_feature_local _ _TRANSPARENT_WRITES_MOTION_VEC
        #pragma shader_feature_local_fragment _ _ENABLE_FOG_ON_TRANSPARENT
            // GraphKeywords: <None>
        
            // Early Instancing Defines
            // DotsInstancingOptions: <None>
        
            // Injected Instanced Properties (must be included before UnityInstancing.hlsl)
            // HybridV1InjectedBuiltinProperties: <None>
        
            // For custom interpolators to inject a substruct definition before FragInputs definition,
            // allowing for FragInputs to capture CI's intended for ShaderGraph's SDI.
            /* WARNING: $splice Could not find named fragment 'CustomInterpolatorPreInclude' */
        
        
            // TODO: Merge FragInputsVFX substruct with CustomInterpolators.
        	#ifdef HAVE_VFX_MODIFICATION
        	struct FragInputsVFX
            {
                /* WARNING: $splice Could not find named fragment 'FragInputsVFX' */
            };
            #endif
        
            #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Common.hlsl"
        	#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/GeometricTools.hlsl" // Required by Tessellation.hlsl
        	#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Tessellation.hlsl"
            #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Texture.hlsl"
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderVariables.hlsl"
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/ShaderPass/ShaderPass.cs.hlsl"
            #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/TextureStack.hlsl" // Required to be include before we include properties as it define DECLARE_STACK_CB
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderGraphHeader.hlsl" // Need to be here for Gradient struct definition
        
            // --------------------------------------------------
            // Defines
        
            // Attribute
            #define ATTRIBUTES_NEED_NORMAL
            #define ATTRIBUTES_NEED_TANGENT
            #define ATTRIBUTES_NEED_TEXCOORD0
            #define ATTRIBUTES_NEED_TEXCOORD1
            #define ATTRIBUTES_NEED_TEXCOORD2
            #define ATTRIBUTES_NEED_TEXCOORD3
            #define VARYINGS_NEED_POSITION_WS
            #define VARYINGS_NEED_POSITIONPREDISPLACEMENT_WS
            #define VARYINGS_NEED_TANGENT_TO_WORLD
            #define VARYINGS_NEED_TEXCOORD0
            #define VARYINGS_NEED_TEXCOORD1
            #define VARYINGS_NEED_TEXCOORD2
            #define VARYINGS_NEED_TEXCOORD3
        
            #define HAVE_MESH_MODIFICATION
        
            //Strip down the FragInputs.hlsl (on graphics), so we can only optimize the interpolators we use.
            //if by accident something requests contents of FragInputs.hlsl, it will be caught as a compiler error
            //Frag inputs stripping is only enabled when FRAG_INPUTS_ENABLE_STRIPPING is set
            #if !defined(SHADER_STAGE_RAY_TRACING) && SHADERPASS != SHADERPASS_RAYTRACING_GBUFFER && SHADERPASS != SHADERPASS_FULL_SCREEN_DEBUG
            #define FRAG_INPUTS_ENABLE_STRIPPING
            #endif
            #define FRAG_INPUTS_USE_TEXCOORD0
            #define FRAG_INPUTS_USE_TEXCOORD1
            #define FRAG_INPUTS_USE_TEXCOORD2
            #define FRAG_INPUTS_USE_TEXCOORD3
        
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/ShaderPass/FragInputs.hlsl"
        
        
        
            #define SHADERPASS SHADERPASS_LIGHT_TRANSPORT
        #define RAYTRACING_SHADER_GRAPH_DEFAULT
        #define REQUIRE_DEPTH_TEXTURE
        
        
            // Following two define are a workaround introduce in 10.1.x for RaytracingQualityNode
            // The ShaderGraph don't support correctly migration of this node as it serialize all the node data
            // in the json file making it impossible to uprgrade. Until we get a fix, we do a workaround here
            // to still allow us to rename the field and keyword of this node without breaking existing code.
            #ifdef RAYTRACING_SHADER_GRAPH_DEFAULT
            #define RAYTRACING_SHADER_GRAPH_HIGH
            #endif
        
            #ifdef RAYTRACING_SHADER_GRAPH_RAYTRACED
            #define RAYTRACING_SHADER_GRAPH_LOW
            #endif
            // end
        
            #ifndef SHADER_UNLIT
            // We need isFrontFace when using double sided - it is not required for unlit as in case of unlit double sided only drive the cullmode
            // VARYINGS_NEED_CULLFACE can be define by VaryingsMeshToPS.FaceSign input if a IsFrontFace Node is included in the shader graph.
            #if defined(_DOUBLESIDED_ON) && !defined(VARYINGS_NEED_CULLFACE)
                #define VARYINGS_NEED_CULLFACE
            #endif
            #endif
        
            // Specific Material Define
        // Setup a define to say we are an unlit shader
        #define SHADER_UNLIT
        
        // Following Macro are only used by Unlit material
        #if defined(_ENABLE_SHADOW_MATTE) && (SHADERPASS == SHADERPASS_FORWARD_UNLIT || SHADERPASS == SHADERPASS_PATH_TRACING)
        #define LIGHTLOOP_DISABLE_TILE_AND_CLUSTER
        #define HAS_LIGHTLOOP
        #endif
            // Caution: we can use the define SHADER_UNLIT onlit after the above Material include as it is the Unlit template who define it
        
            // To handle SSR on transparent correctly with a possibility to enable/disable it per framesettings
            // we should have a code like this:
            // if !defined(_DISABLE_SSR_TRANSPARENT)
            // pragma multi_compile _ WRITE_NORMAL_BUFFER
            // endif
            // i.e we enable the multicompile only if we can receive SSR or not, and then C# code drive
            // it based on if SSR transparent in frame settings and not (and stripper can strip it).
            // this is currently not possible with our current preprocessor as _DISABLE_SSR_TRANSPARENT is a keyword not a define
            // so instead we used this and chose to pay the extra cost of normal write even if SSR transaprent is disabled.
            // Ideally the shader graph generator should handle it but condition below can't be handle correctly for now.
            #if SHADERPASS == SHADERPASS_TRANSPARENT_DEPTH_PREPASS
            #if !defined(_DISABLE_SSR_TRANSPARENT) && !defined(SHADER_UNLIT)
                #define WRITE_NORMAL_BUFFER
            #endif
            #endif
        
            #ifndef DEBUG_DISPLAY
                // In case of opaque we don't want to perform the alpha test, it is done in depth prepass and we use depth equal for ztest (setup from UI)
                // Don't do it with debug display mode as it is possible there is no depth prepass in this case
                #if !defined(_SURFACE_TYPE_TRANSPARENT)
                    #if SHADERPASS == SHADERPASS_FORWARD
                    #define SHADERPASS_FORWARD_BYPASS_ALPHA_TEST
                    #elif SHADERPASS == SHADERPASS_GBUFFER
                    #define SHADERPASS_GBUFFER_BYPASS_ALPHA_TEST
                    #endif
                #endif
            #endif
        
            // Define _DEFERRED_CAPABLE_MATERIAL for shader capable to run in deferred pass
            #if defined(SHADER_LIT) && !defined(_SURFACE_TYPE_TRANSPARENT)
                #define _DEFERRED_CAPABLE_MATERIAL
            #endif
        
            // Translate transparent motion vector define
            #if defined(_TRANSPARENT_WRITES_MOTION_VEC) && defined(_SURFACE_TYPE_TRANSPARENT)
                #define _WRITE_TRANSPARENT_MOTION_VECTOR
            #endif
        
            // -- Graph Properties
            CBUFFER_START(UnityPerMaterial)
        float4 _Rotate_Projection;
        float _Noise_Scale;
        float _Speed;
        float _Vertexoffset;
        float4 _Remap_xy_zw;
        float4 _Color_Peak;
        float4 _Color_Valley;
        float _SmoothEdge1;
        float _SmoothEdge2;
        float _Cloud_Pow;
        float _Base_Scale;
        float _Base_Speed;
        float _BaseStrength;
        float _Emission_Strength;
        float _Curvate_Radius;
        float _Fresnel_Power;
        float _Fresnel_Opacity;
        float _Depth_Fade;
        float4 _EmissionColor;
        float _UseShadowThreshold;
        float4 _DoubleSidedConstants;
        float _BlendMode;
        float _EnableBlendModePreserveSpecularLighting;
        CBUFFER_END
        
        // Object and Global properties
        
            // -- Property used by ScenePickingPass
            #ifdef SCENEPICKINGPASS
            float4 _SelectionID;
            #endif
        
            // -- Properties used by SceneSelectionPass
            #ifdef SCENESELECTIONPASS
            int _ObjectId;
            int _PassValue;
            #endif
        
            // Includes
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/Debug/DebugDisplay.hlsl"
        #include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Material.hlsl"
        #include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Unlit/Unlit.hlsl"
        #include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/BuiltinUtilities.hlsl"
        #include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/MaterialUtilities.hlsl"
        #include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderGraphFunctions.hlsl"
        	// GraphIncludes: <None>
        
            // --------------------------------------------------
            // Structs and Packing
        
            struct AttributesMesh
        {
             float3 positionOS : POSITION;
             float3 normalOS : NORMAL;
             float4 tangentOS : TANGENT;
             float4 uv0 : TEXCOORD0;
             float4 uv1 : TEXCOORD1;
             float4 uv2 : TEXCOORD2;
             float4 uv3 : TEXCOORD3;
            #if UNITY_ANY_INSTANCING_ENABLED
             uint instanceID : INSTANCEID_SEMANTIC;
            #endif
        };
        struct VaryingsMeshToPS
        {
            SV_POSITION_QUALIFIERS float4 positionCS : SV_POSITION;
             float3 positionRWS;
             float3 positionPredisplacementRWS;
             float3 normalWS;
             float4 tangentWS;
             float4 texCoord0;
             float4 texCoord1;
             float4 texCoord2;
             float4 texCoord3;
            #if UNITY_ANY_INSTANCING_ENABLED
             uint instanceID : CUSTOM_INSTANCE_ID;
            #endif
        };
        struct VertexDescriptionInputs
        {
        };
        struct SurfaceDescriptionInputs
        {
             float3 WorldSpaceNormal;
             float3 WorldSpaceViewDirection;
             float3 ObjectSpacePosition;
             float3 WorldSpacePosition;
             float4 ScreenPosition;
             float3 TimeParameters;
        };
        struct PackedVaryingsMeshToPS
        {
            SV_POSITION_QUALIFIERS float4 positionCS : SV_POSITION;
             float3 interp0 : INTERP0;
             float3 interp1 : INTERP1;
             float3 interp2 : INTERP2;
             float4 interp3 : INTERP3;
             float4 interp4 : INTERP4;
             float4 interp5 : INTERP5;
             float4 interp6 : INTERP6;
             float4 interp7 : INTERP7;
            #if UNITY_ANY_INSTANCING_ENABLED
             uint instanceID : CUSTOM_INSTANCE_ID;
            #endif
        };
        
            PackedVaryingsMeshToPS PackVaryingsMeshToPS (VaryingsMeshToPS input)
        {
            PackedVaryingsMeshToPS output;
            ZERO_INITIALIZE(PackedVaryingsMeshToPS, output);
            output.positionCS = input.positionCS;
            output.interp0.xyz =  input.positionRWS;
            output.interp1.xyz =  input.positionPredisplacementRWS;
            output.interp2.xyz =  input.normalWS;
            output.interp3.xyzw =  input.tangentWS;
            output.interp4.xyzw =  input.texCoord0;
            output.interp5.xyzw =  input.texCoord1;
            output.interp6.xyzw =  input.texCoord2;
            output.interp7.xyzw =  input.texCoord3;
            #if UNITY_ANY_INSTANCING_ENABLED
            output.instanceID = input.instanceID;
            #endif
            return output;
        }
        
        VaryingsMeshToPS UnpackVaryingsMeshToPS (PackedVaryingsMeshToPS input)
        {
            VaryingsMeshToPS output;
            output.positionCS = input.positionCS;
            output.positionRWS = input.interp0.xyz;
            output.positionPredisplacementRWS = input.interp1.xyz;
            output.normalWS = input.interp2.xyz;
            output.tangentWS = input.interp3.xyzw;
            output.texCoord0 = input.interp4.xyzw;
            output.texCoord1 = input.interp5.xyzw;
            output.texCoord2 = input.interp6.xyzw;
            output.texCoord3 = input.interp7.xyzw;
            #if UNITY_ANY_INSTANCING_ENABLED
            output.instanceID = input.instanceID;
            #endif
            return output;
        }
        
        
            // --------------------------------------------------
            // Graph
        
        
            // Graph Functions
            
        void Unity_Rotate_About_Axis_Radians_float(float3 In, float3 Axis, float Rotation, out float3 Out)
        {
            float s = sin(Rotation);
            float c = cos(Rotation);
            float one_minus_c = 1.0 - c;
        
            Axis = normalize(Axis);
        
            float3x3 rot_mat = { one_minus_c * Axis.x * Axis.x + c,            one_minus_c * Axis.x * Axis.y - Axis.z * s,     one_minus_c * Axis.z * Axis.x + Axis.y * s,
                                      one_minus_c * Axis.x * Axis.y + Axis.z * s,   one_minus_c * Axis.y * Axis.y + c,              one_minus_c * Axis.y * Axis.z - Axis.x * s,
                                      one_minus_c * Axis.z * Axis.x - Axis.y * s,   one_minus_c * Axis.y * Axis.z + Axis.x * s,     one_minus_c * Axis.z * Axis.z + c
                                    };
        
            Out = mul(rot_mat,  In);
        }
        
        void Unity_Multiply_float_float(float A, float B, out float Out)
        {
            Out = A * B;
        }
        
        void Unity_TilingAndOffset_float(float2 UV, float2 Tiling, float2 Offset, out float2 Out)
        {
            Out = UV * Tiling + Offset;
        }
        
        
        float2 Unity_GradientNoise_Dir_float(float2 p)
        {
            // Permutation and hashing used in webgl-nosie goo.gl/pX7HtC
            p = p % 289;
            // need full precision, otherwise half overflows when p > 1
            float x = float(34 * p.x + 1) * p.x % 289 + p.y;
            x = (34 * x + 1) * x % 289;
            x = frac(x / 41) * 2 - 1;
            return normalize(float2(x - floor(x + 0.5), abs(x) - 0.5));
        }
        
        void Unity_GradientNoise_float(float2 UV, float Scale, out float Out)
        {
            float2 p = UV * Scale;
            float2 ip = floor(p);
            float2 fp = frac(p);
            float d00 = dot(Unity_GradientNoise_Dir_float(ip), fp);
            float d01 = dot(Unity_GradientNoise_Dir_float(ip + float2(0, 1)), fp - float2(0, 1));
            float d10 = dot(Unity_GradientNoise_Dir_float(ip + float2(1, 0)), fp - float2(1, 0));
            float d11 = dot(Unity_GradientNoise_Dir_float(ip + float2(1, 1)), fp - float2(1, 1));
            fp = fp * fp * fp * (fp * (fp * 6 - 15) + 10);
            Out = lerp(lerp(d00, d01, fp.y), lerp(d10, d11, fp.y), fp.x) + 0.5;
        }
        
        void Unity_Add_float(float A, float B, out float Out)
        {
            Out = A + B;
        }
        
        void Unity_Divide_float(float A, float B, out float Out)
        {
            Out = A / B;
        }
        
        void Unity_Saturate_float(float In, out float Out)
        {
            Out = saturate(In);
        }
        
        void Unity_Power_float(float A, float B, out float Out)
        {
            Out = pow(A, B);
        }
        
        void Unity_Combine_float(float R, float G, float B, float A, out float4 RGBA, out float3 RGB, out float2 RG)
        {
            RGBA = float4(R, G, B, A);
            RGB = float3(R, G, B);
            RG = float2(R, G);
        }
        
        void Unity_Remap_float(float In, float2 InMinMax, float2 OutMinMax, out float Out)
        {
            Out = OutMinMax.x + (In - InMinMax.x) * (OutMinMax.y - OutMinMax.x) / (InMinMax.y - InMinMax.x);
        }
        
        void Unity_Absolute_float(float In, out float Out)
        {
            Out = abs(In);
        }
        
        void Unity_Smoothstep_float(float Edge1, float Edge2, float In, out float Out)
        {
            Out = smoothstep(Edge1, Edge2, In);
        }
        
        void Unity_FresnelEffect_float(float3 Normal, float3 ViewDir, float Power, out float Out)
        {
            Out = pow((1.0 - saturate(dot(normalize(Normal), normalize(ViewDir)))), Power);
        }
        
        void Unity_Lerp_float4(float4 A, float4 B, float4 T, out float4 Out)
        {
            Out = lerp(A, B, T);
        }
        
        void Unity_Add_float4(float4 A, float4 B, out float4 Out)
        {
            Out = A + B;
        }
        
        void Unity_Multiply_float4_float4(float4 A, float4 B, out float4 Out)
        {
            Out = A * B;
        }
        
        void Unity_SceneDepth_Eye_float(float4 UV, out float Out)
        {
            if (unity_OrthoParams.w == 1.0)
            {
                Out = LinearEyeDepth(ComputeWorldSpacePosition(UV.xy, SHADERGRAPH_SAMPLE_SCENE_DEPTH(UV.xy), UNITY_MATRIX_I_VP), UNITY_MATRIX_V);
            }
            else
            {
                Out = LinearEyeDepth(SHADERGRAPH_SAMPLE_SCENE_DEPTH(UV.xy), _ZBufferParams);
            }
        }
        
        void Unity_Subtract_float(float A, float B, out float Out)
        {
            Out = A - B;
        }
        
            // Graph Vertex
            struct VertexDescription
        {
        };
        
        VertexDescription VertexDescriptionFunction(VertexDescriptionInputs IN)
        {
            VertexDescription description = (VertexDescription)0;
            return description;
        }
        
            // Graph Pixel
            struct SurfaceDescription
        {
            float3 BaseColor;
            float3 Emission;
            float Alpha;
        };
        
        SurfaceDescription SurfaceDescriptionFunction(SurfaceDescriptionInputs IN)
        {
            SurfaceDescription surface = (SurfaceDescription)0;
            float _Property_7d8e49b5efe94dea8210c34a6319b1ef_Out_0 = _SmoothEdge1;
            float _Property_09307b889e8945078bacabda50cca5c6_Out_0 = _SmoothEdge2;
            float4 _Property_a8d53d7ea07349e0979b956475bdd7cc_Out_0 = _Rotate_Projection;
            float _Split_7d12b2bb5feb46d685603473d0cf5818_R_1 = _Property_a8d53d7ea07349e0979b956475bdd7cc_Out_0[0];
            float _Split_7d12b2bb5feb46d685603473d0cf5818_G_2 = _Property_a8d53d7ea07349e0979b956475bdd7cc_Out_0[1];
            float _Split_7d12b2bb5feb46d685603473d0cf5818_B_3 = _Property_a8d53d7ea07349e0979b956475bdd7cc_Out_0[2];
            float _Split_7d12b2bb5feb46d685603473d0cf5818_A_4 = _Property_a8d53d7ea07349e0979b956475bdd7cc_Out_0[3];
            float3 _RotateAboutAxis_1b91481bceed4e9a82a13975af123b02_Out_3;
            Unity_Rotate_About_Axis_Radians_float(IN.ObjectSpacePosition, (_Property_a8d53d7ea07349e0979b956475bdd7cc_Out_0.xyz), _Split_7d12b2bb5feb46d685603473d0cf5818_A_4, _RotateAboutAxis_1b91481bceed4e9a82a13975af123b02_Out_3);
            float _Property_258f4645340c46f69274c9f077f1a73c_Out_0 = _Speed;
            float _Multiply_94f6d857831c4e69b53b9bfc92dd852f_Out_2;
            Unity_Multiply_float_float(IN.TimeParameters.x, _Property_258f4645340c46f69274c9f077f1a73c_Out_0, _Multiply_94f6d857831c4e69b53b9bfc92dd852f_Out_2);
            float2 _TilingAndOffset_6cb9fd57231c4a429c9c0fe5aeb7cc58_Out_3;
            Unity_TilingAndOffset_float((_RotateAboutAxis_1b91481bceed4e9a82a13975af123b02_Out_3.xy), float2 (1, 1), (_Multiply_94f6d857831c4e69b53b9bfc92dd852f_Out_2.xx), _TilingAndOffset_6cb9fd57231c4a429c9c0fe5aeb7cc58_Out_3);
            float _Property_2b9001a870d04f8eb60f5d7e1ce909c5_Out_0 = _Noise_Scale;
            float _GradientNoise_061679506b214bb8b4792ec4dfe82ec6_Out_2;
            Unity_GradientNoise_float(_TilingAndOffset_6cb9fd57231c4a429c9c0fe5aeb7cc58_Out_3, _Property_2b9001a870d04f8eb60f5d7e1ce909c5_Out_0, _GradientNoise_061679506b214bb8b4792ec4dfe82ec6_Out_2);
            float2 _TilingAndOffset_1d2491b5855e49d3b2e6b5dbe5db07d4_Out_3;
            Unity_TilingAndOffset_float((_RotateAboutAxis_1b91481bceed4e9a82a13975af123b02_Out_3.xy), float2 (1, 1), float2 (0, 0), _TilingAndOffset_1d2491b5855e49d3b2e6b5dbe5db07d4_Out_3);
            float _GradientNoise_8a27c3fb323f4db1b38f287380605198_Out_2;
            Unity_GradientNoise_float(_TilingAndOffset_1d2491b5855e49d3b2e6b5dbe5db07d4_Out_3, _Property_2b9001a870d04f8eb60f5d7e1ce909c5_Out_0, _GradientNoise_8a27c3fb323f4db1b38f287380605198_Out_2);
            float _Add_a6dd2d6e3f564decbca34ec03a419130_Out_2;
            Unity_Add_float(_GradientNoise_061679506b214bb8b4792ec4dfe82ec6_Out_2, _GradientNoise_8a27c3fb323f4db1b38f287380605198_Out_2, _Add_a6dd2d6e3f564decbca34ec03a419130_Out_2);
            float _Divide_a757ea7167f343ecaec30e69b58c9bae_Out_2;
            Unity_Divide_float(_Add_a6dd2d6e3f564decbca34ec03a419130_Out_2, 2, _Divide_a757ea7167f343ecaec30e69b58c9bae_Out_2);
            float _Saturate_f355ba5a467f4488b7ec89e8a08484a3_Out_1;
            Unity_Saturate_float(_Divide_a757ea7167f343ecaec30e69b58c9bae_Out_2, _Saturate_f355ba5a467f4488b7ec89e8a08484a3_Out_1);
            float _Property_96da655cc17e4594836aa02d74efe33c_Out_0 = _Cloud_Pow;
            float _Power_318bede735044ec6811f2a5c345b7d73_Out_2;
            Unity_Power_float(_Saturate_f355ba5a467f4488b7ec89e8a08484a3_Out_1, _Property_96da655cc17e4594836aa02d74efe33c_Out_0, _Power_318bede735044ec6811f2a5c345b7d73_Out_2);
            float4 _Property_317e8becc0724841a13cbcf8d4c4efbc_Out_0 = _Remap_xy_zw;
            float _Split_3dee68ff9a374966b7612da59c6ac20a_R_1 = _Property_317e8becc0724841a13cbcf8d4c4efbc_Out_0[0];
            float _Split_3dee68ff9a374966b7612da59c6ac20a_G_2 = _Property_317e8becc0724841a13cbcf8d4c4efbc_Out_0[1];
            float _Split_3dee68ff9a374966b7612da59c6ac20a_B_3 = _Property_317e8becc0724841a13cbcf8d4c4efbc_Out_0[2];
            float _Split_3dee68ff9a374966b7612da59c6ac20a_A_4 = _Property_317e8becc0724841a13cbcf8d4c4efbc_Out_0[3];
            float4 _Combine_4e3ec9a6e4064091bba919631e732b7a_RGBA_4;
            float3 _Combine_4e3ec9a6e4064091bba919631e732b7a_RGB_5;
            float2 _Combine_4e3ec9a6e4064091bba919631e732b7a_RG_6;
            Unity_Combine_float(_Split_3dee68ff9a374966b7612da59c6ac20a_R_1, _Split_3dee68ff9a374966b7612da59c6ac20a_G_2, 0, 0, _Combine_4e3ec9a6e4064091bba919631e732b7a_RGBA_4, _Combine_4e3ec9a6e4064091bba919631e732b7a_RGB_5, _Combine_4e3ec9a6e4064091bba919631e732b7a_RG_6);
            float4 _Combine_6f976751f1234c77908b163e59da18bb_RGBA_4;
            float3 _Combine_6f976751f1234c77908b163e59da18bb_RGB_5;
            float2 _Combine_6f976751f1234c77908b163e59da18bb_RG_6;
            Unity_Combine_float(_Split_3dee68ff9a374966b7612da59c6ac20a_B_3, _Split_3dee68ff9a374966b7612da59c6ac20a_A_4, 0, 0, _Combine_6f976751f1234c77908b163e59da18bb_RGBA_4, _Combine_6f976751f1234c77908b163e59da18bb_RGB_5, _Combine_6f976751f1234c77908b163e59da18bb_RG_6);
            float _Remap_a11bf825d8d54f198c2355e6d3cc1fba_Out_3;
            Unity_Remap_float(_Power_318bede735044ec6811f2a5c345b7d73_Out_2, _Combine_4e3ec9a6e4064091bba919631e732b7a_RG_6, _Combine_6f976751f1234c77908b163e59da18bb_RG_6, _Remap_a11bf825d8d54f198c2355e6d3cc1fba_Out_3);
            float _Absolute_553a57701af34a45a18ca7b2af677c8a_Out_1;
            Unity_Absolute_float(_Remap_a11bf825d8d54f198c2355e6d3cc1fba_Out_3, _Absolute_553a57701af34a45a18ca7b2af677c8a_Out_1);
            float _Smoothstep_6babd4aa745b40db842b941b96adf7e9_Out_3;
            Unity_Smoothstep_float(_Property_7d8e49b5efe94dea8210c34a6319b1ef_Out_0, _Property_09307b889e8945078bacabda50cca5c6_Out_0, _Absolute_553a57701af34a45a18ca7b2af677c8a_Out_1, _Smoothstep_6babd4aa745b40db842b941b96adf7e9_Out_3);
            float _Property_17631cb6b51c44b593b4fb1f0ac8fa75_Out_0 = _Base_Speed;
            float _Multiply_2e98faddc46143bea8e48ab17d0e1c15_Out_2;
            Unity_Multiply_float_float(IN.TimeParameters.x, _Property_17631cb6b51c44b593b4fb1f0ac8fa75_Out_0, _Multiply_2e98faddc46143bea8e48ab17d0e1c15_Out_2);
            float2 _TilingAndOffset_d8c83d87b12649f7b6a3902973c4457a_Out_3;
            Unity_TilingAndOffset_float((_RotateAboutAxis_1b91481bceed4e9a82a13975af123b02_Out_3.xy), float2 (1, 1), (_Multiply_2e98faddc46143bea8e48ab17d0e1c15_Out_2.xx), _TilingAndOffset_d8c83d87b12649f7b6a3902973c4457a_Out_3);
            float _Property_2792df33a4d44e20b2f71fe244d5f369_Out_0 = _Base_Scale;
            float _GradientNoise_702d412fe90e4c64b91e9defbe1ffff2_Out_2;
            Unity_GradientNoise_float(_TilingAndOffset_d8c83d87b12649f7b6a3902973c4457a_Out_3, _Property_2792df33a4d44e20b2f71fe244d5f369_Out_0, _GradientNoise_702d412fe90e4c64b91e9defbe1ffff2_Out_2);
            float _Property_a965b78b3be84255ae4ff1617bd2df01_Out_0 = _BaseStrength;
            float _Multiply_9880df30952a454781c1f0c8356100dd_Out_2;
            Unity_Multiply_float_float(_GradientNoise_702d412fe90e4c64b91e9defbe1ffff2_Out_2, _Property_a965b78b3be84255ae4ff1617bd2df01_Out_0, _Multiply_9880df30952a454781c1f0c8356100dd_Out_2);
            float _Add_98d9cdbb65e44e0282692d35bd9d237b_Out_2;
            Unity_Add_float(_Smoothstep_6babd4aa745b40db842b941b96adf7e9_Out_3, _Multiply_9880df30952a454781c1f0c8356100dd_Out_2, _Add_98d9cdbb65e44e0282692d35bd9d237b_Out_2);
            float _Add_d305fd085a9b459da3d4bd5108430b3f_Out_2;
            Unity_Add_float(1, _Property_a965b78b3be84255ae4ff1617bd2df01_Out_0, _Add_d305fd085a9b459da3d4bd5108430b3f_Out_2);
            float _Divide_55db7b7a0b8b481d83fb512a13a2dba6_Out_2;
            Unity_Divide_float(_Add_98d9cdbb65e44e0282692d35bd9d237b_Out_2, _Add_d305fd085a9b459da3d4bd5108430b3f_Out_2, _Divide_55db7b7a0b8b481d83fb512a13a2dba6_Out_2);
            float _Property_5a371e38a60143fcae81da7313c1bf15_Out_0 = _Fresnel_Power;
            float _FresnelEffect_4c470240dea248acb0092676d71437cb_Out_3;
            Unity_FresnelEffect_float(IN.WorldSpaceNormal, IN.WorldSpaceViewDirection, _Property_5a371e38a60143fcae81da7313c1bf15_Out_0, _FresnelEffect_4c470240dea248acb0092676d71437cb_Out_3);
            float _Multiply_384d15a2ef094b7e8b1ec6d69dada246_Out_2;
            Unity_Multiply_float_float(_Divide_55db7b7a0b8b481d83fb512a13a2dba6_Out_2, _FresnelEffect_4c470240dea248acb0092676d71437cb_Out_3, _Multiply_384d15a2ef094b7e8b1ec6d69dada246_Out_2);
            float _Property_3c23366c651c4949b03cb10c14ae0a27_Out_0 = _Fresnel_Opacity;
            float _Multiply_9380e32f6e4644e1b42e398229c18d31_Out_2;
            Unity_Multiply_float_float(_Multiply_384d15a2ef094b7e8b1ec6d69dada246_Out_2, _Property_3c23366c651c4949b03cb10c14ae0a27_Out_0, _Multiply_9380e32f6e4644e1b42e398229c18d31_Out_2);
            float4 _Property_dff39e3157cb4a09aac968677ade995d_Out_0 = _Color_Valley;
            float4 _Property_1b300af9e23e428fa893e55f9390600d_Out_0 = _Color_Peak;
            float4 _Lerp_6d0a20bb25554e1fa8697f473485e856_Out_3;
            Unity_Lerp_float4(_Property_dff39e3157cb4a09aac968677ade995d_Out_0, _Property_1b300af9e23e428fa893e55f9390600d_Out_0, (_Add_98d9cdbb65e44e0282692d35bd9d237b_Out_2.xxxx), _Lerp_6d0a20bb25554e1fa8697f473485e856_Out_3);
            float4 _Add_6507a6920d9c478888f235ad9d0bb542_Out_2;
            Unity_Add_float4((_Multiply_9380e32f6e4644e1b42e398229c18d31_Out_2.xxxx), _Lerp_6d0a20bb25554e1fa8697f473485e856_Out_3, _Add_6507a6920d9c478888f235ad9d0bb542_Out_2);
            float _Property_9cf7107417e042afb41766bb37be827b_Out_0 = _Emission_Strength;
            float4 _Multiply_31ae534c0cc640be9fda8de7cc705bbf_Out_2;
            Unity_Multiply_float4_float4(_Add_6507a6920d9c478888f235ad9d0bb542_Out_2, (_Property_9cf7107417e042afb41766bb37be827b_Out_0.xxxx), _Multiply_31ae534c0cc640be9fda8de7cc705bbf_Out_2);
            float _SceneDepth_619a7e0097894c29ba4557fde6cbb174_Out_1;
            Unity_SceneDepth_Eye_float(float4(IN.ScreenPosition.xy / IN.ScreenPosition.w, 0, 0), _SceneDepth_619a7e0097894c29ba4557fde6cbb174_Out_1);
            float4 _ScreenPosition_ee728e739f744068b0d15c1205d618a0_Out_0 = IN.ScreenPosition;
            float _Split_d5d8a30c527c46a19ab94602c057016e_R_1 = _ScreenPosition_ee728e739f744068b0d15c1205d618a0_Out_0[0];
            float _Split_d5d8a30c527c46a19ab94602c057016e_G_2 = _ScreenPosition_ee728e739f744068b0d15c1205d618a0_Out_0[1];
            float _Split_d5d8a30c527c46a19ab94602c057016e_B_3 = _ScreenPosition_ee728e739f744068b0d15c1205d618a0_Out_0[2];
            float _Split_d5d8a30c527c46a19ab94602c057016e_A_4 = _ScreenPosition_ee728e739f744068b0d15c1205d618a0_Out_0[3];
            float _Subtract_07eb78fa00d74ade84172a64a4a4616c_Out_2;
            Unity_Subtract_float(_Split_d5d8a30c527c46a19ab94602c057016e_A_4, 1, _Subtract_07eb78fa00d74ade84172a64a4a4616c_Out_2);
            float _Subtract_3ef0962257844c2c87b9ff8d165099f3_Out_2;
            Unity_Subtract_float(_SceneDepth_619a7e0097894c29ba4557fde6cbb174_Out_1, _Subtract_07eb78fa00d74ade84172a64a4a4616c_Out_2, _Subtract_3ef0962257844c2c87b9ff8d165099f3_Out_2);
            float _Property_9167e3d66076450baeb620b8f8b66552_Out_0 = _Depth_Fade;
            float _Divide_9a1ae8922923443883cbd9e71941de32_Out_2;
            Unity_Divide_float(_Subtract_3ef0962257844c2c87b9ff8d165099f3_Out_2, _Property_9167e3d66076450baeb620b8f8b66552_Out_0, _Divide_9a1ae8922923443883cbd9e71941de32_Out_2);
            float _Saturate_791ce4d2963e420ba68a97fca0bef8f9_Out_1;
            Unity_Saturate_float(_Divide_9a1ae8922923443883cbd9e71941de32_Out_2, _Saturate_791ce4d2963e420ba68a97fca0bef8f9_Out_1);
            surface.BaseColor = (_Add_6507a6920d9c478888f235ad9d0bb542_Out_2.xyz);
            surface.Emission = (_Multiply_31ae534c0cc640be9fda8de7cc705bbf_Out_2.xyz);
            surface.Alpha = _Saturate_791ce4d2963e420ba68a97fca0bef8f9_Out_1;
            return surface;
        }
        
            // --------------------------------------------------
            // Build Graph Inputs
            #ifdef HAVE_VFX_MODIFICATION
            #define VFX_SRP_ATTRIBUTES AttributesMesh
            #define VaryingsMeshType VaryingsMeshToPS
            #define VFX_SRP_VARYINGS VaryingsMeshType
            #define VFX_SRP_SURFACE_INPUTS FragInputs
            #endif
            
        VertexDescriptionInputs AttributesMeshToVertexDescriptionInputs(AttributesMesh input)
        {
            VertexDescriptionInputs output;
            ZERO_INITIALIZE(VertexDescriptionInputs, output);
        
        
            return output;
        }
        
        VertexDescription GetVertexDescription(AttributesMesh input, float3 timeParameters
        #ifdef HAVE_VFX_MODIFICATION
            , AttributesElement element
        #endif
        )
        {
            // build graph inputs
            VertexDescriptionInputs vertexDescriptionInputs = AttributesMeshToVertexDescriptionInputs(input);
            // Override time parameters with used one (This is required to correctly handle motion vector for vertex animation based on time)
        
            // evaluate vertex graph
        #ifdef HAVE_VFX_MODIFICATION
            GraphProperties properties;
            ZERO_INITIALIZE(GraphProperties, properties);
        
            // Fetch the vertex graph properties for the particle instance.
            GetElementVertexProperties(element, properties);
        
            VertexDescription vertexDescription = VertexDescriptionFunction(vertexDescriptionInputs, properties);
        #else
            VertexDescription vertexDescription = VertexDescriptionFunction(vertexDescriptionInputs);
        #endif
            return vertexDescription;
        
        }
        
        AttributesMesh ApplyMeshModification(AttributesMesh input, float3 timeParameters
        #ifdef USE_CUSTOMINTERP_SUBSTRUCT
            #ifdef TESSELLATION_ON
            , inout VaryingsMeshToDS varyings
            #else
            , inout VaryingsMeshToPS varyings
            #endif
        #endif
        #ifdef HAVE_VFX_MODIFICATION
                , AttributesElement element
        #endif
            )
        {
            VertexDescription vertexDescription = GetVertexDescription(input, timeParameters
        #ifdef HAVE_VFX_MODIFICATION
                , element
        #endif
            );
        
            // copy graph output to the results
        
            /* WARNING: $splice Could not find named fragment 'CustomInterpolatorVertMeshCustomInterpolation' */
        
            return input;
        }
        
        #if defined(_ADD_CUSTOM_VELOCITY) // For shader graph custom velocity
        // Return precomputed Velocity in object space
        float3 GetCustomVelocity(AttributesMesh input
        #ifdef HAVE_VFX_MODIFICATION
            , AttributesElement element
        #endif
        )
        {
            VertexDescription vertexDescription = GetVertexDescription(input, _TimeParameters.xyz
        #ifdef HAVE_VFX_MODIFICATION
                , element
        #endif
            );
            return vertexDescription.CustomVelocity;
        }
        #endif
        
        FragInputs BuildFragInputs(VaryingsMeshToPS input)
        {
            FragInputs output;
            ZERO_INITIALIZE(FragInputs, output);
        
            // Init to some default value to make the computer quiet (else it output 'divide by zero' warning even if value is not used).
            // TODO: this is a really poor workaround, but the variable is used in a bunch of places
            // to compute normals which are then passed on elsewhere to compute other values...
            output.tangentToWorld = k_identity3x3;
            output.positionSS = input.positionCS;       // input.positionCS is SV_Position
        
            output.positionRWS =                input.positionRWS;
            output.positionPredisplacementRWS = input.positionPredisplacementRWS;
            output.tangentToWorld =             BuildTangentToWorld(input.tangentWS, input.normalWS);
            output.texCoord0 =                  input.texCoord0;
            output.texCoord1 =                  input.texCoord1;
            output.texCoord2 =                  input.texCoord2;
            output.texCoord3 =                  input.texCoord3;
        
        #ifdef HAVE_VFX_MODIFICATION
            // FragInputs from VFX come from two places: Interpolator or CBuffer.
            /* WARNING: $splice Could not find named fragment 'VFXSetFragInputs' */
        
        #endif
        
            // splice point to copy custom interpolator fields from varyings to frag inputs
            /* WARNING: $splice Could not find named fragment 'CustomInterpolatorVaryingsToFragInputs' */
        
            return output;
        }
        
        // existing HDRP code uses the combined function to go directly from packed to frag inputs
        FragInputs UnpackVaryingsMeshToFragInputs(PackedVaryingsMeshToPS input)
        {
            UNITY_SETUP_INSTANCE_ID(input);
            VaryingsMeshToPS unpacked = UnpackVaryingsMeshToPS(input);
            return BuildFragInputs(unpacked);
        }
            SurfaceDescriptionInputs FragInputsToSurfaceDescriptionInputs(FragInputs input, float3 viewWS)
        {
            SurfaceDescriptionInputs output;
            ZERO_INITIALIZE(SurfaceDescriptionInputs, output);
        
            output.WorldSpaceNormal =                           normalize(input.tangentToWorld[2].xyz);
            #if defined(SHADER_STAGE_RAY_TRACING)
            #else
            #endif
            output.WorldSpaceViewDirection =                    normalize(viewWS);
            output.WorldSpacePosition =                         input.positionRWS;
            output.ObjectSpacePosition =                        TransformWorldToObject(input.positionRWS);
            output.ScreenPosition =                             ComputeScreenPos(TransformWorldToHClip(input.positionRWS), _ProjectionParams.x);
            output.TimeParameters =                             _TimeParameters.xyz; // This is mainly for LW as HD overwrite this value
        
            // splice point to copy frag inputs custom interpolator pack into the SDI
            /* WARNING: $splice Could not find named fragment 'CustomInterpolatorCopyToSDI' */
        
            return output;
        }
        
            // --------------------------------------------------
            // Build Surface Data (Specific Material)
        
        void BuildSurfaceData(FragInputs fragInputs, inout SurfaceDescription surfaceDescription, float3 V, PositionInputs posInput, out SurfaceData surfaceData)
        {
            // setup defaults -- these are used if the graph doesn't output a value
            ZERO_INITIALIZE(SurfaceData, surfaceData);
        
            // copy across graph values, if defined
            surfaceData.color = surfaceDescription.BaseColor;
        
            #ifdef WRITE_NORMAL_BUFFER
            // When we need to export the normal (in the depth prepass, we write the geometry one)
            surfaceData.normalWS = fragInputs.tangentToWorld[2];
            #endif
        
            #if defined(DEBUG_DISPLAY)
            if (_DebugMipMapMode != DEBUGMIPMAPMODE_NONE)
            {
                // TODO
            }
            #endif
        
            #ifdef _ENABLE_SHADOW_MATTE
        
                #if (SHADERPASS == SHADERPASS_FORWARD_UNLIT) || (SHADERPASS == SHADERPASS_RAYTRACING_GBUFFER) || (SHADERPASS == SHADERPASS_RAYTRACING_INDIRECT) || (SHADERPASS == SHADERPASS_RAYTRACING_FORWARD)
        
                    HDShadowContext shadowContext = InitShadowContext();
        
                    // Evaluate the shadow, the normal is guaranteed if shadow matte is enabled on this shader.
                    float3 shadow3;
                    ShadowLoopMin(shadowContext, posInput, normalize(fragInputs.tangentToWorld[2]), asuint(_ShadowMatteFilter), GetMeshRenderingLightLayer(), shadow3);
        
                    // Compute the average value in the fourth channel
                    float4 shadow = float4(shadow3, dot(shadow3, float3(1.0/3.0, 1.0/3.0, 1.0/3.0)));
        
                    float4 shadowColor = (1.0 - shadow) * surfaceDescription.ShadowTint.rgba;
                    float  localAlpha  = saturate(shadowColor.a + surfaceDescription.Alpha);
        
                    // Keep the nested lerp
                    // With no Color (bsdfData.color.rgb, bsdfData.color.a == 0.0f), just use ShadowColor*Color to avoid a ring of "white" around the shadow
                    // And mix color to consider the Color & ShadowColor alpha (from texture or/and color picker)
                    #ifdef _SURFACE_TYPE_TRANSPARENT
                        surfaceData.color = lerp(shadowColor.rgb * surfaceData.color, lerp(lerp(shadowColor.rgb, surfaceData.color, 1.0 - surfaceDescription.ShadowTint.a), surfaceData.color, shadow.rgb), surfaceDescription.Alpha);
                    #else
                        surfaceData.color = lerp(lerp(shadowColor.rgb, surfaceData.color, 1.0 - surfaceDescription.ShadowTint.a), surfaceData.color, shadow.rgb);
                    #endif
                    localAlpha = ApplyBlendMode(surfaceData.color, localAlpha).a;
        
                    surfaceDescription.Alpha = localAlpha;
        
                #elif SHADERPASS == SHADERPASS_PATH_TRACING
        
                    surfaceData.normalWS = fragInputs.tangentToWorld[2];
                    surfaceData.shadowTint = surfaceDescription.ShadowTint.rgba;
        
                #endif
        
            #endif // _ENABLE_SHADOW_MATTE
        }
        
            // --------------------------------------------------
            // Get Surface And BuiltinData
        
            void GetSurfaceAndBuiltinData(FragInputs fragInputs, float3 V, inout PositionInputs posInput, out SurfaceData surfaceData, out BuiltinData builtinData RAY_TRACING_OPTIONAL_PARAMETERS)
            {
                // Don't dither if displaced tessellation (we're fading out the displacement instead to match the next LOD)
                #if !defined(SHADER_STAGE_RAY_TRACING) && !defined(_TESSELLATION_DISPLACEMENT)
                #ifdef LOD_FADE_CROSSFADE // enable dithering LOD transition if user select CrossFade transition in LOD group
                LODDitheringTransition(ComputeFadeMaskSeed(V, posInput.positionSS), unity_LODFade.x);
                #endif
                #endif
        
                #ifndef SHADER_UNLIT
                #ifdef _DOUBLESIDED_ON
                    float3 doubleSidedConstants = _DoubleSidedConstants.xyz;
                #else
                    float3 doubleSidedConstants = float3(1.0, 1.0, 1.0);
                #endif
        
                ApplyDoubleSidedFlipOrMirror(fragInputs, doubleSidedConstants); // Apply double sided flip on the vertex normal
                #endif // SHADER_UNLIT
        
                SurfaceDescriptionInputs surfaceDescriptionInputs = FragInputsToSurfaceDescriptionInputs(fragInputs, V);
        
                #if defined(HAVE_VFX_MODIFICATION)
                GraphProperties properties;
                ZERO_INITIALIZE(GraphProperties, properties);
        
                GetElementPixelProperties(fragInputs, properties);
        
                SurfaceDescription surfaceDescription = SurfaceDescriptionFunction(surfaceDescriptionInputs, properties);
                #else
                SurfaceDescription surfaceDescription = SurfaceDescriptionFunction(surfaceDescriptionInputs);
                #endif
        
                // Perform alpha test very early to save performance (a killed pixel will not sample textures)
                // TODO: split graph evaluation to grab just alpha dependencies first? tricky..
                #ifdef _ALPHATEST_ON
                    float alphaCutoff = surfaceDescription.AlphaClipThreshold;
                    #if SHADERPASS == SHADERPASS_TRANSPARENT_DEPTH_PREPASS
                    // The TransparentDepthPrepass is also used with SSR transparent.
                    // If an artists enable transaprent SSR but not the TransparentDepthPrepass itself, then we use AlphaClipThreshold
                    // otherwise if TransparentDepthPrepass is enabled we use AlphaClipThresholdDepthPrepass
                    #elif SHADERPASS == SHADERPASS_TRANSPARENT_DEPTH_POSTPASS
                    // DepthPostpass always use its own alpha threshold
                    alphaCutoff = surfaceDescription.AlphaClipThresholdDepthPostpass;
                    #elif (SHADERPASS == SHADERPASS_SHADOWS) || (SHADERPASS == SHADERPASS_RAYTRACING_VISIBILITY)
                    // If use shadow threshold isn't enable we don't allow any test
                    #endif
        
                    GENERIC_ALPHA_TEST(surfaceDescription.Alpha, alphaCutoff);
                #endif
        
                #if !defined(SHADER_STAGE_RAY_TRACING) && _DEPTHOFFSET_ON
                ApplyDepthOffsetPositionInput(V, surfaceDescription.DepthOffset, GetViewForwardDir(), GetWorldToHClipMatrix(), posInput);
                #endif
        
                #ifndef SHADER_UNLIT
                float3 bentNormalWS;
                BuildSurfaceData(fragInputs, surfaceDescription, V, posInput, surfaceData, bentNormalWS);
        
                #ifdef FRAG_INPUTS_USE_TEXCOORD1
                    float4 lightmapTexCoord1 = fragInputs.texCoord1;
                #else
                    float4 lightmapTexCoord1 = float4(0,0,0,0);
                #endif
        
                #ifdef FRAG_INPUTS_USE_TEXCOORD2
                    float4 lightmapTexCoord2 = fragInputs.texCoord2;
                #else
                    float4 lightmapTexCoord2 = float4(0,0,0,0);
                #endif
        
                // Builtin Data
                // For back lighting we use the oposite vertex normal
                InitBuiltinData(posInput, surfaceDescription.Alpha, bentNormalWS, -fragInputs.tangentToWorld[2], lightmapTexCoord1, lightmapTexCoord2, builtinData);
        
                #else
                BuildSurfaceData(fragInputs, surfaceDescription, V, posInput, surfaceData);
        
                ZERO_BUILTIN_INITIALIZE(builtinData); // No call to InitBuiltinData as we don't have any lighting
                builtinData.opacity = surfaceDescription.Alpha;
        
                #if defined(DEBUG_DISPLAY)
                    // Light Layers are currently not used for the Unlit shader (because it is not lit)
                    // But Unlit objects do cast shadows according to their rendering layer mask, which is what we want to
                    // display in the light layers visualization mode, therefore we need the renderingLayers
                    builtinData.renderingLayers = GetMeshRenderingLightLayer();
                #endif
        
                #endif // SHADER_UNLIT
        
                #ifdef _ALPHATEST_ON
                    // Used for sharpening by alpha to mask - Alpha to covertage is only used with depth only and forward pass (no shadow pass, no transparent pass)
                    builtinData.alphaClipTreshold = alphaCutoff;
                #endif
        
                // override sampleBakedGI - not used by Unlit
        
                builtinData.emissiveColor = surfaceDescription.Emission;
        
                // Note this will not fully work on transparent surfaces (can check with _SURFACE_TYPE_TRANSPARENT define)
                // We will always overwrite vt feeback with the nearest. So behind transparent surfaces vt will not be resolved
                // This is a limitation of the current MRT approach.
                #ifdef UNITY_VIRTUAL_TEXTURING
                #endif
        
                #if _DEPTHOFFSET_ON
                builtinData.depthOffset = surfaceDescription.DepthOffset;
                #endif
        
                // TODO: We should generate distortion / distortionBlur for non distortion pass
                #if (SHADERPASS == SHADERPASS_DISTORTION)
                builtinData.distortion = surfaceDescription.Distortion;
                builtinData.distortionBlur = surfaceDescription.DistortionBlur;
                #endif
        
                #ifndef SHADER_UNLIT
                // PostInitBuiltinData call ApplyDebugToBuiltinData
                PostInitBuiltinData(V, posInput, surfaceData, builtinData);
                #else
                ApplyDebugToBuiltinData(builtinData);
                #endif
        
                RAY_TRACING_OPTIONAL_ALPHA_TEST_PASS
            }
        
            // --------------------------------------------------
            // Main
        
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/ShaderPass/ShaderPassLightTransport.hlsl"
        
            // --------------------------------------------------
            // Visual Effect Vertex Invocations
        
        	#ifdef HAVE_VFX_MODIFICATION
        	#include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/VisualEffectVertex.hlsl"
        	#endif
        
            ENDHLSL
        }
        Pass
        {
            Name "ScenePickingPass"
            Tags
            {
                "LightMode" = "Picking"
            }
        
            // Render State
            Cull [_CullMode]
        
            // Debug
            // <None>
        
            // --------------------------------------------------
            // Pass
        
            HLSLPROGRAM
        
            // Pragmas
            #pragma instancing_options renderinglayer
        #pragma editor_sync_compilation
        #pragma target 4.5
        #pragma vertex Vert
        #pragma fragment Frag
        #pragma only_renderers d3d11 playstation xboxone xboxseries vulkan metal switch
        #pragma multi_compile_instancing
        
            // Keywords
            #pragma shader_feature _ _SURFACE_TYPE_TRANSPARENT
        #pragma shader_feature_local _BLENDMODE_OFF _BLENDMODE_ALPHA _BLENDMODE_ADD _BLENDMODE_PRE_MULTIPLY
        #pragma shader_feature_local _ _ADD_PRECOMPUTED_VELOCITY
        #pragma shader_feature_local _ _TRANSPARENT_WRITES_MOTION_VEC
        #pragma shader_feature_local_fragment _ _ENABLE_FOG_ON_TRANSPARENT
            // GraphKeywords: <None>
        
            // Early Instancing Defines
            // DotsInstancingOptions: <None>
        
            // Injected Instanced Properties (must be included before UnityInstancing.hlsl)
            // HybridV1InjectedBuiltinProperties: <None>
        
            // For custom interpolators to inject a substruct definition before FragInputs definition,
            // allowing for FragInputs to capture CI's intended for ShaderGraph's SDI.
            struct CustomInterpolators
        {
        };
        #define USE_CUSTOMINTERP_SUBSTRUCT
        
        
        
            // TODO: Merge FragInputsVFX substruct with CustomInterpolators.
        	#ifdef HAVE_VFX_MODIFICATION
        	struct FragInputsVFX
            {
                /* WARNING: $splice Could not find named fragment 'FragInputsVFX' */
            };
            #endif
        
            #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Common.hlsl"
        	#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/GeometricTools.hlsl" // Required by Tessellation.hlsl
        	#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Tessellation.hlsl"
            #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Texture.hlsl"
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderVariables.hlsl"
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/ShaderPass/ShaderPass.cs.hlsl"
            #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/TextureStack.hlsl" // Required to be include before we include properties as it define DECLARE_STACK_CB
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderGraphHeader.hlsl" // Need to be here for Gradient struct definition
        
            // --------------------------------------------------
            // Defines
        
            // Attribute
            #define ATTRIBUTES_NEED_NORMAL
            #define ATTRIBUTES_NEED_TANGENT
            #define VARYINGS_NEED_POSITION_WS
            #define VARYINGS_NEED_TANGENT_TO_WORLD
        
            #define HAVE_MESH_MODIFICATION
        
            //Strip down the FragInputs.hlsl (on graphics), so we can only optimize the interpolators we use.
            //if by accident something requests contents of FragInputs.hlsl, it will be caught as a compiler error
            //Frag inputs stripping is only enabled when FRAG_INPUTS_ENABLE_STRIPPING is set
            #if !defined(SHADER_STAGE_RAY_TRACING) && SHADERPASS != SHADERPASS_RAYTRACING_GBUFFER && SHADERPASS != SHADERPASS_FULL_SCREEN_DEBUG
            #define FRAG_INPUTS_ENABLE_STRIPPING
            #endif
        
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/ShaderPass/FragInputs.hlsl"
        
        
        
            #define SHADERPASS SHADERPASS_DEPTH_ONLY
        #define SCENEPICKINGPASS 1
        #define REQUIRE_DEPTH_TEXTURE
        
        
            // Following two define are a workaround introduce in 10.1.x for RaytracingQualityNode
            // The ShaderGraph don't support correctly migration of this node as it serialize all the node data
            // in the json file making it impossible to uprgrade. Until we get a fix, we do a workaround here
            // to still allow us to rename the field and keyword of this node without breaking existing code.
            #ifdef RAYTRACING_SHADER_GRAPH_DEFAULT
            #define RAYTRACING_SHADER_GRAPH_HIGH
            #endif
        
            #ifdef RAYTRACING_SHADER_GRAPH_RAYTRACED
            #define RAYTRACING_SHADER_GRAPH_LOW
            #endif
            // end
        
            #ifndef SHADER_UNLIT
            // We need isFrontFace when using double sided - it is not required for unlit as in case of unlit double sided only drive the cullmode
            // VARYINGS_NEED_CULLFACE can be define by VaryingsMeshToPS.FaceSign input if a IsFrontFace Node is included in the shader graph.
            #if defined(_DOUBLESIDED_ON) && !defined(VARYINGS_NEED_CULLFACE)
                #define VARYINGS_NEED_CULLFACE
            #endif
            #endif
        
            // Specific Material Define
        // Setup a define to say we are an unlit shader
        #define SHADER_UNLIT
        
        // Following Macro are only used by Unlit material
        #if defined(_ENABLE_SHADOW_MATTE) && (SHADERPASS == SHADERPASS_FORWARD_UNLIT || SHADERPASS == SHADERPASS_PATH_TRACING)
        #define LIGHTLOOP_DISABLE_TILE_AND_CLUSTER
        #define HAS_LIGHTLOOP
        #endif
            // Caution: we can use the define SHADER_UNLIT onlit after the above Material include as it is the Unlit template who define it
        
            // To handle SSR on transparent correctly with a possibility to enable/disable it per framesettings
            // we should have a code like this:
            // if !defined(_DISABLE_SSR_TRANSPARENT)
            // pragma multi_compile _ WRITE_NORMAL_BUFFER
            // endif
            // i.e we enable the multicompile only if we can receive SSR or not, and then C# code drive
            // it based on if SSR transparent in frame settings and not (and stripper can strip it).
            // this is currently not possible with our current preprocessor as _DISABLE_SSR_TRANSPARENT is a keyword not a define
            // so instead we used this and chose to pay the extra cost of normal write even if SSR transaprent is disabled.
            // Ideally the shader graph generator should handle it but condition below can't be handle correctly for now.
            #if SHADERPASS == SHADERPASS_TRANSPARENT_DEPTH_PREPASS
            #if !defined(_DISABLE_SSR_TRANSPARENT) && !defined(SHADER_UNLIT)
                #define WRITE_NORMAL_BUFFER
            #endif
            #endif
        
            #ifndef DEBUG_DISPLAY
                // In case of opaque we don't want to perform the alpha test, it is done in depth prepass and we use depth equal for ztest (setup from UI)
                // Don't do it with debug display mode as it is possible there is no depth prepass in this case
                #if !defined(_SURFACE_TYPE_TRANSPARENT)
                    #if SHADERPASS == SHADERPASS_FORWARD
                    #define SHADERPASS_FORWARD_BYPASS_ALPHA_TEST
                    #elif SHADERPASS == SHADERPASS_GBUFFER
                    #define SHADERPASS_GBUFFER_BYPASS_ALPHA_TEST
                    #endif
                #endif
            #endif
        
            // Define _DEFERRED_CAPABLE_MATERIAL for shader capable to run in deferred pass
            #if defined(SHADER_LIT) && !defined(_SURFACE_TYPE_TRANSPARENT)
                #define _DEFERRED_CAPABLE_MATERIAL
            #endif
        
            // Translate transparent motion vector define
            #if defined(_TRANSPARENT_WRITES_MOTION_VEC) && defined(_SURFACE_TYPE_TRANSPARENT)
                #define _WRITE_TRANSPARENT_MOTION_VECTOR
            #endif
        
            // -- Graph Properties
            CBUFFER_START(UnityPerMaterial)
        float4 _Rotate_Projection;
        float _Noise_Scale;
        float _Speed;
        float _Vertexoffset;
        float4 _Remap_xy_zw;
        float4 _Color_Peak;
        float4 _Color_Valley;
        float _SmoothEdge1;
        float _SmoothEdge2;
        float _Cloud_Pow;
        float _Base_Scale;
        float _Base_Speed;
        float _BaseStrength;
        float _Emission_Strength;
        float _Curvate_Radius;
        float _Fresnel_Power;
        float _Fresnel_Opacity;
        float _Depth_Fade;
        float4 _EmissionColor;
        float _UseShadowThreshold;
        float4 _DoubleSidedConstants;
        float _BlendMode;
        float _EnableBlendModePreserveSpecularLighting;
        CBUFFER_END
        
        // Object and Global properties
        
            // -- Property used by ScenePickingPass
            #ifdef SCENEPICKINGPASS
            float4 _SelectionID;
            #endif
        
            // -- Properties used by SceneSelectionPass
            #ifdef SCENESELECTIONPASS
            int _ObjectId;
            int _PassValue;
            #endif
        
            // Includes
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/PickingSpaceTransforms.hlsl"
        #include "Packages/com.unity.render-pipelines.high-definition/Runtime/Debug/DebugDisplay.hlsl"
        #include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Material.hlsl"
        #include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Unlit/Unlit.hlsl"
        #include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/BuiltinUtilities.hlsl"
        #include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/MaterialUtilities.hlsl"
        #include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderGraphFunctions.hlsl"
        	// GraphIncludes: <None>
        
            // --------------------------------------------------
            // Structs and Packing
        
            struct AttributesMesh
        {
             float3 positionOS : POSITION;
             float3 normalOS : NORMAL;
             float4 tangentOS : TANGENT;
            #if UNITY_ANY_INSTANCING_ENABLED
             uint instanceID : INSTANCEID_SEMANTIC;
            #endif
        };
        struct VaryingsMeshToPS
        {
            SV_POSITION_QUALIFIERS float4 positionCS : SV_POSITION;
             float3 positionRWS;
             float3 normalWS;
             float4 tangentWS;
            #if UNITY_ANY_INSTANCING_ENABLED
             uint instanceID : CUSTOM_INSTANCE_ID;
            #endif
        };
        struct VertexDescriptionInputs
        {
             float3 ObjectSpaceNormal;
             float3 ObjectSpaceTangent;
             float3 ObjectSpacePosition;
             float3 TimeParameters;
        };
        struct SurfaceDescriptionInputs
        {
             float3 WorldSpaceNormal;
             float3 WorldSpaceViewDirection;
             float3 ObjectSpacePosition;
             float3 WorldSpacePosition;
             float4 ScreenPosition;
             float3 TimeParameters;
        };
        struct PackedVaryingsMeshToPS
        {
            SV_POSITION_QUALIFIERS float4 positionCS : SV_POSITION;
             float3 interp0 : INTERP0;
             float3 interp1 : INTERP1;
             float4 interp2 : INTERP2;
            #if UNITY_ANY_INSTANCING_ENABLED
             uint instanceID : CUSTOM_INSTANCE_ID;
            #endif
        };
        
            PackedVaryingsMeshToPS PackVaryingsMeshToPS (VaryingsMeshToPS input)
        {
            PackedVaryingsMeshToPS output;
            ZERO_INITIALIZE(PackedVaryingsMeshToPS, output);
            output.positionCS = input.positionCS;
            output.interp0.xyz =  input.positionRWS;
            output.interp1.xyz =  input.normalWS;
            output.interp2.xyzw =  input.tangentWS;
            #if UNITY_ANY_INSTANCING_ENABLED
            output.instanceID = input.instanceID;
            #endif
            return output;
        }
        
        VaryingsMeshToPS UnpackVaryingsMeshToPS (PackedVaryingsMeshToPS input)
        {
            VaryingsMeshToPS output;
            output.positionCS = input.positionCS;
            output.positionRWS = input.interp0.xyz;
            output.normalWS = input.interp1.xyz;
            output.tangentWS = input.interp2.xyzw;
            #if UNITY_ANY_INSTANCING_ENABLED
            output.instanceID = input.instanceID;
            #endif
            return output;
        }
        
        
            // --------------------------------------------------
            // Graph
        
        
            // Graph Functions
            
        void Unity_Distance_float3(float3 A, float3 B, out float Out)
        {
            Out = distance(A, B);
        }
        
        void Unity_Divide_float(float A, float B, out float Out)
        {
            Out = A / B;
        }
        
        void Unity_Power_float(float A, float B, out float Out)
        {
            Out = pow(A, B);
        }
        
        void Unity_Multiply_float3_float3(float3 A, float3 B, out float3 Out)
        {
            Out = A * B;
        }
        
        void Unity_Rotate_About_Axis_Radians_float(float3 In, float3 Axis, float Rotation, out float3 Out)
        {
            float s = sin(Rotation);
            float c = cos(Rotation);
            float one_minus_c = 1.0 - c;
        
            Axis = normalize(Axis);
        
            float3x3 rot_mat = { one_minus_c * Axis.x * Axis.x + c,            one_minus_c * Axis.x * Axis.y - Axis.z * s,     one_minus_c * Axis.z * Axis.x + Axis.y * s,
                                      one_minus_c * Axis.x * Axis.y + Axis.z * s,   one_minus_c * Axis.y * Axis.y + c,              one_minus_c * Axis.y * Axis.z - Axis.x * s,
                                      one_minus_c * Axis.z * Axis.x - Axis.y * s,   one_minus_c * Axis.y * Axis.z + Axis.x * s,     one_minus_c * Axis.z * Axis.z + c
                                    };
        
            Out = mul(rot_mat,  In);
        }
        
        void Unity_Multiply_float_float(float A, float B, out float Out)
        {
            Out = A * B;
        }
        
        void Unity_TilingAndOffset_float(float2 UV, float2 Tiling, float2 Offset, out float2 Out)
        {
            Out = UV * Tiling + Offset;
        }
        
        
        float2 Unity_GradientNoise_Dir_float(float2 p)
        {
            // Permutation and hashing used in webgl-nosie goo.gl/pX7HtC
            p = p % 289;
            // need full precision, otherwise half overflows when p > 1
            float x = float(34 * p.x + 1) * p.x % 289 + p.y;
            x = (34 * x + 1) * x % 289;
            x = frac(x / 41) * 2 - 1;
            return normalize(float2(x - floor(x + 0.5), abs(x) - 0.5));
        }
        
        void Unity_GradientNoise_float(float2 UV, float Scale, out float Out)
        {
            float2 p = UV * Scale;
            float2 ip = floor(p);
            float2 fp = frac(p);
            float d00 = dot(Unity_GradientNoise_Dir_float(ip), fp);
            float d01 = dot(Unity_GradientNoise_Dir_float(ip + float2(0, 1)), fp - float2(0, 1));
            float d10 = dot(Unity_GradientNoise_Dir_float(ip + float2(1, 0)), fp - float2(1, 0));
            float d11 = dot(Unity_GradientNoise_Dir_float(ip + float2(1, 1)), fp - float2(1, 1));
            fp = fp * fp * fp * (fp * (fp * 6 - 15) + 10);
            Out = lerp(lerp(d00, d01, fp.y), lerp(d10, d11, fp.y), fp.x) + 0.5;
        }
        
        void Unity_Add_float(float A, float B, out float Out)
        {
            Out = A + B;
        }
        
        void Unity_Saturate_float(float In, out float Out)
        {
            Out = saturate(In);
        }
        
        void Unity_Combine_float(float R, float G, float B, float A, out float4 RGBA, out float3 RGB, out float2 RG)
        {
            RGBA = float4(R, G, B, A);
            RGB = float3(R, G, B);
            RG = float2(R, G);
        }
        
        void Unity_Remap_float(float In, float2 InMinMax, float2 OutMinMax, out float Out)
        {
            Out = OutMinMax.x + (In - InMinMax.x) * (OutMinMax.y - OutMinMax.x) / (InMinMax.y - InMinMax.x);
        }
        
        void Unity_Absolute_float(float In, out float Out)
        {
            Out = abs(In);
        }
        
        void Unity_Smoothstep_float(float Edge1, float Edge2, float In, out float Out)
        {
            Out = smoothstep(Edge1, Edge2, In);
        }
        
        void Unity_Add_float3(float3 A, float3 B, out float3 Out)
        {
            Out = A + B;
        }
        
        void Unity_FresnelEffect_float(float3 Normal, float3 ViewDir, float Power, out float Out)
        {
            Out = pow((1.0 - saturate(dot(normalize(Normal), normalize(ViewDir)))), Power);
        }
        
        void Unity_Lerp_float4(float4 A, float4 B, float4 T, out float4 Out)
        {
            Out = lerp(A, B, T);
        }
        
        void Unity_Add_float4(float4 A, float4 B, out float4 Out)
        {
            Out = A + B;
        }
        
        void Unity_Multiply_float4_float4(float4 A, float4 B, out float4 Out)
        {
            Out = A * B;
        }
        
        void Unity_SceneDepth_Eye_float(float4 UV, out float Out)
        {
            if (unity_OrthoParams.w == 1.0)
            {
                Out = LinearEyeDepth(ComputeWorldSpacePosition(UV.xy, SHADERGRAPH_SAMPLE_SCENE_DEPTH(UV.xy), UNITY_MATRIX_I_VP), UNITY_MATRIX_V);
            }
            else
            {
                Out = LinearEyeDepth(SHADERGRAPH_SAMPLE_SCENE_DEPTH(UV.xy), _ZBufferParams);
            }
        }
        
        void Unity_Subtract_float(float A, float B, out float Out)
        {
            Out = A - B;
        }
        
            // Graph Vertex
            struct VertexDescription
        {
            float3 Position;
            float3 Normal;
            float3 Tangent;
        };
        
        VertexDescription VertexDescriptionFunction(VertexDescriptionInputs IN)
        {
            VertexDescription description = (VertexDescription)0;
            float _Distance_389dd396e31949b9a8a01d35896316a6_Out_2;
            Unity_Distance_float3(SHADERGRAPH_OBJECT_POSITION, IN.ObjectSpacePosition, _Distance_389dd396e31949b9a8a01d35896316a6_Out_2);
            float _Property_d58669debb0246fe82fb0fb0bffa2edc_Out_0 = _Curvate_Radius;
            float _Divide_0b143990dbbc4cbdb5129fcbf5511012_Out_2;
            Unity_Divide_float(_Distance_389dd396e31949b9a8a01d35896316a6_Out_2, _Property_d58669debb0246fe82fb0fb0bffa2edc_Out_0, _Divide_0b143990dbbc4cbdb5129fcbf5511012_Out_2);
            float _Power_89ab1e29e2cb42a9acd2aed36f4fdcfe_Out_2;
            Unity_Power_float(_Divide_0b143990dbbc4cbdb5129fcbf5511012_Out_2, 2, _Power_89ab1e29e2cb42a9acd2aed36f4fdcfe_Out_2);
            float3 _Multiply_22e187ffacc7402bbe63087272b7efb5_Out_2;
            Unity_Multiply_float3_float3(IN.ObjectSpaceNormal, (_Power_89ab1e29e2cb42a9acd2aed36f4fdcfe_Out_2.xxx), _Multiply_22e187ffacc7402bbe63087272b7efb5_Out_2);
            float _Property_7d8e49b5efe94dea8210c34a6319b1ef_Out_0 = _SmoothEdge1;
            float _Property_09307b889e8945078bacabda50cca5c6_Out_0 = _SmoothEdge2;
            float4 _Property_a8d53d7ea07349e0979b956475bdd7cc_Out_0 = _Rotate_Projection;
            float _Split_7d12b2bb5feb46d685603473d0cf5818_R_1 = _Property_a8d53d7ea07349e0979b956475bdd7cc_Out_0[0];
            float _Split_7d12b2bb5feb46d685603473d0cf5818_G_2 = _Property_a8d53d7ea07349e0979b956475bdd7cc_Out_0[1];
            float _Split_7d12b2bb5feb46d685603473d0cf5818_B_3 = _Property_a8d53d7ea07349e0979b956475bdd7cc_Out_0[2];
            float _Split_7d12b2bb5feb46d685603473d0cf5818_A_4 = _Property_a8d53d7ea07349e0979b956475bdd7cc_Out_0[3];
            float3 _RotateAboutAxis_1b91481bceed4e9a82a13975af123b02_Out_3;
            Unity_Rotate_About_Axis_Radians_float(IN.ObjectSpacePosition, (_Property_a8d53d7ea07349e0979b956475bdd7cc_Out_0.xyz), _Split_7d12b2bb5feb46d685603473d0cf5818_A_4, _RotateAboutAxis_1b91481bceed4e9a82a13975af123b02_Out_3);
            float _Property_258f4645340c46f69274c9f077f1a73c_Out_0 = _Speed;
            float _Multiply_94f6d857831c4e69b53b9bfc92dd852f_Out_2;
            Unity_Multiply_float_float(IN.TimeParameters.x, _Property_258f4645340c46f69274c9f077f1a73c_Out_0, _Multiply_94f6d857831c4e69b53b9bfc92dd852f_Out_2);
            float2 _TilingAndOffset_6cb9fd57231c4a429c9c0fe5aeb7cc58_Out_3;
            Unity_TilingAndOffset_float((_RotateAboutAxis_1b91481bceed4e9a82a13975af123b02_Out_3.xy), float2 (1, 1), (_Multiply_94f6d857831c4e69b53b9bfc92dd852f_Out_2.xx), _TilingAndOffset_6cb9fd57231c4a429c9c0fe5aeb7cc58_Out_3);
            float _Property_2b9001a870d04f8eb60f5d7e1ce909c5_Out_0 = _Noise_Scale;
            float _GradientNoise_061679506b214bb8b4792ec4dfe82ec6_Out_2;
            Unity_GradientNoise_float(_TilingAndOffset_6cb9fd57231c4a429c9c0fe5aeb7cc58_Out_3, _Property_2b9001a870d04f8eb60f5d7e1ce909c5_Out_0, _GradientNoise_061679506b214bb8b4792ec4dfe82ec6_Out_2);
            float2 _TilingAndOffset_1d2491b5855e49d3b2e6b5dbe5db07d4_Out_3;
            Unity_TilingAndOffset_float((_RotateAboutAxis_1b91481bceed4e9a82a13975af123b02_Out_3.xy), float2 (1, 1), float2 (0, 0), _TilingAndOffset_1d2491b5855e49d3b2e6b5dbe5db07d4_Out_3);
            float _GradientNoise_8a27c3fb323f4db1b38f287380605198_Out_2;
            Unity_GradientNoise_float(_TilingAndOffset_1d2491b5855e49d3b2e6b5dbe5db07d4_Out_3, _Property_2b9001a870d04f8eb60f5d7e1ce909c5_Out_0, _GradientNoise_8a27c3fb323f4db1b38f287380605198_Out_2);
            float _Add_a6dd2d6e3f564decbca34ec03a419130_Out_2;
            Unity_Add_float(_GradientNoise_061679506b214bb8b4792ec4dfe82ec6_Out_2, _GradientNoise_8a27c3fb323f4db1b38f287380605198_Out_2, _Add_a6dd2d6e3f564decbca34ec03a419130_Out_2);
            float _Divide_a757ea7167f343ecaec30e69b58c9bae_Out_2;
            Unity_Divide_float(_Add_a6dd2d6e3f564decbca34ec03a419130_Out_2, 2, _Divide_a757ea7167f343ecaec30e69b58c9bae_Out_2);
            float _Saturate_f355ba5a467f4488b7ec89e8a08484a3_Out_1;
            Unity_Saturate_float(_Divide_a757ea7167f343ecaec30e69b58c9bae_Out_2, _Saturate_f355ba5a467f4488b7ec89e8a08484a3_Out_1);
            float _Property_96da655cc17e4594836aa02d74efe33c_Out_0 = _Cloud_Pow;
            float _Power_318bede735044ec6811f2a5c345b7d73_Out_2;
            Unity_Power_float(_Saturate_f355ba5a467f4488b7ec89e8a08484a3_Out_1, _Property_96da655cc17e4594836aa02d74efe33c_Out_0, _Power_318bede735044ec6811f2a5c345b7d73_Out_2);
            float4 _Property_317e8becc0724841a13cbcf8d4c4efbc_Out_0 = _Remap_xy_zw;
            float _Split_3dee68ff9a374966b7612da59c6ac20a_R_1 = _Property_317e8becc0724841a13cbcf8d4c4efbc_Out_0[0];
            float _Split_3dee68ff9a374966b7612da59c6ac20a_G_2 = _Property_317e8becc0724841a13cbcf8d4c4efbc_Out_0[1];
            float _Split_3dee68ff9a374966b7612da59c6ac20a_B_3 = _Property_317e8becc0724841a13cbcf8d4c4efbc_Out_0[2];
            float _Split_3dee68ff9a374966b7612da59c6ac20a_A_4 = _Property_317e8becc0724841a13cbcf8d4c4efbc_Out_0[3];
            float4 _Combine_4e3ec9a6e4064091bba919631e732b7a_RGBA_4;
            float3 _Combine_4e3ec9a6e4064091bba919631e732b7a_RGB_5;
            float2 _Combine_4e3ec9a6e4064091bba919631e732b7a_RG_6;
            Unity_Combine_float(_Split_3dee68ff9a374966b7612da59c6ac20a_R_1, _Split_3dee68ff9a374966b7612da59c6ac20a_G_2, 0, 0, _Combine_4e3ec9a6e4064091bba919631e732b7a_RGBA_4, _Combine_4e3ec9a6e4064091bba919631e732b7a_RGB_5, _Combine_4e3ec9a6e4064091bba919631e732b7a_RG_6);
            float4 _Combine_6f976751f1234c77908b163e59da18bb_RGBA_4;
            float3 _Combine_6f976751f1234c77908b163e59da18bb_RGB_5;
            float2 _Combine_6f976751f1234c77908b163e59da18bb_RG_6;
            Unity_Combine_float(_Split_3dee68ff9a374966b7612da59c6ac20a_B_3, _Split_3dee68ff9a374966b7612da59c6ac20a_A_4, 0, 0, _Combine_6f976751f1234c77908b163e59da18bb_RGBA_4, _Combine_6f976751f1234c77908b163e59da18bb_RGB_5, _Combine_6f976751f1234c77908b163e59da18bb_RG_6);
            float _Remap_a11bf825d8d54f198c2355e6d3cc1fba_Out_3;
            Unity_Remap_float(_Power_318bede735044ec6811f2a5c345b7d73_Out_2, _Combine_4e3ec9a6e4064091bba919631e732b7a_RG_6, _Combine_6f976751f1234c77908b163e59da18bb_RG_6, _Remap_a11bf825d8d54f198c2355e6d3cc1fba_Out_3);
            float _Absolute_553a57701af34a45a18ca7b2af677c8a_Out_1;
            Unity_Absolute_float(_Remap_a11bf825d8d54f198c2355e6d3cc1fba_Out_3, _Absolute_553a57701af34a45a18ca7b2af677c8a_Out_1);
            float _Smoothstep_6babd4aa745b40db842b941b96adf7e9_Out_3;
            Unity_Smoothstep_float(_Property_7d8e49b5efe94dea8210c34a6319b1ef_Out_0, _Property_09307b889e8945078bacabda50cca5c6_Out_0, _Absolute_553a57701af34a45a18ca7b2af677c8a_Out_1, _Smoothstep_6babd4aa745b40db842b941b96adf7e9_Out_3);
            float _Property_17631cb6b51c44b593b4fb1f0ac8fa75_Out_0 = _Base_Speed;
            float _Multiply_2e98faddc46143bea8e48ab17d0e1c15_Out_2;
            Unity_Multiply_float_float(IN.TimeParameters.x, _Property_17631cb6b51c44b593b4fb1f0ac8fa75_Out_0, _Multiply_2e98faddc46143bea8e48ab17d0e1c15_Out_2);
            float2 _TilingAndOffset_d8c83d87b12649f7b6a3902973c4457a_Out_3;
            Unity_TilingAndOffset_float((_RotateAboutAxis_1b91481bceed4e9a82a13975af123b02_Out_3.xy), float2 (1, 1), (_Multiply_2e98faddc46143bea8e48ab17d0e1c15_Out_2.xx), _TilingAndOffset_d8c83d87b12649f7b6a3902973c4457a_Out_3);
            float _Property_2792df33a4d44e20b2f71fe244d5f369_Out_0 = _Base_Scale;
            float _GradientNoise_702d412fe90e4c64b91e9defbe1ffff2_Out_2;
            Unity_GradientNoise_float(_TilingAndOffset_d8c83d87b12649f7b6a3902973c4457a_Out_3, _Property_2792df33a4d44e20b2f71fe244d5f369_Out_0, _GradientNoise_702d412fe90e4c64b91e9defbe1ffff2_Out_2);
            float _Property_a965b78b3be84255ae4ff1617bd2df01_Out_0 = _BaseStrength;
            float _Multiply_9880df30952a454781c1f0c8356100dd_Out_2;
            Unity_Multiply_float_float(_GradientNoise_702d412fe90e4c64b91e9defbe1ffff2_Out_2, _Property_a965b78b3be84255ae4ff1617bd2df01_Out_0, _Multiply_9880df30952a454781c1f0c8356100dd_Out_2);
            float _Add_98d9cdbb65e44e0282692d35bd9d237b_Out_2;
            Unity_Add_float(_Smoothstep_6babd4aa745b40db842b941b96adf7e9_Out_3, _Multiply_9880df30952a454781c1f0c8356100dd_Out_2, _Add_98d9cdbb65e44e0282692d35bd9d237b_Out_2);
            float _Add_d305fd085a9b459da3d4bd5108430b3f_Out_2;
            Unity_Add_float(1, _Property_a965b78b3be84255ae4ff1617bd2df01_Out_0, _Add_d305fd085a9b459da3d4bd5108430b3f_Out_2);
            float _Divide_55db7b7a0b8b481d83fb512a13a2dba6_Out_2;
            Unity_Divide_float(_Add_98d9cdbb65e44e0282692d35bd9d237b_Out_2, _Add_d305fd085a9b459da3d4bd5108430b3f_Out_2, _Divide_55db7b7a0b8b481d83fb512a13a2dba6_Out_2);
            float3 _Multiply_639bbd01ca0947fdbb4245744090b06e_Out_2;
            Unity_Multiply_float3_float3(IN.ObjectSpaceNormal, (_Divide_55db7b7a0b8b481d83fb512a13a2dba6_Out_2.xxx), _Multiply_639bbd01ca0947fdbb4245744090b06e_Out_2);
            float _Property_8b198d3112494fb98defdd5dc1b13601_Out_0 = _Vertexoffset;
            float3 _Multiply_2119a238e1d14c34879c4926fe468be5_Out_2;
            Unity_Multiply_float3_float3(_Multiply_639bbd01ca0947fdbb4245744090b06e_Out_2, (_Property_8b198d3112494fb98defdd5dc1b13601_Out_0.xxx), _Multiply_2119a238e1d14c34879c4926fe468be5_Out_2);
            float3 _Add_18a07d3e52a847f594f01810747a3393_Out_2;
            Unity_Add_float3(IN.ObjectSpacePosition, _Multiply_2119a238e1d14c34879c4926fe468be5_Out_2, _Add_18a07d3e52a847f594f01810747a3393_Out_2);
            float3 _Add_b9cf96b2dcd84792b2e40dd036537586_Out_2;
            Unity_Add_float3(_Multiply_22e187ffacc7402bbe63087272b7efb5_Out_2, _Add_18a07d3e52a847f594f01810747a3393_Out_2, _Add_b9cf96b2dcd84792b2e40dd036537586_Out_2);
            description.Position = _Add_b9cf96b2dcd84792b2e40dd036537586_Out_2;
            description.Normal = IN.ObjectSpaceNormal;
            description.Tangent = IN.ObjectSpaceTangent;
            return description;
        }
        
            // Graph Pixel
            struct SurfaceDescription
        {
            float3 BaseColor;
            float3 Emission;
            float Alpha;
        };
        
        SurfaceDescription SurfaceDescriptionFunction(SurfaceDescriptionInputs IN)
        {
            SurfaceDescription surface = (SurfaceDescription)0;
            float _Property_7d8e49b5efe94dea8210c34a6319b1ef_Out_0 = _SmoothEdge1;
            float _Property_09307b889e8945078bacabda50cca5c6_Out_0 = _SmoothEdge2;
            float4 _Property_a8d53d7ea07349e0979b956475bdd7cc_Out_0 = _Rotate_Projection;
            float _Split_7d12b2bb5feb46d685603473d0cf5818_R_1 = _Property_a8d53d7ea07349e0979b956475bdd7cc_Out_0[0];
            float _Split_7d12b2bb5feb46d685603473d0cf5818_G_2 = _Property_a8d53d7ea07349e0979b956475bdd7cc_Out_0[1];
            float _Split_7d12b2bb5feb46d685603473d0cf5818_B_3 = _Property_a8d53d7ea07349e0979b956475bdd7cc_Out_0[2];
            float _Split_7d12b2bb5feb46d685603473d0cf5818_A_4 = _Property_a8d53d7ea07349e0979b956475bdd7cc_Out_0[3];
            float3 _RotateAboutAxis_1b91481bceed4e9a82a13975af123b02_Out_3;
            Unity_Rotate_About_Axis_Radians_float(IN.ObjectSpacePosition, (_Property_a8d53d7ea07349e0979b956475bdd7cc_Out_0.xyz), _Split_7d12b2bb5feb46d685603473d0cf5818_A_4, _RotateAboutAxis_1b91481bceed4e9a82a13975af123b02_Out_3);
            float _Property_258f4645340c46f69274c9f077f1a73c_Out_0 = _Speed;
            float _Multiply_94f6d857831c4e69b53b9bfc92dd852f_Out_2;
            Unity_Multiply_float_float(IN.TimeParameters.x, _Property_258f4645340c46f69274c9f077f1a73c_Out_0, _Multiply_94f6d857831c4e69b53b9bfc92dd852f_Out_2);
            float2 _TilingAndOffset_6cb9fd57231c4a429c9c0fe5aeb7cc58_Out_3;
            Unity_TilingAndOffset_float((_RotateAboutAxis_1b91481bceed4e9a82a13975af123b02_Out_3.xy), float2 (1, 1), (_Multiply_94f6d857831c4e69b53b9bfc92dd852f_Out_2.xx), _TilingAndOffset_6cb9fd57231c4a429c9c0fe5aeb7cc58_Out_3);
            float _Property_2b9001a870d04f8eb60f5d7e1ce909c5_Out_0 = _Noise_Scale;
            float _GradientNoise_061679506b214bb8b4792ec4dfe82ec6_Out_2;
            Unity_GradientNoise_float(_TilingAndOffset_6cb9fd57231c4a429c9c0fe5aeb7cc58_Out_3, _Property_2b9001a870d04f8eb60f5d7e1ce909c5_Out_0, _GradientNoise_061679506b214bb8b4792ec4dfe82ec6_Out_2);
            float2 _TilingAndOffset_1d2491b5855e49d3b2e6b5dbe5db07d4_Out_3;
            Unity_TilingAndOffset_float((_RotateAboutAxis_1b91481bceed4e9a82a13975af123b02_Out_3.xy), float2 (1, 1), float2 (0, 0), _TilingAndOffset_1d2491b5855e49d3b2e6b5dbe5db07d4_Out_3);
            float _GradientNoise_8a27c3fb323f4db1b38f287380605198_Out_2;
            Unity_GradientNoise_float(_TilingAndOffset_1d2491b5855e49d3b2e6b5dbe5db07d4_Out_3, _Property_2b9001a870d04f8eb60f5d7e1ce909c5_Out_0, _GradientNoise_8a27c3fb323f4db1b38f287380605198_Out_2);
            float _Add_a6dd2d6e3f564decbca34ec03a419130_Out_2;
            Unity_Add_float(_GradientNoise_061679506b214bb8b4792ec4dfe82ec6_Out_2, _GradientNoise_8a27c3fb323f4db1b38f287380605198_Out_2, _Add_a6dd2d6e3f564decbca34ec03a419130_Out_2);
            float _Divide_a757ea7167f343ecaec30e69b58c9bae_Out_2;
            Unity_Divide_float(_Add_a6dd2d6e3f564decbca34ec03a419130_Out_2, 2, _Divide_a757ea7167f343ecaec30e69b58c9bae_Out_2);
            float _Saturate_f355ba5a467f4488b7ec89e8a08484a3_Out_1;
            Unity_Saturate_float(_Divide_a757ea7167f343ecaec30e69b58c9bae_Out_2, _Saturate_f355ba5a467f4488b7ec89e8a08484a3_Out_1);
            float _Property_96da655cc17e4594836aa02d74efe33c_Out_0 = _Cloud_Pow;
            float _Power_318bede735044ec6811f2a5c345b7d73_Out_2;
            Unity_Power_float(_Saturate_f355ba5a467f4488b7ec89e8a08484a3_Out_1, _Property_96da655cc17e4594836aa02d74efe33c_Out_0, _Power_318bede735044ec6811f2a5c345b7d73_Out_2);
            float4 _Property_317e8becc0724841a13cbcf8d4c4efbc_Out_0 = _Remap_xy_zw;
            float _Split_3dee68ff9a374966b7612da59c6ac20a_R_1 = _Property_317e8becc0724841a13cbcf8d4c4efbc_Out_0[0];
            float _Split_3dee68ff9a374966b7612da59c6ac20a_G_2 = _Property_317e8becc0724841a13cbcf8d4c4efbc_Out_0[1];
            float _Split_3dee68ff9a374966b7612da59c6ac20a_B_3 = _Property_317e8becc0724841a13cbcf8d4c4efbc_Out_0[2];
            float _Split_3dee68ff9a374966b7612da59c6ac20a_A_4 = _Property_317e8becc0724841a13cbcf8d4c4efbc_Out_0[3];
            float4 _Combine_4e3ec9a6e4064091bba919631e732b7a_RGBA_4;
            float3 _Combine_4e3ec9a6e4064091bba919631e732b7a_RGB_5;
            float2 _Combine_4e3ec9a6e4064091bba919631e732b7a_RG_6;
            Unity_Combine_float(_Split_3dee68ff9a374966b7612da59c6ac20a_R_1, _Split_3dee68ff9a374966b7612da59c6ac20a_G_2, 0, 0, _Combine_4e3ec9a6e4064091bba919631e732b7a_RGBA_4, _Combine_4e3ec9a6e4064091bba919631e732b7a_RGB_5, _Combine_4e3ec9a6e4064091bba919631e732b7a_RG_6);
            float4 _Combine_6f976751f1234c77908b163e59da18bb_RGBA_4;
            float3 _Combine_6f976751f1234c77908b163e59da18bb_RGB_5;
            float2 _Combine_6f976751f1234c77908b163e59da18bb_RG_6;
            Unity_Combine_float(_Split_3dee68ff9a374966b7612da59c6ac20a_B_3, _Split_3dee68ff9a374966b7612da59c6ac20a_A_4, 0, 0, _Combine_6f976751f1234c77908b163e59da18bb_RGBA_4, _Combine_6f976751f1234c77908b163e59da18bb_RGB_5, _Combine_6f976751f1234c77908b163e59da18bb_RG_6);
            float _Remap_a11bf825d8d54f198c2355e6d3cc1fba_Out_3;
            Unity_Remap_float(_Power_318bede735044ec6811f2a5c345b7d73_Out_2, _Combine_4e3ec9a6e4064091bba919631e732b7a_RG_6, _Combine_6f976751f1234c77908b163e59da18bb_RG_6, _Remap_a11bf825d8d54f198c2355e6d3cc1fba_Out_3);
            float _Absolute_553a57701af34a45a18ca7b2af677c8a_Out_1;
            Unity_Absolute_float(_Remap_a11bf825d8d54f198c2355e6d3cc1fba_Out_3, _Absolute_553a57701af34a45a18ca7b2af677c8a_Out_1);
            float _Smoothstep_6babd4aa745b40db842b941b96adf7e9_Out_3;
            Unity_Smoothstep_float(_Property_7d8e49b5efe94dea8210c34a6319b1ef_Out_0, _Property_09307b889e8945078bacabda50cca5c6_Out_0, _Absolute_553a57701af34a45a18ca7b2af677c8a_Out_1, _Smoothstep_6babd4aa745b40db842b941b96adf7e9_Out_3);
            float _Property_17631cb6b51c44b593b4fb1f0ac8fa75_Out_0 = _Base_Speed;
            float _Multiply_2e98faddc46143bea8e48ab17d0e1c15_Out_2;
            Unity_Multiply_float_float(IN.TimeParameters.x, _Property_17631cb6b51c44b593b4fb1f0ac8fa75_Out_0, _Multiply_2e98faddc46143bea8e48ab17d0e1c15_Out_2);
            float2 _TilingAndOffset_d8c83d87b12649f7b6a3902973c4457a_Out_3;
            Unity_TilingAndOffset_float((_RotateAboutAxis_1b91481bceed4e9a82a13975af123b02_Out_3.xy), float2 (1, 1), (_Multiply_2e98faddc46143bea8e48ab17d0e1c15_Out_2.xx), _TilingAndOffset_d8c83d87b12649f7b6a3902973c4457a_Out_3);
            float _Property_2792df33a4d44e20b2f71fe244d5f369_Out_0 = _Base_Scale;
            float _GradientNoise_702d412fe90e4c64b91e9defbe1ffff2_Out_2;
            Unity_GradientNoise_float(_TilingAndOffset_d8c83d87b12649f7b6a3902973c4457a_Out_3, _Property_2792df33a4d44e20b2f71fe244d5f369_Out_0, _GradientNoise_702d412fe90e4c64b91e9defbe1ffff2_Out_2);
            float _Property_a965b78b3be84255ae4ff1617bd2df01_Out_0 = _BaseStrength;
            float _Multiply_9880df30952a454781c1f0c8356100dd_Out_2;
            Unity_Multiply_float_float(_GradientNoise_702d412fe90e4c64b91e9defbe1ffff2_Out_2, _Property_a965b78b3be84255ae4ff1617bd2df01_Out_0, _Multiply_9880df30952a454781c1f0c8356100dd_Out_2);
            float _Add_98d9cdbb65e44e0282692d35bd9d237b_Out_2;
            Unity_Add_float(_Smoothstep_6babd4aa745b40db842b941b96adf7e9_Out_3, _Multiply_9880df30952a454781c1f0c8356100dd_Out_2, _Add_98d9cdbb65e44e0282692d35bd9d237b_Out_2);
            float _Add_d305fd085a9b459da3d4bd5108430b3f_Out_2;
            Unity_Add_float(1, _Property_a965b78b3be84255ae4ff1617bd2df01_Out_0, _Add_d305fd085a9b459da3d4bd5108430b3f_Out_2);
            float _Divide_55db7b7a0b8b481d83fb512a13a2dba6_Out_2;
            Unity_Divide_float(_Add_98d9cdbb65e44e0282692d35bd9d237b_Out_2, _Add_d305fd085a9b459da3d4bd5108430b3f_Out_2, _Divide_55db7b7a0b8b481d83fb512a13a2dba6_Out_2);
            float _Property_5a371e38a60143fcae81da7313c1bf15_Out_0 = _Fresnel_Power;
            float _FresnelEffect_4c470240dea248acb0092676d71437cb_Out_3;
            Unity_FresnelEffect_float(IN.WorldSpaceNormal, IN.WorldSpaceViewDirection, _Property_5a371e38a60143fcae81da7313c1bf15_Out_0, _FresnelEffect_4c470240dea248acb0092676d71437cb_Out_3);
            float _Multiply_384d15a2ef094b7e8b1ec6d69dada246_Out_2;
            Unity_Multiply_float_float(_Divide_55db7b7a0b8b481d83fb512a13a2dba6_Out_2, _FresnelEffect_4c470240dea248acb0092676d71437cb_Out_3, _Multiply_384d15a2ef094b7e8b1ec6d69dada246_Out_2);
            float _Property_3c23366c651c4949b03cb10c14ae0a27_Out_0 = _Fresnel_Opacity;
            float _Multiply_9380e32f6e4644e1b42e398229c18d31_Out_2;
            Unity_Multiply_float_float(_Multiply_384d15a2ef094b7e8b1ec6d69dada246_Out_2, _Property_3c23366c651c4949b03cb10c14ae0a27_Out_0, _Multiply_9380e32f6e4644e1b42e398229c18d31_Out_2);
            float4 _Property_dff39e3157cb4a09aac968677ade995d_Out_0 = _Color_Valley;
            float4 _Property_1b300af9e23e428fa893e55f9390600d_Out_0 = _Color_Peak;
            float4 _Lerp_6d0a20bb25554e1fa8697f473485e856_Out_3;
            Unity_Lerp_float4(_Property_dff39e3157cb4a09aac968677ade995d_Out_0, _Property_1b300af9e23e428fa893e55f9390600d_Out_0, (_Add_98d9cdbb65e44e0282692d35bd9d237b_Out_2.xxxx), _Lerp_6d0a20bb25554e1fa8697f473485e856_Out_3);
            float4 _Add_6507a6920d9c478888f235ad9d0bb542_Out_2;
            Unity_Add_float4((_Multiply_9380e32f6e4644e1b42e398229c18d31_Out_2.xxxx), _Lerp_6d0a20bb25554e1fa8697f473485e856_Out_3, _Add_6507a6920d9c478888f235ad9d0bb542_Out_2);
            float _Property_9cf7107417e042afb41766bb37be827b_Out_0 = _Emission_Strength;
            float4 _Multiply_31ae534c0cc640be9fda8de7cc705bbf_Out_2;
            Unity_Multiply_float4_float4(_Add_6507a6920d9c478888f235ad9d0bb542_Out_2, (_Property_9cf7107417e042afb41766bb37be827b_Out_0.xxxx), _Multiply_31ae534c0cc640be9fda8de7cc705bbf_Out_2);
            float _SceneDepth_619a7e0097894c29ba4557fde6cbb174_Out_1;
            Unity_SceneDepth_Eye_float(float4(IN.ScreenPosition.xy / IN.ScreenPosition.w, 0, 0), _SceneDepth_619a7e0097894c29ba4557fde6cbb174_Out_1);
            float4 _ScreenPosition_ee728e739f744068b0d15c1205d618a0_Out_0 = IN.ScreenPosition;
            float _Split_d5d8a30c527c46a19ab94602c057016e_R_1 = _ScreenPosition_ee728e739f744068b0d15c1205d618a0_Out_0[0];
            float _Split_d5d8a30c527c46a19ab94602c057016e_G_2 = _ScreenPosition_ee728e739f744068b0d15c1205d618a0_Out_0[1];
            float _Split_d5d8a30c527c46a19ab94602c057016e_B_3 = _ScreenPosition_ee728e739f744068b0d15c1205d618a0_Out_0[2];
            float _Split_d5d8a30c527c46a19ab94602c057016e_A_4 = _ScreenPosition_ee728e739f744068b0d15c1205d618a0_Out_0[3];
            float _Subtract_07eb78fa00d74ade84172a64a4a4616c_Out_2;
            Unity_Subtract_float(_Split_d5d8a30c527c46a19ab94602c057016e_A_4, 1, _Subtract_07eb78fa00d74ade84172a64a4a4616c_Out_2);
            float _Subtract_3ef0962257844c2c87b9ff8d165099f3_Out_2;
            Unity_Subtract_float(_SceneDepth_619a7e0097894c29ba4557fde6cbb174_Out_1, _Subtract_07eb78fa00d74ade84172a64a4a4616c_Out_2, _Subtract_3ef0962257844c2c87b9ff8d165099f3_Out_2);
            float _Property_9167e3d66076450baeb620b8f8b66552_Out_0 = _Depth_Fade;
            float _Divide_9a1ae8922923443883cbd9e71941de32_Out_2;
            Unity_Divide_float(_Subtract_3ef0962257844c2c87b9ff8d165099f3_Out_2, _Property_9167e3d66076450baeb620b8f8b66552_Out_0, _Divide_9a1ae8922923443883cbd9e71941de32_Out_2);
            float _Saturate_791ce4d2963e420ba68a97fca0bef8f9_Out_1;
            Unity_Saturate_float(_Divide_9a1ae8922923443883cbd9e71941de32_Out_2, _Saturate_791ce4d2963e420ba68a97fca0bef8f9_Out_1);
            surface.BaseColor = (_Add_6507a6920d9c478888f235ad9d0bb542_Out_2.xyz);
            surface.Emission = (_Multiply_31ae534c0cc640be9fda8de7cc705bbf_Out_2.xyz);
            surface.Alpha = _Saturate_791ce4d2963e420ba68a97fca0bef8f9_Out_1;
            return surface;
        }
        
            // --------------------------------------------------
            // Build Graph Inputs
            #ifdef HAVE_VFX_MODIFICATION
            #define VFX_SRP_ATTRIBUTES AttributesMesh
            #define VaryingsMeshType VaryingsMeshToPS
            #define VFX_SRP_VARYINGS VaryingsMeshType
            #define VFX_SRP_SURFACE_INPUTS FragInputs
            #endif
            
        VertexDescriptionInputs AttributesMeshToVertexDescriptionInputs(AttributesMesh input)
        {
            VertexDescriptionInputs output;
            ZERO_INITIALIZE(VertexDescriptionInputs, output);
        
            output.ObjectSpaceNormal =                          input.normalOS;
            output.ObjectSpaceTangent =                         input.tangentOS.xyz;
            output.ObjectSpacePosition =                        input.positionOS;
            output.TimeParameters =                             _TimeParameters.xyz; // Note: in case of animation this will be overwrite (allow to handle motion vector)
        
            return output;
        }
        
        VertexDescription GetVertexDescription(AttributesMesh input, float3 timeParameters
        #ifdef HAVE_VFX_MODIFICATION
            , AttributesElement element
        #endif
        )
        {
            // build graph inputs
            VertexDescriptionInputs vertexDescriptionInputs = AttributesMeshToVertexDescriptionInputs(input);
            // Override time parameters with used one (This is required to correctly handle motion vector for vertex animation based on time)
            vertexDescriptionInputs.TimeParameters = timeParameters;
        
            // evaluate vertex graph
        #ifdef HAVE_VFX_MODIFICATION
            GraphProperties properties;
            ZERO_INITIALIZE(GraphProperties, properties);
        
            // Fetch the vertex graph properties for the particle instance.
            GetElementVertexProperties(element, properties);
        
            VertexDescription vertexDescription = VertexDescriptionFunction(vertexDescriptionInputs, properties);
        #else
            VertexDescription vertexDescription = VertexDescriptionFunction(vertexDescriptionInputs);
        #endif
            return vertexDescription;
        
        }
        
        AttributesMesh ApplyMeshModification(AttributesMesh input, float3 timeParameters
        #ifdef USE_CUSTOMINTERP_SUBSTRUCT
            #ifdef TESSELLATION_ON
            , inout VaryingsMeshToDS varyings
            #else
            , inout VaryingsMeshToPS varyings
            #endif
        #endif
        #ifdef HAVE_VFX_MODIFICATION
                , AttributesElement element
        #endif
            )
        {
            VertexDescription vertexDescription = GetVertexDescription(input, timeParameters
        #ifdef HAVE_VFX_MODIFICATION
                , element
        #endif
            );
        
            // copy graph output to the results
            input.positionOS = vertexDescription.Position;
            input.normalOS = vertexDescription.Normal;
            input.tangentOS.xyz = vertexDescription.Tangent;
        
            
        
            return input;
        }
        
        #if defined(_ADD_CUSTOM_VELOCITY) // For shader graph custom velocity
        // Return precomputed Velocity in object space
        float3 GetCustomVelocity(AttributesMesh input
        #ifdef HAVE_VFX_MODIFICATION
            , AttributesElement element
        #endif
        )
        {
            VertexDescription vertexDescription = GetVertexDescription(input, _TimeParameters.xyz
        #ifdef HAVE_VFX_MODIFICATION
                , element
        #endif
            );
            return vertexDescription.CustomVelocity;
        }
        #endif
        
        FragInputs BuildFragInputs(VaryingsMeshToPS input)
        {
            FragInputs output;
            ZERO_INITIALIZE(FragInputs, output);
        
            // Init to some default value to make the computer quiet (else it output 'divide by zero' warning even if value is not used).
            // TODO: this is a really poor workaround, but the variable is used in a bunch of places
            // to compute normals which are then passed on elsewhere to compute other values...
            output.tangentToWorld = k_identity3x3;
            output.positionSS = input.positionCS;       // input.positionCS is SV_Position
        
            output.positionRWS =                input.positionRWS;
            output.tangentToWorld =             BuildTangentToWorld(input.tangentWS, input.normalWS);
        
        #ifdef HAVE_VFX_MODIFICATION
            // FragInputs from VFX come from two places: Interpolator or CBuffer.
            /* WARNING: $splice Could not find named fragment 'VFXSetFragInputs' */
        
        #endif
        
            // splice point to copy custom interpolator fields from varyings to frag inputs
            
        
            return output;
        }
        
        // existing HDRP code uses the combined function to go directly from packed to frag inputs
        FragInputs UnpackVaryingsMeshToFragInputs(PackedVaryingsMeshToPS input)
        {
            UNITY_SETUP_INSTANCE_ID(input);
            VaryingsMeshToPS unpacked = UnpackVaryingsMeshToPS(input);
            return BuildFragInputs(unpacked);
        }
            SurfaceDescriptionInputs FragInputsToSurfaceDescriptionInputs(FragInputs input, float3 viewWS)
        {
            SurfaceDescriptionInputs output;
            ZERO_INITIALIZE(SurfaceDescriptionInputs, output);
        
            output.WorldSpaceNormal =                           normalize(input.tangentToWorld[2].xyz);
            #if defined(SHADER_STAGE_RAY_TRACING)
            #else
            #endif
            output.WorldSpaceViewDirection =                    normalize(viewWS);
            output.WorldSpacePosition =                         input.positionRWS;
            output.ObjectSpacePosition =                        TransformWorldToObject(input.positionRWS);
            output.ScreenPosition =                             ComputeScreenPos(TransformWorldToHClip(input.positionRWS), _ProjectionParams.x);
            output.TimeParameters =                             _TimeParameters.xyz; // This is mainly for LW as HD overwrite this value
        
            // splice point to copy frag inputs custom interpolator pack into the SDI
            
        
            return output;
        }
        
            // --------------------------------------------------
            // Build Surface Data (Specific Material)
        
        void BuildSurfaceData(FragInputs fragInputs, inout SurfaceDescription surfaceDescription, float3 V, PositionInputs posInput, out SurfaceData surfaceData)
        {
            // setup defaults -- these are used if the graph doesn't output a value
            ZERO_INITIALIZE(SurfaceData, surfaceData);
        
            // copy across graph values, if defined
            surfaceData.color = surfaceDescription.BaseColor;
        
            #ifdef WRITE_NORMAL_BUFFER
            // When we need to export the normal (in the depth prepass, we write the geometry one)
            surfaceData.normalWS = fragInputs.tangentToWorld[2];
            #endif
        
            #if defined(DEBUG_DISPLAY)
            if (_DebugMipMapMode != DEBUGMIPMAPMODE_NONE)
            {
                // TODO
            }
            #endif
        
            #ifdef _ENABLE_SHADOW_MATTE
        
                #if (SHADERPASS == SHADERPASS_FORWARD_UNLIT) || (SHADERPASS == SHADERPASS_RAYTRACING_GBUFFER) || (SHADERPASS == SHADERPASS_RAYTRACING_INDIRECT) || (SHADERPASS == SHADERPASS_RAYTRACING_FORWARD)
        
                    HDShadowContext shadowContext = InitShadowContext();
        
                    // Evaluate the shadow, the normal is guaranteed if shadow matte is enabled on this shader.
                    float3 shadow3;
                    ShadowLoopMin(shadowContext, posInput, normalize(fragInputs.tangentToWorld[2]), asuint(_ShadowMatteFilter), GetMeshRenderingLightLayer(), shadow3);
        
                    // Compute the average value in the fourth channel
                    float4 shadow = float4(shadow3, dot(shadow3, float3(1.0/3.0, 1.0/3.0, 1.0/3.0)));
        
                    float4 shadowColor = (1.0 - shadow) * surfaceDescription.ShadowTint.rgba;
                    float  localAlpha  = saturate(shadowColor.a + surfaceDescription.Alpha);
        
                    // Keep the nested lerp
                    // With no Color (bsdfData.color.rgb, bsdfData.color.a == 0.0f), just use ShadowColor*Color to avoid a ring of "white" around the shadow
                    // And mix color to consider the Color & ShadowColor alpha (from texture or/and color picker)
                    #ifdef _SURFACE_TYPE_TRANSPARENT
                        surfaceData.color = lerp(shadowColor.rgb * surfaceData.color, lerp(lerp(shadowColor.rgb, surfaceData.color, 1.0 - surfaceDescription.ShadowTint.a), surfaceData.color, shadow.rgb), surfaceDescription.Alpha);
                    #else
                        surfaceData.color = lerp(lerp(shadowColor.rgb, surfaceData.color, 1.0 - surfaceDescription.ShadowTint.a), surfaceData.color, shadow.rgb);
                    #endif
                    localAlpha = ApplyBlendMode(surfaceData.color, localAlpha).a;
        
                    surfaceDescription.Alpha = localAlpha;
        
                #elif SHADERPASS == SHADERPASS_PATH_TRACING
        
                    surfaceData.normalWS = fragInputs.tangentToWorld[2];
                    surfaceData.shadowTint = surfaceDescription.ShadowTint.rgba;
        
                #endif
        
            #endif // _ENABLE_SHADOW_MATTE
        }
        
            // --------------------------------------------------
            // Get Surface And BuiltinData
        
            void GetSurfaceAndBuiltinData(FragInputs fragInputs, float3 V, inout PositionInputs posInput, out SurfaceData surfaceData, out BuiltinData builtinData RAY_TRACING_OPTIONAL_PARAMETERS)
            {
                // Don't dither if displaced tessellation (we're fading out the displacement instead to match the next LOD)
                #if !defined(SHADER_STAGE_RAY_TRACING) && !defined(_TESSELLATION_DISPLACEMENT)
                #ifdef LOD_FADE_CROSSFADE // enable dithering LOD transition if user select CrossFade transition in LOD group
                LODDitheringTransition(ComputeFadeMaskSeed(V, posInput.positionSS), unity_LODFade.x);
                #endif
                #endif
        
                #ifndef SHADER_UNLIT
                #ifdef _DOUBLESIDED_ON
                    float3 doubleSidedConstants = _DoubleSidedConstants.xyz;
                #else
                    float3 doubleSidedConstants = float3(1.0, 1.0, 1.0);
                #endif
        
                ApplyDoubleSidedFlipOrMirror(fragInputs, doubleSidedConstants); // Apply double sided flip on the vertex normal
                #endif // SHADER_UNLIT
        
                SurfaceDescriptionInputs surfaceDescriptionInputs = FragInputsToSurfaceDescriptionInputs(fragInputs, V);
        
                #if defined(HAVE_VFX_MODIFICATION)
                GraphProperties properties;
                ZERO_INITIALIZE(GraphProperties, properties);
        
                GetElementPixelProperties(fragInputs, properties);
        
                SurfaceDescription surfaceDescription = SurfaceDescriptionFunction(surfaceDescriptionInputs, properties);
                #else
                SurfaceDescription surfaceDescription = SurfaceDescriptionFunction(surfaceDescriptionInputs);
                #endif
        
                // Perform alpha test very early to save performance (a killed pixel will not sample textures)
                // TODO: split graph evaluation to grab just alpha dependencies first? tricky..
                #ifdef _ALPHATEST_ON
                    float alphaCutoff = surfaceDescription.AlphaClipThreshold;
                    #if SHADERPASS == SHADERPASS_TRANSPARENT_DEPTH_PREPASS
                    // The TransparentDepthPrepass is also used with SSR transparent.
                    // If an artists enable transaprent SSR but not the TransparentDepthPrepass itself, then we use AlphaClipThreshold
                    // otherwise if TransparentDepthPrepass is enabled we use AlphaClipThresholdDepthPrepass
                    #elif SHADERPASS == SHADERPASS_TRANSPARENT_DEPTH_POSTPASS
                    // DepthPostpass always use its own alpha threshold
                    alphaCutoff = surfaceDescription.AlphaClipThresholdDepthPostpass;
                    #elif (SHADERPASS == SHADERPASS_SHADOWS) || (SHADERPASS == SHADERPASS_RAYTRACING_VISIBILITY)
                    // If use shadow threshold isn't enable we don't allow any test
                    #endif
        
                    GENERIC_ALPHA_TEST(surfaceDescription.Alpha, alphaCutoff);
                #endif
        
                #if !defined(SHADER_STAGE_RAY_TRACING) && _DEPTHOFFSET_ON
                ApplyDepthOffsetPositionInput(V, surfaceDescription.DepthOffset, GetViewForwardDir(), GetWorldToHClipMatrix(), posInput);
                #endif
        
                #ifndef SHADER_UNLIT
                float3 bentNormalWS;
                BuildSurfaceData(fragInputs, surfaceDescription, V, posInput, surfaceData, bentNormalWS);
        
                #ifdef FRAG_INPUTS_USE_TEXCOORD1
                    float4 lightmapTexCoord1 = fragInputs.texCoord1;
                #else
                    float4 lightmapTexCoord1 = float4(0,0,0,0);
                #endif
        
                #ifdef FRAG_INPUTS_USE_TEXCOORD2
                    float4 lightmapTexCoord2 = fragInputs.texCoord2;
                #else
                    float4 lightmapTexCoord2 = float4(0,0,0,0);
                #endif
        
                // Builtin Data
                // For back lighting we use the oposite vertex normal
                InitBuiltinData(posInput, surfaceDescription.Alpha, bentNormalWS, -fragInputs.tangentToWorld[2], lightmapTexCoord1, lightmapTexCoord2, builtinData);
        
                #else
                BuildSurfaceData(fragInputs, surfaceDescription, V, posInput, surfaceData);
        
                ZERO_BUILTIN_INITIALIZE(builtinData); // No call to InitBuiltinData as we don't have any lighting
                builtinData.opacity = surfaceDescription.Alpha;
        
                #if defined(DEBUG_DISPLAY)
                    // Light Layers are currently not used for the Unlit shader (because it is not lit)
                    // But Unlit objects do cast shadows according to their rendering layer mask, which is what we want to
                    // display in the light layers visualization mode, therefore we need the renderingLayers
                    builtinData.renderingLayers = GetMeshRenderingLightLayer();
                #endif
        
                #endif // SHADER_UNLIT
        
                #ifdef _ALPHATEST_ON
                    // Used for sharpening by alpha to mask - Alpha to covertage is only used with depth only and forward pass (no shadow pass, no transparent pass)
                    builtinData.alphaClipTreshold = alphaCutoff;
                #endif
        
                // override sampleBakedGI - not used by Unlit
        
                builtinData.emissiveColor = surfaceDescription.Emission;
        
                // Note this will not fully work on transparent surfaces (can check with _SURFACE_TYPE_TRANSPARENT define)
                // We will always overwrite vt feeback with the nearest. So behind transparent surfaces vt will not be resolved
                // This is a limitation of the current MRT approach.
                #ifdef UNITY_VIRTUAL_TEXTURING
                #endif
        
                #if _DEPTHOFFSET_ON
                builtinData.depthOffset = surfaceDescription.DepthOffset;
                #endif
        
                // TODO: We should generate distortion / distortionBlur for non distortion pass
                #if (SHADERPASS == SHADERPASS_DISTORTION)
                builtinData.distortion = surfaceDescription.Distortion;
                builtinData.distortionBlur = surfaceDescription.DistortionBlur;
                #endif
        
                #ifndef SHADER_UNLIT
                // PostInitBuiltinData call ApplyDebugToBuiltinData
                PostInitBuiltinData(V, posInput, surfaceData, builtinData);
                #else
                ApplyDebugToBuiltinData(builtinData);
                #endif
        
                RAY_TRACING_OPTIONAL_ALPHA_TEST_PASS
            }
        
            // --------------------------------------------------
            // Main
        
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/ShaderPass/ShaderPassDepthOnly.hlsl"
        
            // --------------------------------------------------
            // Visual Effect Vertex Invocations
        
        	#ifdef HAVE_VFX_MODIFICATION
        	#include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/VisualEffectVertex.hlsl"
        	#endif
        
            ENDHLSL
        }
        Pass
        {
            Name "SceneSelectionPass"
            Tags
            {
                "LightMode" = "SceneSelectionPass"
            }
        
            // Render State
            Cull Off
        
            // Debug
            // <None>
        
            // --------------------------------------------------
            // Pass
        
            HLSLPROGRAM
        
            // Pragmas
            #pragma instancing_options renderinglayer
        #pragma editor_sync_compilation
        #pragma target 4.5
        #pragma vertex Vert
        #pragma fragment Frag
        #pragma only_renderers d3d11 playstation xboxone xboxseries vulkan metal switch
        #pragma multi_compile_instancing
        
            // Keywords
            #pragma shader_feature _ _SURFACE_TYPE_TRANSPARENT
        #pragma shader_feature_local _BLENDMODE_OFF _BLENDMODE_ALPHA _BLENDMODE_ADD _BLENDMODE_PRE_MULTIPLY
        #pragma shader_feature_local _ _ADD_PRECOMPUTED_VELOCITY
        #pragma shader_feature_local _ _TRANSPARENT_WRITES_MOTION_VEC
        #pragma shader_feature_local_fragment _ _ENABLE_FOG_ON_TRANSPARENT
            // GraphKeywords: <None>
        
            // Early Instancing Defines
            // DotsInstancingOptions: <None>
        
            // Injected Instanced Properties (must be included before UnityInstancing.hlsl)
            // HybridV1InjectedBuiltinProperties: <None>
        
            // For custom interpolators to inject a substruct definition before FragInputs definition,
            // allowing for FragInputs to capture CI's intended for ShaderGraph's SDI.
            struct CustomInterpolators
        {
        };
        #define USE_CUSTOMINTERP_SUBSTRUCT
        
        
        
            // TODO: Merge FragInputsVFX substruct with CustomInterpolators.
        	#ifdef HAVE_VFX_MODIFICATION
        	struct FragInputsVFX
            {
                /* WARNING: $splice Could not find named fragment 'FragInputsVFX' */
            };
            #endif
        
            #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Common.hlsl"
        	#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/GeometricTools.hlsl" // Required by Tessellation.hlsl
        	#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Tessellation.hlsl"
            #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Texture.hlsl"
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderVariables.hlsl"
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/ShaderPass/ShaderPass.cs.hlsl"
            #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/TextureStack.hlsl" // Required to be include before we include properties as it define DECLARE_STACK_CB
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderGraphHeader.hlsl" // Need to be here for Gradient struct definition
        
            // --------------------------------------------------
            // Defines
        
            // Attribute
            #define ATTRIBUTES_NEED_NORMAL
            #define ATTRIBUTES_NEED_TANGENT
            #define VARYINGS_NEED_POSITION_WS
            #define VARYINGS_NEED_TANGENT_TO_WORLD
        
            #define HAVE_MESH_MODIFICATION
        
            //Strip down the FragInputs.hlsl (on graphics), so we can only optimize the interpolators we use.
            //if by accident something requests contents of FragInputs.hlsl, it will be caught as a compiler error
            //Frag inputs stripping is only enabled when FRAG_INPUTS_ENABLE_STRIPPING is set
            #if !defined(SHADER_STAGE_RAY_TRACING) && SHADERPASS != SHADERPASS_RAYTRACING_GBUFFER && SHADERPASS != SHADERPASS_FULL_SCREEN_DEBUG
            #define FRAG_INPUTS_ENABLE_STRIPPING
            #endif
        
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/ShaderPass/FragInputs.hlsl"
        
        
        
            #define SHADERPASS SHADERPASS_DEPTH_ONLY
        #define RAYTRACING_SHADER_GRAPH_DEFAULT
        #define SCENESELECTIONPASS 1
        #define REQUIRE_DEPTH_TEXTURE
        
        
            // Following two define are a workaround introduce in 10.1.x for RaytracingQualityNode
            // The ShaderGraph don't support correctly migration of this node as it serialize all the node data
            // in the json file making it impossible to uprgrade. Until we get a fix, we do a workaround here
            // to still allow us to rename the field and keyword of this node without breaking existing code.
            #ifdef RAYTRACING_SHADER_GRAPH_DEFAULT
            #define RAYTRACING_SHADER_GRAPH_HIGH
            #endif
        
            #ifdef RAYTRACING_SHADER_GRAPH_RAYTRACED
            #define RAYTRACING_SHADER_GRAPH_LOW
            #endif
            // end
        
            #ifndef SHADER_UNLIT
            // We need isFrontFace when using double sided - it is not required for unlit as in case of unlit double sided only drive the cullmode
            // VARYINGS_NEED_CULLFACE can be define by VaryingsMeshToPS.FaceSign input if a IsFrontFace Node is included in the shader graph.
            #if defined(_DOUBLESIDED_ON) && !defined(VARYINGS_NEED_CULLFACE)
                #define VARYINGS_NEED_CULLFACE
            #endif
            #endif
        
            // Specific Material Define
        // Setup a define to say we are an unlit shader
        #define SHADER_UNLIT
        
        // Following Macro are only used by Unlit material
        #if defined(_ENABLE_SHADOW_MATTE) && (SHADERPASS == SHADERPASS_FORWARD_UNLIT || SHADERPASS == SHADERPASS_PATH_TRACING)
        #define LIGHTLOOP_DISABLE_TILE_AND_CLUSTER
        #define HAS_LIGHTLOOP
        #endif
            // Caution: we can use the define SHADER_UNLIT onlit after the above Material include as it is the Unlit template who define it
        
            // To handle SSR on transparent correctly with a possibility to enable/disable it per framesettings
            // we should have a code like this:
            // if !defined(_DISABLE_SSR_TRANSPARENT)
            // pragma multi_compile _ WRITE_NORMAL_BUFFER
            // endif
            // i.e we enable the multicompile only if we can receive SSR or not, and then C# code drive
            // it based on if SSR transparent in frame settings and not (and stripper can strip it).
            // this is currently not possible with our current preprocessor as _DISABLE_SSR_TRANSPARENT is a keyword not a define
            // so instead we used this and chose to pay the extra cost of normal write even if SSR transaprent is disabled.
            // Ideally the shader graph generator should handle it but condition below can't be handle correctly for now.
            #if SHADERPASS == SHADERPASS_TRANSPARENT_DEPTH_PREPASS
            #if !defined(_DISABLE_SSR_TRANSPARENT) && !defined(SHADER_UNLIT)
                #define WRITE_NORMAL_BUFFER
            #endif
            #endif
        
            #ifndef DEBUG_DISPLAY
                // In case of opaque we don't want to perform the alpha test, it is done in depth prepass and we use depth equal for ztest (setup from UI)
                // Don't do it with debug display mode as it is possible there is no depth prepass in this case
                #if !defined(_SURFACE_TYPE_TRANSPARENT)
                    #if SHADERPASS == SHADERPASS_FORWARD
                    #define SHADERPASS_FORWARD_BYPASS_ALPHA_TEST
                    #elif SHADERPASS == SHADERPASS_GBUFFER
                    #define SHADERPASS_GBUFFER_BYPASS_ALPHA_TEST
                    #endif
                #endif
            #endif
        
            // Define _DEFERRED_CAPABLE_MATERIAL for shader capable to run in deferred pass
            #if defined(SHADER_LIT) && !defined(_SURFACE_TYPE_TRANSPARENT)
                #define _DEFERRED_CAPABLE_MATERIAL
            #endif
        
            // Translate transparent motion vector define
            #if defined(_TRANSPARENT_WRITES_MOTION_VEC) && defined(_SURFACE_TYPE_TRANSPARENT)
                #define _WRITE_TRANSPARENT_MOTION_VECTOR
            #endif
        
            // -- Graph Properties
            CBUFFER_START(UnityPerMaterial)
        float4 _Rotate_Projection;
        float _Noise_Scale;
        float _Speed;
        float _Vertexoffset;
        float4 _Remap_xy_zw;
        float4 _Color_Peak;
        float4 _Color_Valley;
        float _SmoothEdge1;
        float _SmoothEdge2;
        float _Cloud_Pow;
        float _Base_Scale;
        float _Base_Speed;
        float _BaseStrength;
        float _Emission_Strength;
        float _Curvate_Radius;
        float _Fresnel_Power;
        float _Fresnel_Opacity;
        float _Depth_Fade;
        float4 _EmissionColor;
        float _UseShadowThreshold;
        float4 _DoubleSidedConstants;
        float _BlendMode;
        float _EnableBlendModePreserveSpecularLighting;
        CBUFFER_END
        
        // Object and Global properties
        
            // -- Property used by ScenePickingPass
            #ifdef SCENEPICKINGPASS
            float4 _SelectionID;
            #endif
        
            // -- Properties used by SceneSelectionPass
            #ifdef SCENESELECTIONPASS
            int _ObjectId;
            int _PassValue;
            #endif
        
            // Includes
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/PickingSpaceTransforms.hlsl"
        #include "Packages/com.unity.render-pipelines.high-definition/Runtime/Debug/DebugDisplay.hlsl"
        #include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Material.hlsl"
        #include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Unlit/Unlit.hlsl"
        #include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/BuiltinUtilities.hlsl"
        #include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/MaterialUtilities.hlsl"
        #include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderGraphFunctions.hlsl"
        	// GraphIncludes: <None>
        
            // --------------------------------------------------
            // Structs and Packing
        
            struct AttributesMesh
        {
             float3 positionOS : POSITION;
             float3 normalOS : NORMAL;
             float4 tangentOS : TANGENT;
            #if UNITY_ANY_INSTANCING_ENABLED
             uint instanceID : INSTANCEID_SEMANTIC;
            #endif
        };
        struct VaryingsMeshToPS
        {
            SV_POSITION_QUALIFIERS float4 positionCS : SV_POSITION;
             float3 positionRWS;
             float3 normalWS;
             float4 tangentWS;
            #if UNITY_ANY_INSTANCING_ENABLED
             uint instanceID : CUSTOM_INSTANCE_ID;
            #endif
        };
        struct VertexDescriptionInputs
        {
             float3 ObjectSpaceNormal;
             float3 ObjectSpaceTangent;
             float3 ObjectSpacePosition;
             float3 TimeParameters;
        };
        struct SurfaceDescriptionInputs
        {
             float3 WorldSpaceNormal;
             float3 WorldSpaceViewDirection;
             float3 ObjectSpacePosition;
             float3 WorldSpacePosition;
             float4 ScreenPosition;
             float3 TimeParameters;
        };
        struct PackedVaryingsMeshToPS
        {
            SV_POSITION_QUALIFIERS float4 positionCS : SV_POSITION;
             float3 interp0 : INTERP0;
             float3 interp1 : INTERP1;
             float4 interp2 : INTERP2;
            #if UNITY_ANY_INSTANCING_ENABLED
             uint instanceID : CUSTOM_INSTANCE_ID;
            #endif
        };
        
            PackedVaryingsMeshToPS PackVaryingsMeshToPS (VaryingsMeshToPS input)
        {
            PackedVaryingsMeshToPS output;
            ZERO_INITIALIZE(PackedVaryingsMeshToPS, output);
            output.positionCS = input.positionCS;
            output.interp0.xyz =  input.positionRWS;
            output.interp1.xyz =  input.normalWS;
            output.interp2.xyzw =  input.tangentWS;
            #if UNITY_ANY_INSTANCING_ENABLED
            output.instanceID = input.instanceID;
            #endif
            return output;
        }
        
        VaryingsMeshToPS UnpackVaryingsMeshToPS (PackedVaryingsMeshToPS input)
        {
            VaryingsMeshToPS output;
            output.positionCS = input.positionCS;
            output.positionRWS = input.interp0.xyz;
            output.normalWS = input.interp1.xyz;
            output.tangentWS = input.interp2.xyzw;
            #if UNITY_ANY_INSTANCING_ENABLED
            output.instanceID = input.instanceID;
            #endif
            return output;
        }
        
        
            // --------------------------------------------------
            // Graph
        
        
            // Graph Functions
            
        void Unity_Distance_float3(float3 A, float3 B, out float Out)
        {
            Out = distance(A, B);
        }
        
        void Unity_Divide_float(float A, float B, out float Out)
        {
            Out = A / B;
        }
        
        void Unity_Power_float(float A, float B, out float Out)
        {
            Out = pow(A, B);
        }
        
        void Unity_Multiply_float3_float3(float3 A, float3 B, out float3 Out)
        {
            Out = A * B;
        }
        
        void Unity_Rotate_About_Axis_Radians_float(float3 In, float3 Axis, float Rotation, out float3 Out)
        {
            float s = sin(Rotation);
            float c = cos(Rotation);
            float one_minus_c = 1.0 - c;
        
            Axis = normalize(Axis);
        
            float3x3 rot_mat = { one_minus_c * Axis.x * Axis.x + c,            one_minus_c * Axis.x * Axis.y - Axis.z * s,     one_minus_c * Axis.z * Axis.x + Axis.y * s,
                                      one_minus_c * Axis.x * Axis.y + Axis.z * s,   one_minus_c * Axis.y * Axis.y + c,              one_minus_c * Axis.y * Axis.z - Axis.x * s,
                                      one_minus_c * Axis.z * Axis.x - Axis.y * s,   one_minus_c * Axis.y * Axis.z + Axis.x * s,     one_minus_c * Axis.z * Axis.z + c
                                    };
        
            Out = mul(rot_mat,  In);
        }
        
        void Unity_Multiply_float_float(float A, float B, out float Out)
        {
            Out = A * B;
        }
        
        void Unity_TilingAndOffset_float(float2 UV, float2 Tiling, float2 Offset, out float2 Out)
        {
            Out = UV * Tiling + Offset;
        }
        
        
        float2 Unity_GradientNoise_Dir_float(float2 p)
        {
            // Permutation and hashing used in webgl-nosie goo.gl/pX7HtC
            p = p % 289;
            // need full precision, otherwise half overflows when p > 1
            float x = float(34 * p.x + 1) * p.x % 289 + p.y;
            x = (34 * x + 1) * x % 289;
            x = frac(x / 41) * 2 - 1;
            return normalize(float2(x - floor(x + 0.5), abs(x) - 0.5));
        }
        
        void Unity_GradientNoise_float(float2 UV, float Scale, out float Out)
        {
            float2 p = UV * Scale;
            float2 ip = floor(p);
            float2 fp = frac(p);
            float d00 = dot(Unity_GradientNoise_Dir_float(ip), fp);
            float d01 = dot(Unity_GradientNoise_Dir_float(ip + float2(0, 1)), fp - float2(0, 1));
            float d10 = dot(Unity_GradientNoise_Dir_float(ip + float2(1, 0)), fp - float2(1, 0));
            float d11 = dot(Unity_GradientNoise_Dir_float(ip + float2(1, 1)), fp - float2(1, 1));
            fp = fp * fp * fp * (fp * (fp * 6 - 15) + 10);
            Out = lerp(lerp(d00, d01, fp.y), lerp(d10, d11, fp.y), fp.x) + 0.5;
        }
        
        void Unity_Add_float(float A, float B, out float Out)
        {
            Out = A + B;
        }
        
        void Unity_Saturate_float(float In, out float Out)
        {
            Out = saturate(In);
        }
        
        void Unity_Combine_float(float R, float G, float B, float A, out float4 RGBA, out float3 RGB, out float2 RG)
        {
            RGBA = float4(R, G, B, A);
            RGB = float3(R, G, B);
            RG = float2(R, G);
        }
        
        void Unity_Remap_float(float In, float2 InMinMax, float2 OutMinMax, out float Out)
        {
            Out = OutMinMax.x + (In - InMinMax.x) * (OutMinMax.y - OutMinMax.x) / (InMinMax.y - InMinMax.x);
        }
        
        void Unity_Absolute_float(float In, out float Out)
        {
            Out = abs(In);
        }
        
        void Unity_Smoothstep_float(float Edge1, float Edge2, float In, out float Out)
        {
            Out = smoothstep(Edge1, Edge2, In);
        }
        
        void Unity_Add_float3(float3 A, float3 B, out float3 Out)
        {
            Out = A + B;
        }
        
        void Unity_FresnelEffect_float(float3 Normal, float3 ViewDir, float Power, out float Out)
        {
            Out = pow((1.0 - saturate(dot(normalize(Normal), normalize(ViewDir)))), Power);
        }
        
        void Unity_Lerp_float4(float4 A, float4 B, float4 T, out float4 Out)
        {
            Out = lerp(A, B, T);
        }
        
        void Unity_Add_float4(float4 A, float4 B, out float4 Out)
        {
            Out = A + B;
        }
        
        void Unity_Multiply_float4_float4(float4 A, float4 B, out float4 Out)
        {
            Out = A * B;
        }
        
        void Unity_SceneDepth_Eye_float(float4 UV, out float Out)
        {
            if (unity_OrthoParams.w == 1.0)
            {
                Out = LinearEyeDepth(ComputeWorldSpacePosition(UV.xy, SHADERGRAPH_SAMPLE_SCENE_DEPTH(UV.xy), UNITY_MATRIX_I_VP), UNITY_MATRIX_V);
            }
            else
            {
                Out = LinearEyeDepth(SHADERGRAPH_SAMPLE_SCENE_DEPTH(UV.xy), _ZBufferParams);
            }
        }
        
        void Unity_Subtract_float(float A, float B, out float Out)
        {
            Out = A - B;
        }
        
            // Graph Vertex
            struct VertexDescription
        {
            float3 Position;
            float3 Normal;
            float3 Tangent;
        };
        
        VertexDescription VertexDescriptionFunction(VertexDescriptionInputs IN)
        {
            VertexDescription description = (VertexDescription)0;
            float _Distance_389dd396e31949b9a8a01d35896316a6_Out_2;
            Unity_Distance_float3(SHADERGRAPH_OBJECT_POSITION, IN.ObjectSpacePosition, _Distance_389dd396e31949b9a8a01d35896316a6_Out_2);
            float _Property_d58669debb0246fe82fb0fb0bffa2edc_Out_0 = _Curvate_Radius;
            float _Divide_0b143990dbbc4cbdb5129fcbf5511012_Out_2;
            Unity_Divide_float(_Distance_389dd396e31949b9a8a01d35896316a6_Out_2, _Property_d58669debb0246fe82fb0fb0bffa2edc_Out_0, _Divide_0b143990dbbc4cbdb5129fcbf5511012_Out_2);
            float _Power_89ab1e29e2cb42a9acd2aed36f4fdcfe_Out_2;
            Unity_Power_float(_Divide_0b143990dbbc4cbdb5129fcbf5511012_Out_2, 2, _Power_89ab1e29e2cb42a9acd2aed36f4fdcfe_Out_2);
            float3 _Multiply_22e187ffacc7402bbe63087272b7efb5_Out_2;
            Unity_Multiply_float3_float3(IN.ObjectSpaceNormal, (_Power_89ab1e29e2cb42a9acd2aed36f4fdcfe_Out_2.xxx), _Multiply_22e187ffacc7402bbe63087272b7efb5_Out_2);
            float _Property_7d8e49b5efe94dea8210c34a6319b1ef_Out_0 = _SmoothEdge1;
            float _Property_09307b889e8945078bacabda50cca5c6_Out_0 = _SmoothEdge2;
            float4 _Property_a8d53d7ea07349e0979b956475bdd7cc_Out_0 = _Rotate_Projection;
            float _Split_7d12b2bb5feb46d685603473d0cf5818_R_1 = _Property_a8d53d7ea07349e0979b956475bdd7cc_Out_0[0];
            float _Split_7d12b2bb5feb46d685603473d0cf5818_G_2 = _Property_a8d53d7ea07349e0979b956475bdd7cc_Out_0[1];
            float _Split_7d12b2bb5feb46d685603473d0cf5818_B_3 = _Property_a8d53d7ea07349e0979b956475bdd7cc_Out_0[2];
            float _Split_7d12b2bb5feb46d685603473d0cf5818_A_4 = _Property_a8d53d7ea07349e0979b956475bdd7cc_Out_0[3];
            float3 _RotateAboutAxis_1b91481bceed4e9a82a13975af123b02_Out_3;
            Unity_Rotate_About_Axis_Radians_float(IN.ObjectSpacePosition, (_Property_a8d53d7ea07349e0979b956475bdd7cc_Out_0.xyz), _Split_7d12b2bb5feb46d685603473d0cf5818_A_4, _RotateAboutAxis_1b91481bceed4e9a82a13975af123b02_Out_3);
            float _Property_258f4645340c46f69274c9f077f1a73c_Out_0 = _Speed;
            float _Multiply_94f6d857831c4e69b53b9bfc92dd852f_Out_2;
            Unity_Multiply_float_float(IN.TimeParameters.x, _Property_258f4645340c46f69274c9f077f1a73c_Out_0, _Multiply_94f6d857831c4e69b53b9bfc92dd852f_Out_2);
            float2 _TilingAndOffset_6cb9fd57231c4a429c9c0fe5aeb7cc58_Out_3;
            Unity_TilingAndOffset_float((_RotateAboutAxis_1b91481bceed4e9a82a13975af123b02_Out_3.xy), float2 (1, 1), (_Multiply_94f6d857831c4e69b53b9bfc92dd852f_Out_2.xx), _TilingAndOffset_6cb9fd57231c4a429c9c0fe5aeb7cc58_Out_3);
            float _Property_2b9001a870d04f8eb60f5d7e1ce909c5_Out_0 = _Noise_Scale;
            float _GradientNoise_061679506b214bb8b4792ec4dfe82ec6_Out_2;
            Unity_GradientNoise_float(_TilingAndOffset_6cb9fd57231c4a429c9c0fe5aeb7cc58_Out_3, _Property_2b9001a870d04f8eb60f5d7e1ce909c5_Out_0, _GradientNoise_061679506b214bb8b4792ec4dfe82ec6_Out_2);
            float2 _TilingAndOffset_1d2491b5855e49d3b2e6b5dbe5db07d4_Out_3;
            Unity_TilingAndOffset_float((_RotateAboutAxis_1b91481bceed4e9a82a13975af123b02_Out_3.xy), float2 (1, 1), float2 (0, 0), _TilingAndOffset_1d2491b5855e49d3b2e6b5dbe5db07d4_Out_3);
            float _GradientNoise_8a27c3fb323f4db1b38f287380605198_Out_2;
            Unity_GradientNoise_float(_TilingAndOffset_1d2491b5855e49d3b2e6b5dbe5db07d4_Out_3, _Property_2b9001a870d04f8eb60f5d7e1ce909c5_Out_0, _GradientNoise_8a27c3fb323f4db1b38f287380605198_Out_2);
            float _Add_a6dd2d6e3f564decbca34ec03a419130_Out_2;
            Unity_Add_float(_GradientNoise_061679506b214bb8b4792ec4dfe82ec6_Out_2, _GradientNoise_8a27c3fb323f4db1b38f287380605198_Out_2, _Add_a6dd2d6e3f564decbca34ec03a419130_Out_2);
            float _Divide_a757ea7167f343ecaec30e69b58c9bae_Out_2;
            Unity_Divide_float(_Add_a6dd2d6e3f564decbca34ec03a419130_Out_2, 2, _Divide_a757ea7167f343ecaec30e69b58c9bae_Out_2);
            float _Saturate_f355ba5a467f4488b7ec89e8a08484a3_Out_1;
            Unity_Saturate_float(_Divide_a757ea7167f343ecaec30e69b58c9bae_Out_2, _Saturate_f355ba5a467f4488b7ec89e8a08484a3_Out_1);
            float _Property_96da655cc17e4594836aa02d74efe33c_Out_0 = _Cloud_Pow;
            float _Power_318bede735044ec6811f2a5c345b7d73_Out_2;
            Unity_Power_float(_Saturate_f355ba5a467f4488b7ec89e8a08484a3_Out_1, _Property_96da655cc17e4594836aa02d74efe33c_Out_0, _Power_318bede735044ec6811f2a5c345b7d73_Out_2);
            float4 _Property_317e8becc0724841a13cbcf8d4c4efbc_Out_0 = _Remap_xy_zw;
            float _Split_3dee68ff9a374966b7612da59c6ac20a_R_1 = _Property_317e8becc0724841a13cbcf8d4c4efbc_Out_0[0];
            float _Split_3dee68ff9a374966b7612da59c6ac20a_G_2 = _Property_317e8becc0724841a13cbcf8d4c4efbc_Out_0[1];
            float _Split_3dee68ff9a374966b7612da59c6ac20a_B_3 = _Property_317e8becc0724841a13cbcf8d4c4efbc_Out_0[2];
            float _Split_3dee68ff9a374966b7612da59c6ac20a_A_4 = _Property_317e8becc0724841a13cbcf8d4c4efbc_Out_0[3];
            float4 _Combine_4e3ec9a6e4064091bba919631e732b7a_RGBA_4;
            float3 _Combine_4e3ec9a6e4064091bba919631e732b7a_RGB_5;
            float2 _Combine_4e3ec9a6e4064091bba919631e732b7a_RG_6;
            Unity_Combine_float(_Split_3dee68ff9a374966b7612da59c6ac20a_R_1, _Split_3dee68ff9a374966b7612da59c6ac20a_G_2, 0, 0, _Combine_4e3ec9a6e4064091bba919631e732b7a_RGBA_4, _Combine_4e3ec9a6e4064091bba919631e732b7a_RGB_5, _Combine_4e3ec9a6e4064091bba919631e732b7a_RG_6);
            float4 _Combine_6f976751f1234c77908b163e59da18bb_RGBA_4;
            float3 _Combine_6f976751f1234c77908b163e59da18bb_RGB_5;
            float2 _Combine_6f976751f1234c77908b163e59da18bb_RG_6;
            Unity_Combine_float(_Split_3dee68ff9a374966b7612da59c6ac20a_B_3, _Split_3dee68ff9a374966b7612da59c6ac20a_A_4, 0, 0, _Combine_6f976751f1234c77908b163e59da18bb_RGBA_4, _Combine_6f976751f1234c77908b163e59da18bb_RGB_5, _Combine_6f976751f1234c77908b163e59da18bb_RG_6);
            float _Remap_a11bf825d8d54f198c2355e6d3cc1fba_Out_3;
            Unity_Remap_float(_Power_318bede735044ec6811f2a5c345b7d73_Out_2, _Combine_4e3ec9a6e4064091bba919631e732b7a_RG_6, _Combine_6f976751f1234c77908b163e59da18bb_RG_6, _Remap_a11bf825d8d54f198c2355e6d3cc1fba_Out_3);
            float _Absolute_553a57701af34a45a18ca7b2af677c8a_Out_1;
            Unity_Absolute_float(_Remap_a11bf825d8d54f198c2355e6d3cc1fba_Out_3, _Absolute_553a57701af34a45a18ca7b2af677c8a_Out_1);
            float _Smoothstep_6babd4aa745b40db842b941b96adf7e9_Out_3;
            Unity_Smoothstep_float(_Property_7d8e49b5efe94dea8210c34a6319b1ef_Out_0, _Property_09307b889e8945078bacabda50cca5c6_Out_0, _Absolute_553a57701af34a45a18ca7b2af677c8a_Out_1, _Smoothstep_6babd4aa745b40db842b941b96adf7e9_Out_3);
            float _Property_17631cb6b51c44b593b4fb1f0ac8fa75_Out_0 = _Base_Speed;
            float _Multiply_2e98faddc46143bea8e48ab17d0e1c15_Out_2;
            Unity_Multiply_float_float(IN.TimeParameters.x, _Property_17631cb6b51c44b593b4fb1f0ac8fa75_Out_0, _Multiply_2e98faddc46143bea8e48ab17d0e1c15_Out_2);
            float2 _TilingAndOffset_d8c83d87b12649f7b6a3902973c4457a_Out_3;
            Unity_TilingAndOffset_float((_RotateAboutAxis_1b91481bceed4e9a82a13975af123b02_Out_3.xy), float2 (1, 1), (_Multiply_2e98faddc46143bea8e48ab17d0e1c15_Out_2.xx), _TilingAndOffset_d8c83d87b12649f7b6a3902973c4457a_Out_3);
            float _Property_2792df33a4d44e20b2f71fe244d5f369_Out_0 = _Base_Scale;
            float _GradientNoise_702d412fe90e4c64b91e9defbe1ffff2_Out_2;
            Unity_GradientNoise_float(_TilingAndOffset_d8c83d87b12649f7b6a3902973c4457a_Out_3, _Property_2792df33a4d44e20b2f71fe244d5f369_Out_0, _GradientNoise_702d412fe90e4c64b91e9defbe1ffff2_Out_2);
            float _Property_a965b78b3be84255ae4ff1617bd2df01_Out_0 = _BaseStrength;
            float _Multiply_9880df30952a454781c1f0c8356100dd_Out_2;
            Unity_Multiply_float_float(_GradientNoise_702d412fe90e4c64b91e9defbe1ffff2_Out_2, _Property_a965b78b3be84255ae4ff1617bd2df01_Out_0, _Multiply_9880df30952a454781c1f0c8356100dd_Out_2);
            float _Add_98d9cdbb65e44e0282692d35bd9d237b_Out_2;
            Unity_Add_float(_Smoothstep_6babd4aa745b40db842b941b96adf7e9_Out_3, _Multiply_9880df30952a454781c1f0c8356100dd_Out_2, _Add_98d9cdbb65e44e0282692d35bd9d237b_Out_2);
            float _Add_d305fd085a9b459da3d4bd5108430b3f_Out_2;
            Unity_Add_float(1, _Property_a965b78b3be84255ae4ff1617bd2df01_Out_0, _Add_d305fd085a9b459da3d4bd5108430b3f_Out_2);
            float _Divide_55db7b7a0b8b481d83fb512a13a2dba6_Out_2;
            Unity_Divide_float(_Add_98d9cdbb65e44e0282692d35bd9d237b_Out_2, _Add_d305fd085a9b459da3d4bd5108430b3f_Out_2, _Divide_55db7b7a0b8b481d83fb512a13a2dba6_Out_2);
            float3 _Multiply_639bbd01ca0947fdbb4245744090b06e_Out_2;
            Unity_Multiply_float3_float3(IN.ObjectSpaceNormal, (_Divide_55db7b7a0b8b481d83fb512a13a2dba6_Out_2.xxx), _Multiply_639bbd01ca0947fdbb4245744090b06e_Out_2);
            float _Property_8b198d3112494fb98defdd5dc1b13601_Out_0 = _Vertexoffset;
            float3 _Multiply_2119a238e1d14c34879c4926fe468be5_Out_2;
            Unity_Multiply_float3_float3(_Multiply_639bbd01ca0947fdbb4245744090b06e_Out_2, (_Property_8b198d3112494fb98defdd5dc1b13601_Out_0.xxx), _Multiply_2119a238e1d14c34879c4926fe468be5_Out_2);
            float3 _Add_18a07d3e52a847f594f01810747a3393_Out_2;
            Unity_Add_float3(IN.ObjectSpacePosition, _Multiply_2119a238e1d14c34879c4926fe468be5_Out_2, _Add_18a07d3e52a847f594f01810747a3393_Out_2);
            float3 _Add_b9cf96b2dcd84792b2e40dd036537586_Out_2;
            Unity_Add_float3(_Multiply_22e187ffacc7402bbe63087272b7efb5_Out_2, _Add_18a07d3e52a847f594f01810747a3393_Out_2, _Add_b9cf96b2dcd84792b2e40dd036537586_Out_2);
            description.Position = _Add_b9cf96b2dcd84792b2e40dd036537586_Out_2;
            description.Normal = IN.ObjectSpaceNormal;
            description.Tangent = IN.ObjectSpaceTangent;
            return description;
        }
        
            // Graph Pixel
            struct SurfaceDescription
        {
            float3 BaseColor;
            float3 Emission;
            float Alpha;
        };
        
        SurfaceDescription SurfaceDescriptionFunction(SurfaceDescriptionInputs IN)
        {
            SurfaceDescription surface = (SurfaceDescription)0;
            float _Property_7d8e49b5efe94dea8210c34a6319b1ef_Out_0 = _SmoothEdge1;
            float _Property_09307b889e8945078bacabda50cca5c6_Out_0 = _SmoothEdge2;
            float4 _Property_a8d53d7ea07349e0979b956475bdd7cc_Out_0 = _Rotate_Projection;
            float _Split_7d12b2bb5feb46d685603473d0cf5818_R_1 = _Property_a8d53d7ea07349e0979b956475bdd7cc_Out_0[0];
            float _Split_7d12b2bb5feb46d685603473d0cf5818_G_2 = _Property_a8d53d7ea07349e0979b956475bdd7cc_Out_0[1];
            float _Split_7d12b2bb5feb46d685603473d0cf5818_B_3 = _Property_a8d53d7ea07349e0979b956475bdd7cc_Out_0[2];
            float _Split_7d12b2bb5feb46d685603473d0cf5818_A_4 = _Property_a8d53d7ea07349e0979b956475bdd7cc_Out_0[3];
            float3 _RotateAboutAxis_1b91481bceed4e9a82a13975af123b02_Out_3;
            Unity_Rotate_About_Axis_Radians_float(IN.ObjectSpacePosition, (_Property_a8d53d7ea07349e0979b956475bdd7cc_Out_0.xyz), _Split_7d12b2bb5feb46d685603473d0cf5818_A_4, _RotateAboutAxis_1b91481bceed4e9a82a13975af123b02_Out_3);
            float _Property_258f4645340c46f69274c9f077f1a73c_Out_0 = _Speed;
            float _Multiply_94f6d857831c4e69b53b9bfc92dd852f_Out_2;
            Unity_Multiply_float_float(IN.TimeParameters.x, _Property_258f4645340c46f69274c9f077f1a73c_Out_0, _Multiply_94f6d857831c4e69b53b9bfc92dd852f_Out_2);
            float2 _TilingAndOffset_6cb9fd57231c4a429c9c0fe5aeb7cc58_Out_3;
            Unity_TilingAndOffset_float((_RotateAboutAxis_1b91481bceed4e9a82a13975af123b02_Out_3.xy), float2 (1, 1), (_Multiply_94f6d857831c4e69b53b9bfc92dd852f_Out_2.xx), _TilingAndOffset_6cb9fd57231c4a429c9c0fe5aeb7cc58_Out_3);
            float _Property_2b9001a870d04f8eb60f5d7e1ce909c5_Out_0 = _Noise_Scale;
            float _GradientNoise_061679506b214bb8b4792ec4dfe82ec6_Out_2;
            Unity_GradientNoise_float(_TilingAndOffset_6cb9fd57231c4a429c9c0fe5aeb7cc58_Out_3, _Property_2b9001a870d04f8eb60f5d7e1ce909c5_Out_0, _GradientNoise_061679506b214bb8b4792ec4dfe82ec6_Out_2);
            float2 _TilingAndOffset_1d2491b5855e49d3b2e6b5dbe5db07d4_Out_3;
            Unity_TilingAndOffset_float((_RotateAboutAxis_1b91481bceed4e9a82a13975af123b02_Out_3.xy), float2 (1, 1), float2 (0, 0), _TilingAndOffset_1d2491b5855e49d3b2e6b5dbe5db07d4_Out_3);
            float _GradientNoise_8a27c3fb323f4db1b38f287380605198_Out_2;
            Unity_GradientNoise_float(_TilingAndOffset_1d2491b5855e49d3b2e6b5dbe5db07d4_Out_3, _Property_2b9001a870d04f8eb60f5d7e1ce909c5_Out_0, _GradientNoise_8a27c3fb323f4db1b38f287380605198_Out_2);
            float _Add_a6dd2d6e3f564decbca34ec03a419130_Out_2;
            Unity_Add_float(_GradientNoise_061679506b214bb8b4792ec4dfe82ec6_Out_2, _GradientNoise_8a27c3fb323f4db1b38f287380605198_Out_2, _Add_a6dd2d6e3f564decbca34ec03a419130_Out_2);
            float _Divide_a757ea7167f343ecaec30e69b58c9bae_Out_2;
            Unity_Divide_float(_Add_a6dd2d6e3f564decbca34ec03a419130_Out_2, 2, _Divide_a757ea7167f343ecaec30e69b58c9bae_Out_2);
            float _Saturate_f355ba5a467f4488b7ec89e8a08484a3_Out_1;
            Unity_Saturate_float(_Divide_a757ea7167f343ecaec30e69b58c9bae_Out_2, _Saturate_f355ba5a467f4488b7ec89e8a08484a3_Out_1);
            float _Property_96da655cc17e4594836aa02d74efe33c_Out_0 = _Cloud_Pow;
            float _Power_318bede735044ec6811f2a5c345b7d73_Out_2;
            Unity_Power_float(_Saturate_f355ba5a467f4488b7ec89e8a08484a3_Out_1, _Property_96da655cc17e4594836aa02d74efe33c_Out_0, _Power_318bede735044ec6811f2a5c345b7d73_Out_2);
            float4 _Property_317e8becc0724841a13cbcf8d4c4efbc_Out_0 = _Remap_xy_zw;
            float _Split_3dee68ff9a374966b7612da59c6ac20a_R_1 = _Property_317e8becc0724841a13cbcf8d4c4efbc_Out_0[0];
            float _Split_3dee68ff9a374966b7612da59c6ac20a_G_2 = _Property_317e8becc0724841a13cbcf8d4c4efbc_Out_0[1];
            float _Split_3dee68ff9a374966b7612da59c6ac20a_B_3 = _Property_317e8becc0724841a13cbcf8d4c4efbc_Out_0[2];
            float _Split_3dee68ff9a374966b7612da59c6ac20a_A_4 = _Property_317e8becc0724841a13cbcf8d4c4efbc_Out_0[3];
            float4 _Combine_4e3ec9a6e4064091bba919631e732b7a_RGBA_4;
            float3 _Combine_4e3ec9a6e4064091bba919631e732b7a_RGB_5;
            float2 _Combine_4e3ec9a6e4064091bba919631e732b7a_RG_6;
            Unity_Combine_float(_Split_3dee68ff9a374966b7612da59c6ac20a_R_1, _Split_3dee68ff9a374966b7612da59c6ac20a_G_2, 0, 0, _Combine_4e3ec9a6e4064091bba919631e732b7a_RGBA_4, _Combine_4e3ec9a6e4064091bba919631e732b7a_RGB_5, _Combine_4e3ec9a6e4064091bba919631e732b7a_RG_6);
            float4 _Combine_6f976751f1234c77908b163e59da18bb_RGBA_4;
            float3 _Combine_6f976751f1234c77908b163e59da18bb_RGB_5;
            float2 _Combine_6f976751f1234c77908b163e59da18bb_RG_6;
            Unity_Combine_float(_Split_3dee68ff9a374966b7612da59c6ac20a_B_3, _Split_3dee68ff9a374966b7612da59c6ac20a_A_4, 0, 0, _Combine_6f976751f1234c77908b163e59da18bb_RGBA_4, _Combine_6f976751f1234c77908b163e59da18bb_RGB_5, _Combine_6f976751f1234c77908b163e59da18bb_RG_6);
            float _Remap_a11bf825d8d54f198c2355e6d3cc1fba_Out_3;
            Unity_Remap_float(_Power_318bede735044ec6811f2a5c345b7d73_Out_2, _Combine_4e3ec9a6e4064091bba919631e732b7a_RG_6, _Combine_6f976751f1234c77908b163e59da18bb_RG_6, _Remap_a11bf825d8d54f198c2355e6d3cc1fba_Out_3);
            float _Absolute_553a57701af34a45a18ca7b2af677c8a_Out_1;
            Unity_Absolute_float(_Remap_a11bf825d8d54f198c2355e6d3cc1fba_Out_3, _Absolute_553a57701af34a45a18ca7b2af677c8a_Out_1);
            float _Smoothstep_6babd4aa745b40db842b941b96adf7e9_Out_3;
            Unity_Smoothstep_float(_Property_7d8e49b5efe94dea8210c34a6319b1ef_Out_0, _Property_09307b889e8945078bacabda50cca5c6_Out_0, _Absolute_553a57701af34a45a18ca7b2af677c8a_Out_1, _Smoothstep_6babd4aa745b40db842b941b96adf7e9_Out_3);
            float _Property_17631cb6b51c44b593b4fb1f0ac8fa75_Out_0 = _Base_Speed;
            float _Multiply_2e98faddc46143bea8e48ab17d0e1c15_Out_2;
            Unity_Multiply_float_float(IN.TimeParameters.x, _Property_17631cb6b51c44b593b4fb1f0ac8fa75_Out_0, _Multiply_2e98faddc46143bea8e48ab17d0e1c15_Out_2);
            float2 _TilingAndOffset_d8c83d87b12649f7b6a3902973c4457a_Out_3;
            Unity_TilingAndOffset_float((_RotateAboutAxis_1b91481bceed4e9a82a13975af123b02_Out_3.xy), float2 (1, 1), (_Multiply_2e98faddc46143bea8e48ab17d0e1c15_Out_2.xx), _TilingAndOffset_d8c83d87b12649f7b6a3902973c4457a_Out_3);
            float _Property_2792df33a4d44e20b2f71fe244d5f369_Out_0 = _Base_Scale;
            float _GradientNoise_702d412fe90e4c64b91e9defbe1ffff2_Out_2;
            Unity_GradientNoise_float(_TilingAndOffset_d8c83d87b12649f7b6a3902973c4457a_Out_3, _Property_2792df33a4d44e20b2f71fe244d5f369_Out_0, _GradientNoise_702d412fe90e4c64b91e9defbe1ffff2_Out_2);
            float _Property_a965b78b3be84255ae4ff1617bd2df01_Out_0 = _BaseStrength;
            float _Multiply_9880df30952a454781c1f0c8356100dd_Out_2;
            Unity_Multiply_float_float(_GradientNoise_702d412fe90e4c64b91e9defbe1ffff2_Out_2, _Property_a965b78b3be84255ae4ff1617bd2df01_Out_0, _Multiply_9880df30952a454781c1f0c8356100dd_Out_2);
            float _Add_98d9cdbb65e44e0282692d35bd9d237b_Out_2;
            Unity_Add_float(_Smoothstep_6babd4aa745b40db842b941b96adf7e9_Out_3, _Multiply_9880df30952a454781c1f0c8356100dd_Out_2, _Add_98d9cdbb65e44e0282692d35bd9d237b_Out_2);
            float _Add_d305fd085a9b459da3d4bd5108430b3f_Out_2;
            Unity_Add_float(1, _Property_a965b78b3be84255ae4ff1617bd2df01_Out_0, _Add_d305fd085a9b459da3d4bd5108430b3f_Out_2);
            float _Divide_55db7b7a0b8b481d83fb512a13a2dba6_Out_2;
            Unity_Divide_float(_Add_98d9cdbb65e44e0282692d35bd9d237b_Out_2, _Add_d305fd085a9b459da3d4bd5108430b3f_Out_2, _Divide_55db7b7a0b8b481d83fb512a13a2dba6_Out_2);
            float _Property_5a371e38a60143fcae81da7313c1bf15_Out_0 = _Fresnel_Power;
            float _FresnelEffect_4c470240dea248acb0092676d71437cb_Out_3;
            Unity_FresnelEffect_float(IN.WorldSpaceNormal, IN.WorldSpaceViewDirection, _Property_5a371e38a60143fcae81da7313c1bf15_Out_0, _FresnelEffect_4c470240dea248acb0092676d71437cb_Out_3);
            float _Multiply_384d15a2ef094b7e8b1ec6d69dada246_Out_2;
            Unity_Multiply_float_float(_Divide_55db7b7a0b8b481d83fb512a13a2dba6_Out_2, _FresnelEffect_4c470240dea248acb0092676d71437cb_Out_3, _Multiply_384d15a2ef094b7e8b1ec6d69dada246_Out_2);
            float _Property_3c23366c651c4949b03cb10c14ae0a27_Out_0 = _Fresnel_Opacity;
            float _Multiply_9380e32f6e4644e1b42e398229c18d31_Out_2;
            Unity_Multiply_float_float(_Multiply_384d15a2ef094b7e8b1ec6d69dada246_Out_2, _Property_3c23366c651c4949b03cb10c14ae0a27_Out_0, _Multiply_9380e32f6e4644e1b42e398229c18d31_Out_2);
            float4 _Property_dff39e3157cb4a09aac968677ade995d_Out_0 = _Color_Valley;
            float4 _Property_1b300af9e23e428fa893e55f9390600d_Out_0 = _Color_Peak;
            float4 _Lerp_6d0a20bb25554e1fa8697f473485e856_Out_3;
            Unity_Lerp_float4(_Property_dff39e3157cb4a09aac968677ade995d_Out_0, _Property_1b300af9e23e428fa893e55f9390600d_Out_0, (_Add_98d9cdbb65e44e0282692d35bd9d237b_Out_2.xxxx), _Lerp_6d0a20bb25554e1fa8697f473485e856_Out_3);
            float4 _Add_6507a6920d9c478888f235ad9d0bb542_Out_2;
            Unity_Add_float4((_Multiply_9380e32f6e4644e1b42e398229c18d31_Out_2.xxxx), _Lerp_6d0a20bb25554e1fa8697f473485e856_Out_3, _Add_6507a6920d9c478888f235ad9d0bb542_Out_2);
            float _Property_9cf7107417e042afb41766bb37be827b_Out_0 = _Emission_Strength;
            float4 _Multiply_31ae534c0cc640be9fda8de7cc705bbf_Out_2;
            Unity_Multiply_float4_float4(_Add_6507a6920d9c478888f235ad9d0bb542_Out_2, (_Property_9cf7107417e042afb41766bb37be827b_Out_0.xxxx), _Multiply_31ae534c0cc640be9fda8de7cc705bbf_Out_2);
            float _SceneDepth_619a7e0097894c29ba4557fde6cbb174_Out_1;
            Unity_SceneDepth_Eye_float(float4(IN.ScreenPosition.xy / IN.ScreenPosition.w, 0, 0), _SceneDepth_619a7e0097894c29ba4557fde6cbb174_Out_1);
            float4 _ScreenPosition_ee728e739f744068b0d15c1205d618a0_Out_0 = IN.ScreenPosition;
            float _Split_d5d8a30c527c46a19ab94602c057016e_R_1 = _ScreenPosition_ee728e739f744068b0d15c1205d618a0_Out_0[0];
            float _Split_d5d8a30c527c46a19ab94602c057016e_G_2 = _ScreenPosition_ee728e739f744068b0d15c1205d618a0_Out_0[1];
            float _Split_d5d8a30c527c46a19ab94602c057016e_B_3 = _ScreenPosition_ee728e739f744068b0d15c1205d618a0_Out_0[2];
            float _Split_d5d8a30c527c46a19ab94602c057016e_A_4 = _ScreenPosition_ee728e739f744068b0d15c1205d618a0_Out_0[3];
            float _Subtract_07eb78fa00d74ade84172a64a4a4616c_Out_2;
            Unity_Subtract_float(_Split_d5d8a30c527c46a19ab94602c057016e_A_4, 1, _Subtract_07eb78fa00d74ade84172a64a4a4616c_Out_2);
            float _Subtract_3ef0962257844c2c87b9ff8d165099f3_Out_2;
            Unity_Subtract_float(_SceneDepth_619a7e0097894c29ba4557fde6cbb174_Out_1, _Subtract_07eb78fa00d74ade84172a64a4a4616c_Out_2, _Subtract_3ef0962257844c2c87b9ff8d165099f3_Out_2);
            float _Property_9167e3d66076450baeb620b8f8b66552_Out_0 = _Depth_Fade;
            float _Divide_9a1ae8922923443883cbd9e71941de32_Out_2;
            Unity_Divide_float(_Subtract_3ef0962257844c2c87b9ff8d165099f3_Out_2, _Property_9167e3d66076450baeb620b8f8b66552_Out_0, _Divide_9a1ae8922923443883cbd9e71941de32_Out_2);
            float _Saturate_791ce4d2963e420ba68a97fca0bef8f9_Out_1;
            Unity_Saturate_float(_Divide_9a1ae8922923443883cbd9e71941de32_Out_2, _Saturate_791ce4d2963e420ba68a97fca0bef8f9_Out_1);
            surface.BaseColor = (_Add_6507a6920d9c478888f235ad9d0bb542_Out_2.xyz);
            surface.Emission = (_Multiply_31ae534c0cc640be9fda8de7cc705bbf_Out_2.xyz);
            surface.Alpha = _Saturate_791ce4d2963e420ba68a97fca0bef8f9_Out_1;
            return surface;
        }
        
            // --------------------------------------------------
            // Build Graph Inputs
            #ifdef HAVE_VFX_MODIFICATION
            #define VFX_SRP_ATTRIBUTES AttributesMesh
            #define VaryingsMeshType VaryingsMeshToPS
            #define VFX_SRP_VARYINGS VaryingsMeshType
            #define VFX_SRP_SURFACE_INPUTS FragInputs
            #endif
            
        VertexDescriptionInputs AttributesMeshToVertexDescriptionInputs(AttributesMesh input)
        {
            VertexDescriptionInputs output;
            ZERO_INITIALIZE(VertexDescriptionInputs, output);
        
            output.ObjectSpaceNormal =                          input.normalOS;
            output.ObjectSpaceTangent =                         input.tangentOS.xyz;
            output.ObjectSpacePosition =                        input.positionOS;
            output.TimeParameters =                             _TimeParameters.xyz; // Note: in case of animation this will be overwrite (allow to handle motion vector)
        
            return output;
        }
        
        VertexDescription GetVertexDescription(AttributesMesh input, float3 timeParameters
        #ifdef HAVE_VFX_MODIFICATION
            , AttributesElement element
        #endif
        )
        {
            // build graph inputs
            VertexDescriptionInputs vertexDescriptionInputs = AttributesMeshToVertexDescriptionInputs(input);
            // Override time parameters with used one (This is required to correctly handle motion vector for vertex animation based on time)
            vertexDescriptionInputs.TimeParameters = timeParameters;
        
            // evaluate vertex graph
        #ifdef HAVE_VFX_MODIFICATION
            GraphProperties properties;
            ZERO_INITIALIZE(GraphProperties, properties);
        
            // Fetch the vertex graph properties for the particle instance.
            GetElementVertexProperties(element, properties);
        
            VertexDescription vertexDescription = VertexDescriptionFunction(vertexDescriptionInputs, properties);
        #else
            VertexDescription vertexDescription = VertexDescriptionFunction(vertexDescriptionInputs);
        #endif
            return vertexDescription;
        
        }
        
        AttributesMesh ApplyMeshModification(AttributesMesh input, float3 timeParameters
        #ifdef USE_CUSTOMINTERP_SUBSTRUCT
            #ifdef TESSELLATION_ON
            , inout VaryingsMeshToDS varyings
            #else
            , inout VaryingsMeshToPS varyings
            #endif
        #endif
        #ifdef HAVE_VFX_MODIFICATION
                , AttributesElement element
        #endif
            )
        {
            VertexDescription vertexDescription = GetVertexDescription(input, timeParameters
        #ifdef HAVE_VFX_MODIFICATION
                , element
        #endif
            );
        
            // copy graph output to the results
            input.positionOS = vertexDescription.Position;
            input.normalOS = vertexDescription.Normal;
            input.tangentOS.xyz = vertexDescription.Tangent;
        
            
        
            return input;
        }
        
        #if defined(_ADD_CUSTOM_VELOCITY) // For shader graph custom velocity
        // Return precomputed Velocity in object space
        float3 GetCustomVelocity(AttributesMesh input
        #ifdef HAVE_VFX_MODIFICATION
            , AttributesElement element
        #endif
        )
        {
            VertexDescription vertexDescription = GetVertexDescription(input, _TimeParameters.xyz
        #ifdef HAVE_VFX_MODIFICATION
                , element
        #endif
            );
            return vertexDescription.CustomVelocity;
        }
        #endif
        
        FragInputs BuildFragInputs(VaryingsMeshToPS input)
        {
            FragInputs output;
            ZERO_INITIALIZE(FragInputs, output);
        
            // Init to some default value to make the computer quiet (else it output 'divide by zero' warning even if value is not used).
            // TODO: this is a really poor workaround, but the variable is used in a bunch of places
            // to compute normals which are then passed on elsewhere to compute other values...
            output.tangentToWorld = k_identity3x3;
            output.positionSS = input.positionCS;       // input.positionCS is SV_Position
        
            output.positionRWS =                input.positionRWS;
            output.tangentToWorld =             BuildTangentToWorld(input.tangentWS, input.normalWS);
        
        #ifdef HAVE_VFX_MODIFICATION
            // FragInputs from VFX come from two places: Interpolator or CBuffer.
            /* WARNING: $splice Could not find named fragment 'VFXSetFragInputs' */
        
        #endif
        
            // splice point to copy custom interpolator fields from varyings to frag inputs
            
        
            return output;
        }
        
        // existing HDRP code uses the combined function to go directly from packed to frag inputs
        FragInputs UnpackVaryingsMeshToFragInputs(PackedVaryingsMeshToPS input)
        {
            UNITY_SETUP_INSTANCE_ID(input);
            VaryingsMeshToPS unpacked = UnpackVaryingsMeshToPS(input);
            return BuildFragInputs(unpacked);
        }
            SurfaceDescriptionInputs FragInputsToSurfaceDescriptionInputs(FragInputs input, float3 viewWS)
        {
            SurfaceDescriptionInputs output;
            ZERO_INITIALIZE(SurfaceDescriptionInputs, output);
        
            output.WorldSpaceNormal =                           normalize(input.tangentToWorld[2].xyz);
            #if defined(SHADER_STAGE_RAY_TRACING)
            #else
            #endif
            output.WorldSpaceViewDirection =                    normalize(viewWS);
            output.WorldSpacePosition =                         input.positionRWS;
            output.ObjectSpacePosition =                        TransformWorldToObject(input.positionRWS);
            output.ScreenPosition =                             ComputeScreenPos(TransformWorldToHClip(input.positionRWS), _ProjectionParams.x);
            output.TimeParameters =                             _TimeParameters.xyz; // This is mainly for LW as HD overwrite this value
        
            // splice point to copy frag inputs custom interpolator pack into the SDI
            
        
            return output;
        }
        
            // --------------------------------------------------
            // Build Surface Data (Specific Material)
        
        void BuildSurfaceData(FragInputs fragInputs, inout SurfaceDescription surfaceDescription, float3 V, PositionInputs posInput, out SurfaceData surfaceData)
        {
            // setup defaults -- these are used if the graph doesn't output a value
            ZERO_INITIALIZE(SurfaceData, surfaceData);
        
            // copy across graph values, if defined
            surfaceData.color = surfaceDescription.BaseColor;
        
            #ifdef WRITE_NORMAL_BUFFER
            // When we need to export the normal (in the depth prepass, we write the geometry one)
            surfaceData.normalWS = fragInputs.tangentToWorld[2];
            #endif
        
            #if defined(DEBUG_DISPLAY)
            if (_DebugMipMapMode != DEBUGMIPMAPMODE_NONE)
            {
                // TODO
            }
            #endif
        
            #ifdef _ENABLE_SHADOW_MATTE
        
                #if (SHADERPASS == SHADERPASS_FORWARD_UNLIT) || (SHADERPASS == SHADERPASS_RAYTRACING_GBUFFER) || (SHADERPASS == SHADERPASS_RAYTRACING_INDIRECT) || (SHADERPASS == SHADERPASS_RAYTRACING_FORWARD)
        
                    HDShadowContext shadowContext = InitShadowContext();
        
                    // Evaluate the shadow, the normal is guaranteed if shadow matte is enabled on this shader.
                    float3 shadow3;
                    ShadowLoopMin(shadowContext, posInput, normalize(fragInputs.tangentToWorld[2]), asuint(_ShadowMatteFilter), GetMeshRenderingLightLayer(), shadow3);
        
                    // Compute the average value in the fourth channel
                    float4 shadow = float4(shadow3, dot(shadow3, float3(1.0/3.0, 1.0/3.0, 1.0/3.0)));
        
                    float4 shadowColor = (1.0 - shadow) * surfaceDescription.ShadowTint.rgba;
                    float  localAlpha  = saturate(shadowColor.a + surfaceDescription.Alpha);
        
                    // Keep the nested lerp
                    // With no Color (bsdfData.color.rgb, bsdfData.color.a == 0.0f), just use ShadowColor*Color to avoid a ring of "white" around the shadow
                    // And mix color to consider the Color & ShadowColor alpha (from texture or/and color picker)
                    #ifdef _SURFACE_TYPE_TRANSPARENT
                        surfaceData.color = lerp(shadowColor.rgb * surfaceData.color, lerp(lerp(shadowColor.rgb, surfaceData.color, 1.0 - surfaceDescription.ShadowTint.a), surfaceData.color, shadow.rgb), surfaceDescription.Alpha);
                    #else
                        surfaceData.color = lerp(lerp(shadowColor.rgb, surfaceData.color, 1.0 - surfaceDescription.ShadowTint.a), surfaceData.color, shadow.rgb);
                    #endif
                    localAlpha = ApplyBlendMode(surfaceData.color, localAlpha).a;
        
                    surfaceDescription.Alpha = localAlpha;
        
                #elif SHADERPASS == SHADERPASS_PATH_TRACING
        
                    surfaceData.normalWS = fragInputs.tangentToWorld[2];
                    surfaceData.shadowTint = surfaceDescription.ShadowTint.rgba;
        
                #endif
        
            #endif // _ENABLE_SHADOW_MATTE
        }
        
            // --------------------------------------------------
            // Get Surface And BuiltinData
        
            void GetSurfaceAndBuiltinData(FragInputs fragInputs, float3 V, inout PositionInputs posInput, out SurfaceData surfaceData, out BuiltinData builtinData RAY_TRACING_OPTIONAL_PARAMETERS)
            {
                // Don't dither if displaced tessellation (we're fading out the displacement instead to match the next LOD)
                #if !defined(SHADER_STAGE_RAY_TRACING) && !defined(_TESSELLATION_DISPLACEMENT)
                #ifdef LOD_FADE_CROSSFADE // enable dithering LOD transition if user select CrossFade transition in LOD group
                LODDitheringTransition(ComputeFadeMaskSeed(V, posInput.positionSS), unity_LODFade.x);
                #endif
                #endif
        
                #ifndef SHADER_UNLIT
                #ifdef _DOUBLESIDED_ON
                    float3 doubleSidedConstants = _DoubleSidedConstants.xyz;
                #else
                    float3 doubleSidedConstants = float3(1.0, 1.0, 1.0);
                #endif
        
                ApplyDoubleSidedFlipOrMirror(fragInputs, doubleSidedConstants); // Apply double sided flip on the vertex normal
                #endif // SHADER_UNLIT
        
                SurfaceDescriptionInputs surfaceDescriptionInputs = FragInputsToSurfaceDescriptionInputs(fragInputs, V);
        
                #if defined(HAVE_VFX_MODIFICATION)
                GraphProperties properties;
                ZERO_INITIALIZE(GraphProperties, properties);
        
                GetElementPixelProperties(fragInputs, properties);
        
                SurfaceDescription surfaceDescription = SurfaceDescriptionFunction(surfaceDescriptionInputs, properties);
                #else
                SurfaceDescription surfaceDescription = SurfaceDescriptionFunction(surfaceDescriptionInputs);
                #endif
        
                // Perform alpha test very early to save performance (a killed pixel will not sample textures)
                // TODO: split graph evaluation to grab just alpha dependencies first? tricky..
                #ifdef _ALPHATEST_ON
                    float alphaCutoff = surfaceDescription.AlphaClipThreshold;
                    #if SHADERPASS == SHADERPASS_TRANSPARENT_DEPTH_PREPASS
                    // The TransparentDepthPrepass is also used with SSR transparent.
                    // If an artists enable transaprent SSR but not the TransparentDepthPrepass itself, then we use AlphaClipThreshold
                    // otherwise if TransparentDepthPrepass is enabled we use AlphaClipThresholdDepthPrepass
                    #elif SHADERPASS == SHADERPASS_TRANSPARENT_DEPTH_POSTPASS
                    // DepthPostpass always use its own alpha threshold
                    alphaCutoff = surfaceDescription.AlphaClipThresholdDepthPostpass;
                    #elif (SHADERPASS == SHADERPASS_SHADOWS) || (SHADERPASS == SHADERPASS_RAYTRACING_VISIBILITY)
                    // If use shadow threshold isn't enable we don't allow any test
                    #endif
        
                    GENERIC_ALPHA_TEST(surfaceDescription.Alpha, alphaCutoff);
                #endif
        
                #if !defined(SHADER_STAGE_RAY_TRACING) && _DEPTHOFFSET_ON
                ApplyDepthOffsetPositionInput(V, surfaceDescription.DepthOffset, GetViewForwardDir(), GetWorldToHClipMatrix(), posInput);
                #endif
        
                #ifndef SHADER_UNLIT
                float3 bentNormalWS;
                BuildSurfaceData(fragInputs, surfaceDescription, V, posInput, surfaceData, bentNormalWS);
        
                #ifdef FRAG_INPUTS_USE_TEXCOORD1
                    float4 lightmapTexCoord1 = fragInputs.texCoord1;
                #else
                    float4 lightmapTexCoord1 = float4(0,0,0,0);
                #endif
        
                #ifdef FRAG_INPUTS_USE_TEXCOORD2
                    float4 lightmapTexCoord2 = fragInputs.texCoord2;
                #else
                    float4 lightmapTexCoord2 = float4(0,0,0,0);
                #endif
        
                // Builtin Data
                // For back lighting we use the oposite vertex normal
                InitBuiltinData(posInput, surfaceDescription.Alpha, bentNormalWS, -fragInputs.tangentToWorld[2], lightmapTexCoord1, lightmapTexCoord2, builtinData);
        
                #else
                BuildSurfaceData(fragInputs, surfaceDescription, V, posInput, surfaceData);
        
                ZERO_BUILTIN_INITIALIZE(builtinData); // No call to InitBuiltinData as we don't have any lighting
                builtinData.opacity = surfaceDescription.Alpha;
        
                #if defined(DEBUG_DISPLAY)
                    // Light Layers are currently not used for the Unlit shader (because it is not lit)
                    // But Unlit objects do cast shadows according to their rendering layer mask, which is what we want to
                    // display in the light layers visualization mode, therefore we need the renderingLayers
                    builtinData.renderingLayers = GetMeshRenderingLightLayer();
                #endif
        
                #endif // SHADER_UNLIT
        
                #ifdef _ALPHATEST_ON
                    // Used for sharpening by alpha to mask - Alpha to covertage is only used with depth only and forward pass (no shadow pass, no transparent pass)
                    builtinData.alphaClipTreshold = alphaCutoff;
                #endif
        
                // override sampleBakedGI - not used by Unlit
        
                builtinData.emissiveColor = surfaceDescription.Emission;
        
                // Note this will not fully work on transparent surfaces (can check with _SURFACE_TYPE_TRANSPARENT define)
                // We will always overwrite vt feeback with the nearest. So behind transparent surfaces vt will not be resolved
                // This is a limitation of the current MRT approach.
                #ifdef UNITY_VIRTUAL_TEXTURING
                #endif
        
                #if _DEPTHOFFSET_ON
                builtinData.depthOffset = surfaceDescription.DepthOffset;
                #endif
        
                // TODO: We should generate distortion / distortionBlur for non distortion pass
                #if (SHADERPASS == SHADERPASS_DISTORTION)
                builtinData.distortion = surfaceDescription.Distortion;
                builtinData.distortionBlur = surfaceDescription.DistortionBlur;
                #endif
        
                #ifndef SHADER_UNLIT
                // PostInitBuiltinData call ApplyDebugToBuiltinData
                PostInitBuiltinData(V, posInput, surfaceData, builtinData);
                #else
                ApplyDebugToBuiltinData(builtinData);
                #endif
        
                RAY_TRACING_OPTIONAL_ALPHA_TEST_PASS
            }
        
            // --------------------------------------------------
            // Main
        
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/ShaderPass/ShaderPassDepthOnly.hlsl"
        
            // --------------------------------------------------
            // Visual Effect Vertex Invocations
        
        	#ifdef HAVE_VFX_MODIFICATION
        	#include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/VisualEffectVertex.hlsl"
        	#endif
        
            ENDHLSL
        }
        Pass
        {
            Name "MotionVectors"
            Tags
            {
                "LightMode" = "MotionVectors"
            }
        
            // Render State
            Cull [_CullMode]
        ZWrite On
        Stencil
        {
        WriteMask [_StencilWriteMaskMV]
        Ref [_StencilRefMV]
        CompFront Always
        PassFront Replace
        CompBack Always
        PassBack Replace
        }
        
            // Debug
            // <None>
        
            // --------------------------------------------------
            // Pass
        
            HLSLPROGRAM
        
            // Pragmas
            #pragma instancing_options renderinglayer
        #pragma target 4.5
        #pragma vertex Vert
        #pragma fragment Frag
        #pragma only_renderers d3d11 playstation xboxone xboxseries vulkan metal switch
        #pragma multi_compile_instancing
        
            // Keywords
            #pragma multi_compile_fragment _ WRITE_MSAA_DEPTH
        #pragma shader_feature _ _SURFACE_TYPE_TRANSPARENT
        #pragma shader_feature_local _BLENDMODE_OFF _BLENDMODE_ALPHA _BLENDMODE_ADD _BLENDMODE_PRE_MULTIPLY
        #pragma shader_feature_local _ _ADD_PRECOMPUTED_VELOCITY
        #pragma shader_feature_local _ _TRANSPARENT_WRITES_MOTION_VEC
        #pragma shader_feature_local_fragment _ _ENABLE_FOG_ON_TRANSPARENT
            // GraphKeywords: <None>
        
            // Early Instancing Defines
            // DotsInstancingOptions: <None>
        
            // Injected Instanced Properties (must be included before UnityInstancing.hlsl)
            // HybridV1InjectedBuiltinProperties: <None>
        
            // For custom interpolators to inject a substruct definition before FragInputs definition,
            // allowing for FragInputs to capture CI's intended for ShaderGraph's SDI.
            struct CustomInterpolators
        {
        };
        #define USE_CUSTOMINTERP_SUBSTRUCT
        
        
        
            // TODO: Merge FragInputsVFX substruct with CustomInterpolators.
        	#ifdef HAVE_VFX_MODIFICATION
        	struct FragInputsVFX
            {
                /* WARNING: $splice Could not find named fragment 'FragInputsVFX' */
            };
            #endif
        
            #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Common.hlsl"
        	#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/GeometricTools.hlsl" // Required by Tessellation.hlsl
        	#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Tessellation.hlsl"
            #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Texture.hlsl"
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderVariables.hlsl"
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/ShaderPass/ShaderPass.cs.hlsl"
            #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/TextureStack.hlsl" // Required to be include before we include properties as it define DECLARE_STACK_CB
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderGraphHeader.hlsl" // Need to be here for Gradient struct definition
        
            // --------------------------------------------------
            // Defines
        
            // Attribute
            #define ATTRIBUTES_NEED_NORMAL
            #define ATTRIBUTES_NEED_TANGENT
            #define VARYINGS_NEED_POSITION_WS
            #define VARYINGS_NEED_TANGENT_TO_WORLD
        
            #define HAVE_MESH_MODIFICATION
        
            //Strip down the FragInputs.hlsl (on graphics), so we can only optimize the interpolators we use.
            //if by accident something requests contents of FragInputs.hlsl, it will be caught as a compiler error
            //Frag inputs stripping is only enabled when FRAG_INPUTS_ENABLE_STRIPPING is set
            #if !defined(SHADER_STAGE_RAY_TRACING) && SHADERPASS != SHADERPASS_RAYTRACING_GBUFFER && SHADERPASS != SHADERPASS_FULL_SCREEN_DEBUG
            #define FRAG_INPUTS_ENABLE_STRIPPING
            #endif
        
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/ShaderPass/FragInputs.hlsl"
        
        
        
            #define SHADERPASS SHADERPASS_MOTION_VECTORS
        #define REQUIRE_DEPTH_TEXTURE
        
        
            // Following two define are a workaround introduce in 10.1.x for RaytracingQualityNode
            // The ShaderGraph don't support correctly migration of this node as it serialize all the node data
            // in the json file making it impossible to uprgrade. Until we get a fix, we do a workaround here
            // to still allow us to rename the field and keyword of this node without breaking existing code.
            #ifdef RAYTRACING_SHADER_GRAPH_DEFAULT
            #define RAYTRACING_SHADER_GRAPH_HIGH
            #endif
        
            #ifdef RAYTRACING_SHADER_GRAPH_RAYTRACED
            #define RAYTRACING_SHADER_GRAPH_LOW
            #endif
            // end
        
            #ifndef SHADER_UNLIT
            // We need isFrontFace when using double sided - it is not required for unlit as in case of unlit double sided only drive the cullmode
            // VARYINGS_NEED_CULLFACE can be define by VaryingsMeshToPS.FaceSign input if a IsFrontFace Node is included in the shader graph.
            #if defined(_DOUBLESIDED_ON) && !defined(VARYINGS_NEED_CULLFACE)
                #define VARYINGS_NEED_CULLFACE
            #endif
            #endif
        
            // Specific Material Define
        // Setup a define to say we are an unlit shader
        #define SHADER_UNLIT
        
        // Following Macro are only used by Unlit material
        #if defined(_ENABLE_SHADOW_MATTE) && (SHADERPASS == SHADERPASS_FORWARD_UNLIT || SHADERPASS == SHADERPASS_PATH_TRACING)
        #define LIGHTLOOP_DISABLE_TILE_AND_CLUSTER
        #define HAS_LIGHTLOOP
        #endif
            // Caution: we can use the define SHADER_UNLIT onlit after the above Material include as it is the Unlit template who define it
        
            // To handle SSR on transparent correctly with a possibility to enable/disable it per framesettings
            // we should have a code like this:
            // if !defined(_DISABLE_SSR_TRANSPARENT)
            // pragma multi_compile _ WRITE_NORMAL_BUFFER
            // endif
            // i.e we enable the multicompile only if we can receive SSR or not, and then C# code drive
            // it based on if SSR transparent in frame settings and not (and stripper can strip it).
            // this is currently not possible with our current preprocessor as _DISABLE_SSR_TRANSPARENT is a keyword not a define
            // so instead we used this and chose to pay the extra cost of normal write even if SSR transaprent is disabled.
            // Ideally the shader graph generator should handle it but condition below can't be handle correctly for now.
            #if SHADERPASS == SHADERPASS_TRANSPARENT_DEPTH_PREPASS
            #if !defined(_DISABLE_SSR_TRANSPARENT) && !defined(SHADER_UNLIT)
                #define WRITE_NORMAL_BUFFER
            #endif
            #endif
        
            #ifndef DEBUG_DISPLAY
                // In case of opaque we don't want to perform the alpha test, it is done in depth prepass and we use depth equal for ztest (setup from UI)
                // Don't do it with debug display mode as it is possible there is no depth prepass in this case
                #if !defined(_SURFACE_TYPE_TRANSPARENT)
                    #if SHADERPASS == SHADERPASS_FORWARD
                    #define SHADERPASS_FORWARD_BYPASS_ALPHA_TEST
                    #elif SHADERPASS == SHADERPASS_GBUFFER
                    #define SHADERPASS_GBUFFER_BYPASS_ALPHA_TEST
                    #endif
                #endif
            #endif
        
            // Define _DEFERRED_CAPABLE_MATERIAL for shader capable to run in deferred pass
            #if defined(SHADER_LIT) && !defined(_SURFACE_TYPE_TRANSPARENT)
                #define _DEFERRED_CAPABLE_MATERIAL
            #endif
        
            // Translate transparent motion vector define
            #if defined(_TRANSPARENT_WRITES_MOTION_VEC) && defined(_SURFACE_TYPE_TRANSPARENT)
                #define _WRITE_TRANSPARENT_MOTION_VECTOR
            #endif
        
            // -- Graph Properties
            CBUFFER_START(UnityPerMaterial)
        float4 _Rotate_Projection;
        float _Noise_Scale;
        float _Speed;
        float _Vertexoffset;
        float4 _Remap_xy_zw;
        float4 _Color_Peak;
        float4 _Color_Valley;
        float _SmoothEdge1;
        float _SmoothEdge2;
        float _Cloud_Pow;
        float _Base_Scale;
        float _Base_Speed;
        float _BaseStrength;
        float _Emission_Strength;
        float _Curvate_Radius;
        float _Fresnel_Power;
        float _Fresnel_Opacity;
        float _Depth_Fade;
        float4 _EmissionColor;
        float _UseShadowThreshold;
        float4 _DoubleSidedConstants;
        float _BlendMode;
        float _EnableBlendModePreserveSpecularLighting;
        CBUFFER_END
        
        // Object and Global properties
        
            // -- Property used by ScenePickingPass
            #ifdef SCENEPICKINGPASS
            float4 _SelectionID;
            #endif
        
            // -- Properties used by SceneSelectionPass
            #ifdef SCENESELECTIONPASS
            int _ObjectId;
            int _PassValue;
            #endif
        
            // Includes
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/Debug/DebugDisplay.hlsl"
        #include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Material.hlsl"
        #include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Unlit/Unlit.hlsl"
        #include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/BuiltinUtilities.hlsl"
        #include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/MaterialUtilities.hlsl"
        #include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderGraphFunctions.hlsl"
        	// GraphIncludes: <None>
        
            // --------------------------------------------------
            // Structs and Packing
        
            struct AttributesMesh
        {
             float3 positionOS : POSITION;
             float3 normalOS : NORMAL;
             float4 tangentOS : TANGENT;
            #if UNITY_ANY_INSTANCING_ENABLED
             uint instanceID : INSTANCEID_SEMANTIC;
            #endif
        };
        struct VaryingsMeshToPS
        {
            SV_POSITION_QUALIFIERS float4 positionCS : SV_POSITION;
             float3 positionRWS;
             float3 normalWS;
             float4 tangentWS;
            #if UNITY_ANY_INSTANCING_ENABLED
             uint instanceID : CUSTOM_INSTANCE_ID;
            #endif
        };
        struct VertexDescriptionInputs
        {
             float3 ObjectSpaceNormal;
             float3 ObjectSpaceTangent;
             float3 ObjectSpacePosition;
             float3 TimeParameters;
        };
        struct SurfaceDescriptionInputs
        {
             float3 WorldSpaceNormal;
             float3 WorldSpaceViewDirection;
             float3 ObjectSpacePosition;
             float3 WorldSpacePosition;
             float4 ScreenPosition;
             float3 TimeParameters;
        };
        struct PackedVaryingsMeshToPS
        {
            SV_POSITION_QUALIFIERS float4 positionCS : SV_POSITION;
             float3 interp0 : INTERP0;
             float3 interp1 : INTERP1;
             float4 interp2 : INTERP2;
            #if UNITY_ANY_INSTANCING_ENABLED
             uint instanceID : CUSTOM_INSTANCE_ID;
            #endif
        };
        
            PackedVaryingsMeshToPS PackVaryingsMeshToPS (VaryingsMeshToPS input)
        {
            PackedVaryingsMeshToPS output;
            ZERO_INITIALIZE(PackedVaryingsMeshToPS, output);
            output.positionCS = input.positionCS;
            output.interp0.xyz =  input.positionRWS;
            output.interp1.xyz =  input.normalWS;
            output.interp2.xyzw =  input.tangentWS;
            #if UNITY_ANY_INSTANCING_ENABLED
            output.instanceID = input.instanceID;
            #endif
            return output;
        }
        
        VaryingsMeshToPS UnpackVaryingsMeshToPS (PackedVaryingsMeshToPS input)
        {
            VaryingsMeshToPS output;
            output.positionCS = input.positionCS;
            output.positionRWS = input.interp0.xyz;
            output.normalWS = input.interp1.xyz;
            output.tangentWS = input.interp2.xyzw;
            #if UNITY_ANY_INSTANCING_ENABLED
            output.instanceID = input.instanceID;
            #endif
            return output;
        }
        
        
            // --------------------------------------------------
            // Graph
        
        
            // Graph Functions
            
        void Unity_Distance_float3(float3 A, float3 B, out float Out)
        {
            Out = distance(A, B);
        }
        
        void Unity_Divide_float(float A, float B, out float Out)
        {
            Out = A / B;
        }
        
        void Unity_Power_float(float A, float B, out float Out)
        {
            Out = pow(A, B);
        }
        
        void Unity_Multiply_float3_float3(float3 A, float3 B, out float3 Out)
        {
            Out = A * B;
        }
        
        void Unity_Rotate_About_Axis_Radians_float(float3 In, float3 Axis, float Rotation, out float3 Out)
        {
            float s = sin(Rotation);
            float c = cos(Rotation);
            float one_minus_c = 1.0 - c;
        
            Axis = normalize(Axis);
        
            float3x3 rot_mat = { one_minus_c * Axis.x * Axis.x + c,            one_minus_c * Axis.x * Axis.y - Axis.z * s,     one_minus_c * Axis.z * Axis.x + Axis.y * s,
                                      one_minus_c * Axis.x * Axis.y + Axis.z * s,   one_minus_c * Axis.y * Axis.y + c,              one_minus_c * Axis.y * Axis.z - Axis.x * s,
                                      one_minus_c * Axis.z * Axis.x - Axis.y * s,   one_minus_c * Axis.y * Axis.z + Axis.x * s,     one_minus_c * Axis.z * Axis.z + c
                                    };
        
            Out = mul(rot_mat,  In);
        }
        
        void Unity_Multiply_float_float(float A, float B, out float Out)
        {
            Out = A * B;
        }
        
        void Unity_TilingAndOffset_float(float2 UV, float2 Tiling, float2 Offset, out float2 Out)
        {
            Out = UV * Tiling + Offset;
        }
        
        
        float2 Unity_GradientNoise_Dir_float(float2 p)
        {
            // Permutation and hashing used in webgl-nosie goo.gl/pX7HtC
            p = p % 289;
            // need full precision, otherwise half overflows when p > 1
            float x = float(34 * p.x + 1) * p.x % 289 + p.y;
            x = (34 * x + 1) * x % 289;
            x = frac(x / 41) * 2 - 1;
            return normalize(float2(x - floor(x + 0.5), abs(x) - 0.5));
        }
        
        void Unity_GradientNoise_float(float2 UV, float Scale, out float Out)
        {
            float2 p = UV * Scale;
            float2 ip = floor(p);
            float2 fp = frac(p);
            float d00 = dot(Unity_GradientNoise_Dir_float(ip), fp);
            float d01 = dot(Unity_GradientNoise_Dir_float(ip + float2(0, 1)), fp - float2(0, 1));
            float d10 = dot(Unity_GradientNoise_Dir_float(ip + float2(1, 0)), fp - float2(1, 0));
            float d11 = dot(Unity_GradientNoise_Dir_float(ip + float2(1, 1)), fp - float2(1, 1));
            fp = fp * fp * fp * (fp * (fp * 6 - 15) + 10);
            Out = lerp(lerp(d00, d01, fp.y), lerp(d10, d11, fp.y), fp.x) + 0.5;
        }
        
        void Unity_Add_float(float A, float B, out float Out)
        {
            Out = A + B;
        }
        
        void Unity_Saturate_float(float In, out float Out)
        {
            Out = saturate(In);
        }
        
        void Unity_Combine_float(float R, float G, float B, float A, out float4 RGBA, out float3 RGB, out float2 RG)
        {
            RGBA = float4(R, G, B, A);
            RGB = float3(R, G, B);
            RG = float2(R, G);
        }
        
        void Unity_Remap_float(float In, float2 InMinMax, float2 OutMinMax, out float Out)
        {
            Out = OutMinMax.x + (In - InMinMax.x) * (OutMinMax.y - OutMinMax.x) / (InMinMax.y - InMinMax.x);
        }
        
        void Unity_Absolute_float(float In, out float Out)
        {
            Out = abs(In);
        }
        
        void Unity_Smoothstep_float(float Edge1, float Edge2, float In, out float Out)
        {
            Out = smoothstep(Edge1, Edge2, In);
        }
        
        void Unity_Add_float3(float3 A, float3 B, out float3 Out)
        {
            Out = A + B;
        }
        
        void Unity_FresnelEffect_float(float3 Normal, float3 ViewDir, float Power, out float Out)
        {
            Out = pow((1.0 - saturate(dot(normalize(Normal), normalize(ViewDir)))), Power);
        }
        
        void Unity_Lerp_float4(float4 A, float4 B, float4 T, out float4 Out)
        {
            Out = lerp(A, B, T);
        }
        
        void Unity_Add_float4(float4 A, float4 B, out float4 Out)
        {
            Out = A + B;
        }
        
        void Unity_Multiply_float4_float4(float4 A, float4 B, out float4 Out)
        {
            Out = A * B;
        }
        
        void Unity_SceneDepth_Eye_float(float4 UV, out float Out)
        {
            if (unity_OrthoParams.w == 1.0)
            {
                Out = LinearEyeDepth(ComputeWorldSpacePosition(UV.xy, SHADERGRAPH_SAMPLE_SCENE_DEPTH(UV.xy), UNITY_MATRIX_I_VP), UNITY_MATRIX_V);
            }
            else
            {
                Out = LinearEyeDepth(SHADERGRAPH_SAMPLE_SCENE_DEPTH(UV.xy), _ZBufferParams);
            }
        }
        
        void Unity_Subtract_float(float A, float B, out float Out)
        {
            Out = A - B;
        }
        
            // Graph Vertex
            struct VertexDescription
        {
            float3 Position;
            float3 Normal;
            float3 Tangent;
        };
        
        VertexDescription VertexDescriptionFunction(VertexDescriptionInputs IN)
        {
            VertexDescription description = (VertexDescription)0;
            float _Distance_389dd396e31949b9a8a01d35896316a6_Out_2;
            Unity_Distance_float3(SHADERGRAPH_OBJECT_POSITION, IN.ObjectSpacePosition, _Distance_389dd396e31949b9a8a01d35896316a6_Out_2);
            float _Property_d58669debb0246fe82fb0fb0bffa2edc_Out_0 = _Curvate_Radius;
            float _Divide_0b143990dbbc4cbdb5129fcbf5511012_Out_2;
            Unity_Divide_float(_Distance_389dd396e31949b9a8a01d35896316a6_Out_2, _Property_d58669debb0246fe82fb0fb0bffa2edc_Out_0, _Divide_0b143990dbbc4cbdb5129fcbf5511012_Out_2);
            float _Power_89ab1e29e2cb42a9acd2aed36f4fdcfe_Out_2;
            Unity_Power_float(_Divide_0b143990dbbc4cbdb5129fcbf5511012_Out_2, 2, _Power_89ab1e29e2cb42a9acd2aed36f4fdcfe_Out_2);
            float3 _Multiply_22e187ffacc7402bbe63087272b7efb5_Out_2;
            Unity_Multiply_float3_float3(IN.ObjectSpaceNormal, (_Power_89ab1e29e2cb42a9acd2aed36f4fdcfe_Out_2.xxx), _Multiply_22e187ffacc7402bbe63087272b7efb5_Out_2);
            float _Property_7d8e49b5efe94dea8210c34a6319b1ef_Out_0 = _SmoothEdge1;
            float _Property_09307b889e8945078bacabda50cca5c6_Out_0 = _SmoothEdge2;
            float4 _Property_a8d53d7ea07349e0979b956475bdd7cc_Out_0 = _Rotate_Projection;
            float _Split_7d12b2bb5feb46d685603473d0cf5818_R_1 = _Property_a8d53d7ea07349e0979b956475bdd7cc_Out_0[0];
            float _Split_7d12b2bb5feb46d685603473d0cf5818_G_2 = _Property_a8d53d7ea07349e0979b956475bdd7cc_Out_0[1];
            float _Split_7d12b2bb5feb46d685603473d0cf5818_B_3 = _Property_a8d53d7ea07349e0979b956475bdd7cc_Out_0[2];
            float _Split_7d12b2bb5feb46d685603473d0cf5818_A_4 = _Property_a8d53d7ea07349e0979b956475bdd7cc_Out_0[3];
            float3 _RotateAboutAxis_1b91481bceed4e9a82a13975af123b02_Out_3;
            Unity_Rotate_About_Axis_Radians_float(IN.ObjectSpacePosition, (_Property_a8d53d7ea07349e0979b956475bdd7cc_Out_0.xyz), _Split_7d12b2bb5feb46d685603473d0cf5818_A_4, _RotateAboutAxis_1b91481bceed4e9a82a13975af123b02_Out_3);
            float _Property_258f4645340c46f69274c9f077f1a73c_Out_0 = _Speed;
            float _Multiply_94f6d857831c4e69b53b9bfc92dd852f_Out_2;
            Unity_Multiply_float_float(IN.TimeParameters.x, _Property_258f4645340c46f69274c9f077f1a73c_Out_0, _Multiply_94f6d857831c4e69b53b9bfc92dd852f_Out_2);
            float2 _TilingAndOffset_6cb9fd57231c4a429c9c0fe5aeb7cc58_Out_3;
            Unity_TilingAndOffset_float((_RotateAboutAxis_1b91481bceed4e9a82a13975af123b02_Out_3.xy), float2 (1, 1), (_Multiply_94f6d857831c4e69b53b9bfc92dd852f_Out_2.xx), _TilingAndOffset_6cb9fd57231c4a429c9c0fe5aeb7cc58_Out_3);
            float _Property_2b9001a870d04f8eb60f5d7e1ce909c5_Out_0 = _Noise_Scale;
            float _GradientNoise_061679506b214bb8b4792ec4dfe82ec6_Out_2;
            Unity_GradientNoise_float(_TilingAndOffset_6cb9fd57231c4a429c9c0fe5aeb7cc58_Out_3, _Property_2b9001a870d04f8eb60f5d7e1ce909c5_Out_0, _GradientNoise_061679506b214bb8b4792ec4dfe82ec6_Out_2);
            float2 _TilingAndOffset_1d2491b5855e49d3b2e6b5dbe5db07d4_Out_3;
            Unity_TilingAndOffset_float((_RotateAboutAxis_1b91481bceed4e9a82a13975af123b02_Out_3.xy), float2 (1, 1), float2 (0, 0), _TilingAndOffset_1d2491b5855e49d3b2e6b5dbe5db07d4_Out_3);
            float _GradientNoise_8a27c3fb323f4db1b38f287380605198_Out_2;
            Unity_GradientNoise_float(_TilingAndOffset_1d2491b5855e49d3b2e6b5dbe5db07d4_Out_3, _Property_2b9001a870d04f8eb60f5d7e1ce909c5_Out_0, _GradientNoise_8a27c3fb323f4db1b38f287380605198_Out_2);
            float _Add_a6dd2d6e3f564decbca34ec03a419130_Out_2;
            Unity_Add_float(_GradientNoise_061679506b214bb8b4792ec4dfe82ec6_Out_2, _GradientNoise_8a27c3fb323f4db1b38f287380605198_Out_2, _Add_a6dd2d6e3f564decbca34ec03a419130_Out_2);
            float _Divide_a757ea7167f343ecaec30e69b58c9bae_Out_2;
            Unity_Divide_float(_Add_a6dd2d6e3f564decbca34ec03a419130_Out_2, 2, _Divide_a757ea7167f343ecaec30e69b58c9bae_Out_2);
            float _Saturate_f355ba5a467f4488b7ec89e8a08484a3_Out_1;
            Unity_Saturate_float(_Divide_a757ea7167f343ecaec30e69b58c9bae_Out_2, _Saturate_f355ba5a467f4488b7ec89e8a08484a3_Out_1);
            float _Property_96da655cc17e4594836aa02d74efe33c_Out_0 = _Cloud_Pow;
            float _Power_318bede735044ec6811f2a5c345b7d73_Out_2;
            Unity_Power_float(_Saturate_f355ba5a467f4488b7ec89e8a08484a3_Out_1, _Property_96da655cc17e4594836aa02d74efe33c_Out_0, _Power_318bede735044ec6811f2a5c345b7d73_Out_2);
            float4 _Property_317e8becc0724841a13cbcf8d4c4efbc_Out_0 = _Remap_xy_zw;
            float _Split_3dee68ff9a374966b7612da59c6ac20a_R_1 = _Property_317e8becc0724841a13cbcf8d4c4efbc_Out_0[0];
            float _Split_3dee68ff9a374966b7612da59c6ac20a_G_2 = _Property_317e8becc0724841a13cbcf8d4c4efbc_Out_0[1];
            float _Split_3dee68ff9a374966b7612da59c6ac20a_B_3 = _Property_317e8becc0724841a13cbcf8d4c4efbc_Out_0[2];
            float _Split_3dee68ff9a374966b7612da59c6ac20a_A_4 = _Property_317e8becc0724841a13cbcf8d4c4efbc_Out_0[3];
            float4 _Combine_4e3ec9a6e4064091bba919631e732b7a_RGBA_4;
            float3 _Combine_4e3ec9a6e4064091bba919631e732b7a_RGB_5;
            float2 _Combine_4e3ec9a6e4064091bba919631e732b7a_RG_6;
            Unity_Combine_float(_Split_3dee68ff9a374966b7612da59c6ac20a_R_1, _Split_3dee68ff9a374966b7612da59c6ac20a_G_2, 0, 0, _Combine_4e3ec9a6e4064091bba919631e732b7a_RGBA_4, _Combine_4e3ec9a6e4064091bba919631e732b7a_RGB_5, _Combine_4e3ec9a6e4064091bba919631e732b7a_RG_6);
            float4 _Combine_6f976751f1234c77908b163e59da18bb_RGBA_4;
            float3 _Combine_6f976751f1234c77908b163e59da18bb_RGB_5;
            float2 _Combine_6f976751f1234c77908b163e59da18bb_RG_6;
            Unity_Combine_float(_Split_3dee68ff9a374966b7612da59c6ac20a_B_3, _Split_3dee68ff9a374966b7612da59c6ac20a_A_4, 0, 0, _Combine_6f976751f1234c77908b163e59da18bb_RGBA_4, _Combine_6f976751f1234c77908b163e59da18bb_RGB_5, _Combine_6f976751f1234c77908b163e59da18bb_RG_6);
            float _Remap_a11bf825d8d54f198c2355e6d3cc1fba_Out_3;
            Unity_Remap_float(_Power_318bede735044ec6811f2a5c345b7d73_Out_2, _Combine_4e3ec9a6e4064091bba919631e732b7a_RG_6, _Combine_6f976751f1234c77908b163e59da18bb_RG_6, _Remap_a11bf825d8d54f198c2355e6d3cc1fba_Out_3);
            float _Absolute_553a57701af34a45a18ca7b2af677c8a_Out_1;
            Unity_Absolute_float(_Remap_a11bf825d8d54f198c2355e6d3cc1fba_Out_3, _Absolute_553a57701af34a45a18ca7b2af677c8a_Out_1);
            float _Smoothstep_6babd4aa745b40db842b941b96adf7e9_Out_3;
            Unity_Smoothstep_float(_Property_7d8e49b5efe94dea8210c34a6319b1ef_Out_0, _Property_09307b889e8945078bacabda50cca5c6_Out_0, _Absolute_553a57701af34a45a18ca7b2af677c8a_Out_1, _Smoothstep_6babd4aa745b40db842b941b96adf7e9_Out_3);
            float _Property_17631cb6b51c44b593b4fb1f0ac8fa75_Out_0 = _Base_Speed;
            float _Multiply_2e98faddc46143bea8e48ab17d0e1c15_Out_2;
            Unity_Multiply_float_float(IN.TimeParameters.x, _Property_17631cb6b51c44b593b4fb1f0ac8fa75_Out_0, _Multiply_2e98faddc46143bea8e48ab17d0e1c15_Out_2);
            float2 _TilingAndOffset_d8c83d87b12649f7b6a3902973c4457a_Out_3;
            Unity_TilingAndOffset_float((_RotateAboutAxis_1b91481bceed4e9a82a13975af123b02_Out_3.xy), float2 (1, 1), (_Multiply_2e98faddc46143bea8e48ab17d0e1c15_Out_2.xx), _TilingAndOffset_d8c83d87b12649f7b6a3902973c4457a_Out_3);
            float _Property_2792df33a4d44e20b2f71fe244d5f369_Out_0 = _Base_Scale;
            float _GradientNoise_702d412fe90e4c64b91e9defbe1ffff2_Out_2;
            Unity_GradientNoise_float(_TilingAndOffset_d8c83d87b12649f7b6a3902973c4457a_Out_3, _Property_2792df33a4d44e20b2f71fe244d5f369_Out_0, _GradientNoise_702d412fe90e4c64b91e9defbe1ffff2_Out_2);
            float _Property_a965b78b3be84255ae4ff1617bd2df01_Out_0 = _BaseStrength;
            float _Multiply_9880df30952a454781c1f0c8356100dd_Out_2;
            Unity_Multiply_float_float(_GradientNoise_702d412fe90e4c64b91e9defbe1ffff2_Out_2, _Property_a965b78b3be84255ae4ff1617bd2df01_Out_0, _Multiply_9880df30952a454781c1f0c8356100dd_Out_2);
            float _Add_98d9cdbb65e44e0282692d35bd9d237b_Out_2;
            Unity_Add_float(_Smoothstep_6babd4aa745b40db842b941b96adf7e9_Out_3, _Multiply_9880df30952a454781c1f0c8356100dd_Out_2, _Add_98d9cdbb65e44e0282692d35bd9d237b_Out_2);
            float _Add_d305fd085a9b459da3d4bd5108430b3f_Out_2;
            Unity_Add_float(1, _Property_a965b78b3be84255ae4ff1617bd2df01_Out_0, _Add_d305fd085a9b459da3d4bd5108430b3f_Out_2);
            float _Divide_55db7b7a0b8b481d83fb512a13a2dba6_Out_2;
            Unity_Divide_float(_Add_98d9cdbb65e44e0282692d35bd9d237b_Out_2, _Add_d305fd085a9b459da3d4bd5108430b3f_Out_2, _Divide_55db7b7a0b8b481d83fb512a13a2dba6_Out_2);
            float3 _Multiply_639bbd01ca0947fdbb4245744090b06e_Out_2;
            Unity_Multiply_float3_float3(IN.ObjectSpaceNormal, (_Divide_55db7b7a0b8b481d83fb512a13a2dba6_Out_2.xxx), _Multiply_639bbd01ca0947fdbb4245744090b06e_Out_2);
            float _Property_8b198d3112494fb98defdd5dc1b13601_Out_0 = _Vertexoffset;
            float3 _Multiply_2119a238e1d14c34879c4926fe468be5_Out_2;
            Unity_Multiply_float3_float3(_Multiply_639bbd01ca0947fdbb4245744090b06e_Out_2, (_Property_8b198d3112494fb98defdd5dc1b13601_Out_0.xxx), _Multiply_2119a238e1d14c34879c4926fe468be5_Out_2);
            float3 _Add_18a07d3e52a847f594f01810747a3393_Out_2;
            Unity_Add_float3(IN.ObjectSpacePosition, _Multiply_2119a238e1d14c34879c4926fe468be5_Out_2, _Add_18a07d3e52a847f594f01810747a3393_Out_2);
            float3 _Add_b9cf96b2dcd84792b2e40dd036537586_Out_2;
            Unity_Add_float3(_Multiply_22e187ffacc7402bbe63087272b7efb5_Out_2, _Add_18a07d3e52a847f594f01810747a3393_Out_2, _Add_b9cf96b2dcd84792b2e40dd036537586_Out_2);
            description.Position = _Add_b9cf96b2dcd84792b2e40dd036537586_Out_2;
            description.Normal = IN.ObjectSpaceNormal;
            description.Tangent = IN.ObjectSpaceTangent;
            return description;
        }
        
            // Graph Pixel
            struct SurfaceDescription
        {
            float3 BaseColor;
            float3 Emission;
            float Alpha;
        };
        
        SurfaceDescription SurfaceDescriptionFunction(SurfaceDescriptionInputs IN)
        {
            SurfaceDescription surface = (SurfaceDescription)0;
            float _Property_7d8e49b5efe94dea8210c34a6319b1ef_Out_0 = _SmoothEdge1;
            float _Property_09307b889e8945078bacabda50cca5c6_Out_0 = _SmoothEdge2;
            float4 _Property_a8d53d7ea07349e0979b956475bdd7cc_Out_0 = _Rotate_Projection;
            float _Split_7d12b2bb5feb46d685603473d0cf5818_R_1 = _Property_a8d53d7ea07349e0979b956475bdd7cc_Out_0[0];
            float _Split_7d12b2bb5feb46d685603473d0cf5818_G_2 = _Property_a8d53d7ea07349e0979b956475bdd7cc_Out_0[1];
            float _Split_7d12b2bb5feb46d685603473d0cf5818_B_3 = _Property_a8d53d7ea07349e0979b956475bdd7cc_Out_0[2];
            float _Split_7d12b2bb5feb46d685603473d0cf5818_A_4 = _Property_a8d53d7ea07349e0979b956475bdd7cc_Out_0[3];
            float3 _RotateAboutAxis_1b91481bceed4e9a82a13975af123b02_Out_3;
            Unity_Rotate_About_Axis_Radians_float(IN.ObjectSpacePosition, (_Property_a8d53d7ea07349e0979b956475bdd7cc_Out_0.xyz), _Split_7d12b2bb5feb46d685603473d0cf5818_A_4, _RotateAboutAxis_1b91481bceed4e9a82a13975af123b02_Out_3);
            float _Property_258f4645340c46f69274c9f077f1a73c_Out_0 = _Speed;
            float _Multiply_94f6d857831c4e69b53b9bfc92dd852f_Out_2;
            Unity_Multiply_float_float(IN.TimeParameters.x, _Property_258f4645340c46f69274c9f077f1a73c_Out_0, _Multiply_94f6d857831c4e69b53b9bfc92dd852f_Out_2);
            float2 _TilingAndOffset_6cb9fd57231c4a429c9c0fe5aeb7cc58_Out_3;
            Unity_TilingAndOffset_float((_RotateAboutAxis_1b91481bceed4e9a82a13975af123b02_Out_3.xy), float2 (1, 1), (_Multiply_94f6d857831c4e69b53b9bfc92dd852f_Out_2.xx), _TilingAndOffset_6cb9fd57231c4a429c9c0fe5aeb7cc58_Out_3);
            float _Property_2b9001a870d04f8eb60f5d7e1ce909c5_Out_0 = _Noise_Scale;
            float _GradientNoise_061679506b214bb8b4792ec4dfe82ec6_Out_2;
            Unity_GradientNoise_float(_TilingAndOffset_6cb9fd57231c4a429c9c0fe5aeb7cc58_Out_3, _Property_2b9001a870d04f8eb60f5d7e1ce909c5_Out_0, _GradientNoise_061679506b214bb8b4792ec4dfe82ec6_Out_2);
            float2 _TilingAndOffset_1d2491b5855e49d3b2e6b5dbe5db07d4_Out_3;
            Unity_TilingAndOffset_float((_RotateAboutAxis_1b91481bceed4e9a82a13975af123b02_Out_3.xy), float2 (1, 1), float2 (0, 0), _TilingAndOffset_1d2491b5855e49d3b2e6b5dbe5db07d4_Out_3);
            float _GradientNoise_8a27c3fb323f4db1b38f287380605198_Out_2;
            Unity_GradientNoise_float(_TilingAndOffset_1d2491b5855e49d3b2e6b5dbe5db07d4_Out_3, _Property_2b9001a870d04f8eb60f5d7e1ce909c5_Out_0, _GradientNoise_8a27c3fb323f4db1b38f287380605198_Out_2);
            float _Add_a6dd2d6e3f564decbca34ec03a419130_Out_2;
            Unity_Add_float(_GradientNoise_061679506b214bb8b4792ec4dfe82ec6_Out_2, _GradientNoise_8a27c3fb323f4db1b38f287380605198_Out_2, _Add_a6dd2d6e3f564decbca34ec03a419130_Out_2);
            float _Divide_a757ea7167f343ecaec30e69b58c9bae_Out_2;
            Unity_Divide_float(_Add_a6dd2d6e3f564decbca34ec03a419130_Out_2, 2, _Divide_a757ea7167f343ecaec30e69b58c9bae_Out_2);
            float _Saturate_f355ba5a467f4488b7ec89e8a08484a3_Out_1;
            Unity_Saturate_float(_Divide_a757ea7167f343ecaec30e69b58c9bae_Out_2, _Saturate_f355ba5a467f4488b7ec89e8a08484a3_Out_1);
            float _Property_96da655cc17e4594836aa02d74efe33c_Out_0 = _Cloud_Pow;
            float _Power_318bede735044ec6811f2a5c345b7d73_Out_2;
            Unity_Power_float(_Saturate_f355ba5a467f4488b7ec89e8a08484a3_Out_1, _Property_96da655cc17e4594836aa02d74efe33c_Out_0, _Power_318bede735044ec6811f2a5c345b7d73_Out_2);
            float4 _Property_317e8becc0724841a13cbcf8d4c4efbc_Out_0 = _Remap_xy_zw;
            float _Split_3dee68ff9a374966b7612da59c6ac20a_R_1 = _Property_317e8becc0724841a13cbcf8d4c4efbc_Out_0[0];
            float _Split_3dee68ff9a374966b7612da59c6ac20a_G_2 = _Property_317e8becc0724841a13cbcf8d4c4efbc_Out_0[1];
            float _Split_3dee68ff9a374966b7612da59c6ac20a_B_3 = _Property_317e8becc0724841a13cbcf8d4c4efbc_Out_0[2];
            float _Split_3dee68ff9a374966b7612da59c6ac20a_A_4 = _Property_317e8becc0724841a13cbcf8d4c4efbc_Out_0[3];
            float4 _Combine_4e3ec9a6e4064091bba919631e732b7a_RGBA_4;
            float3 _Combine_4e3ec9a6e4064091bba919631e732b7a_RGB_5;
            float2 _Combine_4e3ec9a6e4064091bba919631e732b7a_RG_6;
            Unity_Combine_float(_Split_3dee68ff9a374966b7612da59c6ac20a_R_1, _Split_3dee68ff9a374966b7612da59c6ac20a_G_2, 0, 0, _Combine_4e3ec9a6e4064091bba919631e732b7a_RGBA_4, _Combine_4e3ec9a6e4064091bba919631e732b7a_RGB_5, _Combine_4e3ec9a6e4064091bba919631e732b7a_RG_6);
            float4 _Combine_6f976751f1234c77908b163e59da18bb_RGBA_4;
            float3 _Combine_6f976751f1234c77908b163e59da18bb_RGB_5;
            float2 _Combine_6f976751f1234c77908b163e59da18bb_RG_6;
            Unity_Combine_float(_Split_3dee68ff9a374966b7612da59c6ac20a_B_3, _Split_3dee68ff9a374966b7612da59c6ac20a_A_4, 0, 0, _Combine_6f976751f1234c77908b163e59da18bb_RGBA_4, _Combine_6f976751f1234c77908b163e59da18bb_RGB_5, _Combine_6f976751f1234c77908b163e59da18bb_RG_6);
            float _Remap_a11bf825d8d54f198c2355e6d3cc1fba_Out_3;
            Unity_Remap_float(_Power_318bede735044ec6811f2a5c345b7d73_Out_2, _Combine_4e3ec9a6e4064091bba919631e732b7a_RG_6, _Combine_6f976751f1234c77908b163e59da18bb_RG_6, _Remap_a11bf825d8d54f198c2355e6d3cc1fba_Out_3);
            float _Absolute_553a57701af34a45a18ca7b2af677c8a_Out_1;
            Unity_Absolute_float(_Remap_a11bf825d8d54f198c2355e6d3cc1fba_Out_3, _Absolute_553a57701af34a45a18ca7b2af677c8a_Out_1);
            float _Smoothstep_6babd4aa745b40db842b941b96adf7e9_Out_3;
            Unity_Smoothstep_float(_Property_7d8e49b5efe94dea8210c34a6319b1ef_Out_0, _Property_09307b889e8945078bacabda50cca5c6_Out_0, _Absolute_553a57701af34a45a18ca7b2af677c8a_Out_1, _Smoothstep_6babd4aa745b40db842b941b96adf7e9_Out_3);
            float _Property_17631cb6b51c44b593b4fb1f0ac8fa75_Out_0 = _Base_Speed;
            float _Multiply_2e98faddc46143bea8e48ab17d0e1c15_Out_2;
            Unity_Multiply_float_float(IN.TimeParameters.x, _Property_17631cb6b51c44b593b4fb1f0ac8fa75_Out_0, _Multiply_2e98faddc46143bea8e48ab17d0e1c15_Out_2);
            float2 _TilingAndOffset_d8c83d87b12649f7b6a3902973c4457a_Out_3;
            Unity_TilingAndOffset_float((_RotateAboutAxis_1b91481bceed4e9a82a13975af123b02_Out_3.xy), float2 (1, 1), (_Multiply_2e98faddc46143bea8e48ab17d0e1c15_Out_2.xx), _TilingAndOffset_d8c83d87b12649f7b6a3902973c4457a_Out_3);
            float _Property_2792df33a4d44e20b2f71fe244d5f369_Out_0 = _Base_Scale;
            float _GradientNoise_702d412fe90e4c64b91e9defbe1ffff2_Out_2;
            Unity_GradientNoise_float(_TilingAndOffset_d8c83d87b12649f7b6a3902973c4457a_Out_3, _Property_2792df33a4d44e20b2f71fe244d5f369_Out_0, _GradientNoise_702d412fe90e4c64b91e9defbe1ffff2_Out_2);
            float _Property_a965b78b3be84255ae4ff1617bd2df01_Out_0 = _BaseStrength;
            float _Multiply_9880df30952a454781c1f0c8356100dd_Out_2;
            Unity_Multiply_float_float(_GradientNoise_702d412fe90e4c64b91e9defbe1ffff2_Out_2, _Property_a965b78b3be84255ae4ff1617bd2df01_Out_0, _Multiply_9880df30952a454781c1f0c8356100dd_Out_2);
            float _Add_98d9cdbb65e44e0282692d35bd9d237b_Out_2;
            Unity_Add_float(_Smoothstep_6babd4aa745b40db842b941b96adf7e9_Out_3, _Multiply_9880df30952a454781c1f0c8356100dd_Out_2, _Add_98d9cdbb65e44e0282692d35bd9d237b_Out_2);
            float _Add_d305fd085a9b459da3d4bd5108430b3f_Out_2;
            Unity_Add_float(1, _Property_a965b78b3be84255ae4ff1617bd2df01_Out_0, _Add_d305fd085a9b459da3d4bd5108430b3f_Out_2);
            float _Divide_55db7b7a0b8b481d83fb512a13a2dba6_Out_2;
            Unity_Divide_float(_Add_98d9cdbb65e44e0282692d35bd9d237b_Out_2, _Add_d305fd085a9b459da3d4bd5108430b3f_Out_2, _Divide_55db7b7a0b8b481d83fb512a13a2dba6_Out_2);
            float _Property_5a371e38a60143fcae81da7313c1bf15_Out_0 = _Fresnel_Power;
            float _FresnelEffect_4c470240dea248acb0092676d71437cb_Out_3;
            Unity_FresnelEffect_float(IN.WorldSpaceNormal, IN.WorldSpaceViewDirection, _Property_5a371e38a60143fcae81da7313c1bf15_Out_0, _FresnelEffect_4c470240dea248acb0092676d71437cb_Out_3);
            float _Multiply_384d15a2ef094b7e8b1ec6d69dada246_Out_2;
            Unity_Multiply_float_float(_Divide_55db7b7a0b8b481d83fb512a13a2dba6_Out_2, _FresnelEffect_4c470240dea248acb0092676d71437cb_Out_3, _Multiply_384d15a2ef094b7e8b1ec6d69dada246_Out_2);
            float _Property_3c23366c651c4949b03cb10c14ae0a27_Out_0 = _Fresnel_Opacity;
            float _Multiply_9380e32f6e4644e1b42e398229c18d31_Out_2;
            Unity_Multiply_float_float(_Multiply_384d15a2ef094b7e8b1ec6d69dada246_Out_2, _Property_3c23366c651c4949b03cb10c14ae0a27_Out_0, _Multiply_9380e32f6e4644e1b42e398229c18d31_Out_2);
            float4 _Property_dff39e3157cb4a09aac968677ade995d_Out_0 = _Color_Valley;
            float4 _Property_1b300af9e23e428fa893e55f9390600d_Out_0 = _Color_Peak;
            float4 _Lerp_6d0a20bb25554e1fa8697f473485e856_Out_3;
            Unity_Lerp_float4(_Property_dff39e3157cb4a09aac968677ade995d_Out_0, _Property_1b300af9e23e428fa893e55f9390600d_Out_0, (_Add_98d9cdbb65e44e0282692d35bd9d237b_Out_2.xxxx), _Lerp_6d0a20bb25554e1fa8697f473485e856_Out_3);
            float4 _Add_6507a6920d9c478888f235ad9d0bb542_Out_2;
            Unity_Add_float4((_Multiply_9380e32f6e4644e1b42e398229c18d31_Out_2.xxxx), _Lerp_6d0a20bb25554e1fa8697f473485e856_Out_3, _Add_6507a6920d9c478888f235ad9d0bb542_Out_2);
            float _Property_9cf7107417e042afb41766bb37be827b_Out_0 = _Emission_Strength;
            float4 _Multiply_31ae534c0cc640be9fda8de7cc705bbf_Out_2;
            Unity_Multiply_float4_float4(_Add_6507a6920d9c478888f235ad9d0bb542_Out_2, (_Property_9cf7107417e042afb41766bb37be827b_Out_0.xxxx), _Multiply_31ae534c0cc640be9fda8de7cc705bbf_Out_2);
            float _SceneDepth_619a7e0097894c29ba4557fde6cbb174_Out_1;
            Unity_SceneDepth_Eye_float(float4(IN.ScreenPosition.xy / IN.ScreenPosition.w, 0, 0), _SceneDepth_619a7e0097894c29ba4557fde6cbb174_Out_1);
            float4 _ScreenPosition_ee728e739f744068b0d15c1205d618a0_Out_0 = IN.ScreenPosition;
            float _Split_d5d8a30c527c46a19ab94602c057016e_R_1 = _ScreenPosition_ee728e739f744068b0d15c1205d618a0_Out_0[0];
            float _Split_d5d8a30c527c46a19ab94602c057016e_G_2 = _ScreenPosition_ee728e739f744068b0d15c1205d618a0_Out_0[1];
            float _Split_d5d8a30c527c46a19ab94602c057016e_B_3 = _ScreenPosition_ee728e739f744068b0d15c1205d618a0_Out_0[2];
            float _Split_d5d8a30c527c46a19ab94602c057016e_A_4 = _ScreenPosition_ee728e739f744068b0d15c1205d618a0_Out_0[3];
            float _Subtract_07eb78fa00d74ade84172a64a4a4616c_Out_2;
            Unity_Subtract_float(_Split_d5d8a30c527c46a19ab94602c057016e_A_4, 1, _Subtract_07eb78fa00d74ade84172a64a4a4616c_Out_2);
            float _Subtract_3ef0962257844c2c87b9ff8d165099f3_Out_2;
            Unity_Subtract_float(_SceneDepth_619a7e0097894c29ba4557fde6cbb174_Out_1, _Subtract_07eb78fa00d74ade84172a64a4a4616c_Out_2, _Subtract_3ef0962257844c2c87b9ff8d165099f3_Out_2);
            float _Property_9167e3d66076450baeb620b8f8b66552_Out_0 = _Depth_Fade;
            float _Divide_9a1ae8922923443883cbd9e71941de32_Out_2;
            Unity_Divide_float(_Subtract_3ef0962257844c2c87b9ff8d165099f3_Out_2, _Property_9167e3d66076450baeb620b8f8b66552_Out_0, _Divide_9a1ae8922923443883cbd9e71941de32_Out_2);
            float _Saturate_791ce4d2963e420ba68a97fca0bef8f9_Out_1;
            Unity_Saturate_float(_Divide_9a1ae8922923443883cbd9e71941de32_Out_2, _Saturate_791ce4d2963e420ba68a97fca0bef8f9_Out_1);
            surface.BaseColor = (_Add_6507a6920d9c478888f235ad9d0bb542_Out_2.xyz);
            surface.Emission = (_Multiply_31ae534c0cc640be9fda8de7cc705bbf_Out_2.xyz);
            surface.Alpha = _Saturate_791ce4d2963e420ba68a97fca0bef8f9_Out_1;
            return surface;
        }
        
            // --------------------------------------------------
            // Build Graph Inputs
            #ifdef HAVE_VFX_MODIFICATION
            #define VFX_SRP_ATTRIBUTES AttributesMesh
            #define VaryingsMeshType VaryingsMeshToPS
            #define VFX_SRP_VARYINGS VaryingsMeshType
            #define VFX_SRP_SURFACE_INPUTS FragInputs
            #endif
            
        VertexDescriptionInputs AttributesMeshToVertexDescriptionInputs(AttributesMesh input)
        {
            VertexDescriptionInputs output;
            ZERO_INITIALIZE(VertexDescriptionInputs, output);
        
            output.ObjectSpaceNormal =                          input.normalOS;
            output.ObjectSpaceTangent =                         input.tangentOS.xyz;
            output.ObjectSpacePosition =                        input.positionOS;
            output.TimeParameters =                             _TimeParameters.xyz; // Note: in case of animation this will be overwrite (allow to handle motion vector)
        
            return output;
        }
        
        VertexDescription GetVertexDescription(AttributesMesh input, float3 timeParameters
        #ifdef HAVE_VFX_MODIFICATION
            , AttributesElement element
        #endif
        )
        {
            // build graph inputs
            VertexDescriptionInputs vertexDescriptionInputs = AttributesMeshToVertexDescriptionInputs(input);
            // Override time parameters with used one (This is required to correctly handle motion vector for vertex animation based on time)
            vertexDescriptionInputs.TimeParameters = timeParameters;
        
            // evaluate vertex graph
        #ifdef HAVE_VFX_MODIFICATION
            GraphProperties properties;
            ZERO_INITIALIZE(GraphProperties, properties);
        
            // Fetch the vertex graph properties for the particle instance.
            GetElementVertexProperties(element, properties);
        
            VertexDescription vertexDescription = VertexDescriptionFunction(vertexDescriptionInputs, properties);
        #else
            VertexDescription vertexDescription = VertexDescriptionFunction(vertexDescriptionInputs);
        #endif
            return vertexDescription;
        
        }
        
        AttributesMesh ApplyMeshModification(AttributesMesh input, float3 timeParameters
        #ifdef USE_CUSTOMINTERP_SUBSTRUCT
            #ifdef TESSELLATION_ON
            , inout VaryingsMeshToDS varyings
            #else
            , inout VaryingsMeshToPS varyings
            #endif
        #endif
        #ifdef HAVE_VFX_MODIFICATION
                , AttributesElement element
        #endif
            )
        {
            VertexDescription vertexDescription = GetVertexDescription(input, timeParameters
        #ifdef HAVE_VFX_MODIFICATION
                , element
        #endif
            );
        
            // copy graph output to the results
            input.positionOS = vertexDescription.Position;
            input.normalOS = vertexDescription.Normal;
            input.tangentOS.xyz = vertexDescription.Tangent;
        
            
        
            return input;
        }
        
        #if defined(_ADD_CUSTOM_VELOCITY) // For shader graph custom velocity
        // Return precomputed Velocity in object space
        float3 GetCustomVelocity(AttributesMesh input
        #ifdef HAVE_VFX_MODIFICATION
            , AttributesElement element
        #endif
        )
        {
            VertexDescription vertexDescription = GetVertexDescription(input, _TimeParameters.xyz
        #ifdef HAVE_VFX_MODIFICATION
                , element
        #endif
            );
            return vertexDescription.CustomVelocity;
        }
        #endif
        
        FragInputs BuildFragInputs(VaryingsMeshToPS input)
        {
            FragInputs output;
            ZERO_INITIALIZE(FragInputs, output);
        
            // Init to some default value to make the computer quiet (else it output 'divide by zero' warning even if value is not used).
            // TODO: this is a really poor workaround, but the variable is used in a bunch of places
            // to compute normals which are then passed on elsewhere to compute other values...
            output.tangentToWorld = k_identity3x3;
            output.positionSS = input.positionCS;       // input.positionCS is SV_Position
        
            output.positionRWS =                input.positionRWS;
            output.tangentToWorld =             BuildTangentToWorld(input.tangentWS, input.normalWS);
        
        #ifdef HAVE_VFX_MODIFICATION
            // FragInputs from VFX come from two places: Interpolator or CBuffer.
            /* WARNING: $splice Could not find named fragment 'VFXSetFragInputs' */
        
        #endif
        
            // splice point to copy custom interpolator fields from varyings to frag inputs
            
        
            return output;
        }
        
        // existing HDRP code uses the combined function to go directly from packed to frag inputs
        FragInputs UnpackVaryingsMeshToFragInputs(PackedVaryingsMeshToPS input)
        {
            UNITY_SETUP_INSTANCE_ID(input);
            VaryingsMeshToPS unpacked = UnpackVaryingsMeshToPS(input);
            return BuildFragInputs(unpacked);
        }
            SurfaceDescriptionInputs FragInputsToSurfaceDescriptionInputs(FragInputs input, float3 viewWS)
        {
            SurfaceDescriptionInputs output;
            ZERO_INITIALIZE(SurfaceDescriptionInputs, output);
        
            output.WorldSpaceNormal =                           normalize(input.tangentToWorld[2].xyz);
            #if defined(SHADER_STAGE_RAY_TRACING)
            #else
            #endif
            output.WorldSpaceViewDirection =                    normalize(viewWS);
            output.WorldSpacePosition =                         input.positionRWS;
            output.ObjectSpacePosition =                        TransformWorldToObject(input.positionRWS);
            output.ScreenPosition =                             ComputeScreenPos(TransformWorldToHClip(input.positionRWS), _ProjectionParams.x);
            output.TimeParameters =                             _TimeParameters.xyz; // This is mainly for LW as HD overwrite this value
        
            // splice point to copy frag inputs custom interpolator pack into the SDI
            
        
            return output;
        }
        
            // --------------------------------------------------
            // Build Surface Data (Specific Material)
        
        void BuildSurfaceData(FragInputs fragInputs, inout SurfaceDescription surfaceDescription, float3 V, PositionInputs posInput, out SurfaceData surfaceData)
        {
            // setup defaults -- these are used if the graph doesn't output a value
            ZERO_INITIALIZE(SurfaceData, surfaceData);
        
            // copy across graph values, if defined
            surfaceData.color = surfaceDescription.BaseColor;
        
            #ifdef WRITE_NORMAL_BUFFER
            // When we need to export the normal (in the depth prepass, we write the geometry one)
            surfaceData.normalWS = fragInputs.tangentToWorld[2];
            #endif
        
            #if defined(DEBUG_DISPLAY)
            if (_DebugMipMapMode != DEBUGMIPMAPMODE_NONE)
            {
                // TODO
            }
            #endif
        
            #ifdef _ENABLE_SHADOW_MATTE
        
                #if (SHADERPASS == SHADERPASS_FORWARD_UNLIT) || (SHADERPASS == SHADERPASS_RAYTRACING_GBUFFER) || (SHADERPASS == SHADERPASS_RAYTRACING_INDIRECT) || (SHADERPASS == SHADERPASS_RAYTRACING_FORWARD)
        
                    HDShadowContext shadowContext = InitShadowContext();
        
                    // Evaluate the shadow, the normal is guaranteed if shadow matte is enabled on this shader.
                    float3 shadow3;
                    ShadowLoopMin(shadowContext, posInput, normalize(fragInputs.tangentToWorld[2]), asuint(_ShadowMatteFilter), GetMeshRenderingLightLayer(), shadow3);
        
                    // Compute the average value in the fourth channel
                    float4 shadow = float4(shadow3, dot(shadow3, float3(1.0/3.0, 1.0/3.0, 1.0/3.0)));
        
                    float4 shadowColor = (1.0 - shadow) * surfaceDescription.ShadowTint.rgba;
                    float  localAlpha  = saturate(shadowColor.a + surfaceDescription.Alpha);
        
                    // Keep the nested lerp
                    // With no Color (bsdfData.color.rgb, bsdfData.color.a == 0.0f), just use ShadowColor*Color to avoid a ring of "white" around the shadow
                    // And mix color to consider the Color & ShadowColor alpha (from texture or/and color picker)
                    #ifdef _SURFACE_TYPE_TRANSPARENT
                        surfaceData.color = lerp(shadowColor.rgb * surfaceData.color, lerp(lerp(shadowColor.rgb, surfaceData.color, 1.0 - surfaceDescription.ShadowTint.a), surfaceData.color, shadow.rgb), surfaceDescription.Alpha);
                    #else
                        surfaceData.color = lerp(lerp(shadowColor.rgb, surfaceData.color, 1.0 - surfaceDescription.ShadowTint.a), surfaceData.color, shadow.rgb);
                    #endif
                    localAlpha = ApplyBlendMode(surfaceData.color, localAlpha).a;
        
                    surfaceDescription.Alpha = localAlpha;
        
                #elif SHADERPASS == SHADERPASS_PATH_TRACING
        
                    surfaceData.normalWS = fragInputs.tangentToWorld[2];
                    surfaceData.shadowTint = surfaceDescription.ShadowTint.rgba;
        
                #endif
        
            #endif // _ENABLE_SHADOW_MATTE
        }
        
            // --------------------------------------------------
            // Get Surface And BuiltinData
        
            void GetSurfaceAndBuiltinData(FragInputs fragInputs, float3 V, inout PositionInputs posInput, out SurfaceData surfaceData, out BuiltinData builtinData RAY_TRACING_OPTIONAL_PARAMETERS)
            {
                // Don't dither if displaced tessellation (we're fading out the displacement instead to match the next LOD)
                #if !defined(SHADER_STAGE_RAY_TRACING) && !defined(_TESSELLATION_DISPLACEMENT)
                #ifdef LOD_FADE_CROSSFADE // enable dithering LOD transition if user select CrossFade transition in LOD group
                LODDitheringTransition(ComputeFadeMaskSeed(V, posInput.positionSS), unity_LODFade.x);
                #endif
                #endif
        
                #ifndef SHADER_UNLIT
                #ifdef _DOUBLESIDED_ON
                    float3 doubleSidedConstants = _DoubleSidedConstants.xyz;
                #else
                    float3 doubleSidedConstants = float3(1.0, 1.0, 1.0);
                #endif
        
                ApplyDoubleSidedFlipOrMirror(fragInputs, doubleSidedConstants); // Apply double sided flip on the vertex normal
                #endif // SHADER_UNLIT
        
                SurfaceDescriptionInputs surfaceDescriptionInputs = FragInputsToSurfaceDescriptionInputs(fragInputs, V);
        
                #if defined(HAVE_VFX_MODIFICATION)
                GraphProperties properties;
                ZERO_INITIALIZE(GraphProperties, properties);
        
                GetElementPixelProperties(fragInputs, properties);
        
                SurfaceDescription surfaceDescription = SurfaceDescriptionFunction(surfaceDescriptionInputs, properties);
                #else
                SurfaceDescription surfaceDescription = SurfaceDescriptionFunction(surfaceDescriptionInputs);
                #endif
        
                // Perform alpha test very early to save performance (a killed pixel will not sample textures)
                // TODO: split graph evaluation to grab just alpha dependencies first? tricky..
                #ifdef _ALPHATEST_ON
                    float alphaCutoff = surfaceDescription.AlphaClipThreshold;
                    #if SHADERPASS == SHADERPASS_TRANSPARENT_DEPTH_PREPASS
                    // The TransparentDepthPrepass is also used with SSR transparent.
                    // If an artists enable transaprent SSR but not the TransparentDepthPrepass itself, then we use AlphaClipThreshold
                    // otherwise if TransparentDepthPrepass is enabled we use AlphaClipThresholdDepthPrepass
                    #elif SHADERPASS == SHADERPASS_TRANSPARENT_DEPTH_POSTPASS
                    // DepthPostpass always use its own alpha threshold
                    alphaCutoff = surfaceDescription.AlphaClipThresholdDepthPostpass;
                    #elif (SHADERPASS == SHADERPASS_SHADOWS) || (SHADERPASS == SHADERPASS_RAYTRACING_VISIBILITY)
                    // If use shadow threshold isn't enable we don't allow any test
                    #endif
        
                    GENERIC_ALPHA_TEST(surfaceDescription.Alpha, alphaCutoff);
                #endif
        
                #if !defined(SHADER_STAGE_RAY_TRACING) && _DEPTHOFFSET_ON
                ApplyDepthOffsetPositionInput(V, surfaceDescription.DepthOffset, GetViewForwardDir(), GetWorldToHClipMatrix(), posInput);
                #endif
        
                #ifndef SHADER_UNLIT
                float3 bentNormalWS;
                BuildSurfaceData(fragInputs, surfaceDescription, V, posInput, surfaceData, bentNormalWS);
        
                #ifdef FRAG_INPUTS_USE_TEXCOORD1
                    float4 lightmapTexCoord1 = fragInputs.texCoord1;
                #else
                    float4 lightmapTexCoord1 = float4(0,0,0,0);
                #endif
        
                #ifdef FRAG_INPUTS_USE_TEXCOORD2
                    float4 lightmapTexCoord2 = fragInputs.texCoord2;
                #else
                    float4 lightmapTexCoord2 = float4(0,0,0,0);
                #endif
        
                // Builtin Data
                // For back lighting we use the oposite vertex normal
                InitBuiltinData(posInput, surfaceDescription.Alpha, bentNormalWS, -fragInputs.tangentToWorld[2], lightmapTexCoord1, lightmapTexCoord2, builtinData);
        
                #else
                BuildSurfaceData(fragInputs, surfaceDescription, V, posInput, surfaceData);
        
                ZERO_BUILTIN_INITIALIZE(builtinData); // No call to InitBuiltinData as we don't have any lighting
                builtinData.opacity = surfaceDescription.Alpha;
        
                #if defined(DEBUG_DISPLAY)
                    // Light Layers are currently not used for the Unlit shader (because it is not lit)
                    // But Unlit objects do cast shadows according to their rendering layer mask, which is what we want to
                    // display in the light layers visualization mode, therefore we need the renderingLayers
                    builtinData.renderingLayers = GetMeshRenderingLightLayer();
                #endif
        
                #endif // SHADER_UNLIT
        
                #ifdef _ALPHATEST_ON
                    // Used for sharpening by alpha to mask - Alpha to covertage is only used with depth only and forward pass (no shadow pass, no transparent pass)
                    builtinData.alphaClipTreshold = alphaCutoff;
                #endif
        
                // override sampleBakedGI - not used by Unlit
        
                builtinData.emissiveColor = surfaceDescription.Emission;
        
                // Note this will not fully work on transparent surfaces (can check with _SURFACE_TYPE_TRANSPARENT define)
                // We will always overwrite vt feeback with the nearest. So behind transparent surfaces vt will not be resolved
                // This is a limitation of the current MRT approach.
                #ifdef UNITY_VIRTUAL_TEXTURING
                #endif
        
                #if _DEPTHOFFSET_ON
                builtinData.depthOffset = surfaceDescription.DepthOffset;
                #endif
        
                // TODO: We should generate distortion / distortionBlur for non distortion pass
                #if (SHADERPASS == SHADERPASS_DISTORTION)
                builtinData.distortion = surfaceDescription.Distortion;
                builtinData.distortionBlur = surfaceDescription.DistortionBlur;
                #endif
        
                #ifndef SHADER_UNLIT
                // PostInitBuiltinData call ApplyDebugToBuiltinData
                PostInitBuiltinData(V, posInput, surfaceData, builtinData);
                #else
                ApplyDebugToBuiltinData(builtinData);
                #endif
        
                RAY_TRACING_OPTIONAL_ALPHA_TEST_PASS
            }
        
            // --------------------------------------------------
            // Main
        
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/ShaderPass/ShaderPassMotionVectors.hlsl"
        
            // --------------------------------------------------
            // Visual Effect Vertex Invocations
        
        	#ifdef HAVE_VFX_MODIFICATION
        	#include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/VisualEffectVertex.hlsl"
        	#endif
        
            ENDHLSL
        }
        Pass
        {
            Name "DepthForwardOnly"
            Tags
            {
                "LightMode" = "DepthForwardOnly"
            }
        
            // Render State
            Cull [_CullMode]
        ZWrite On
        Stencil
        {
        WriteMask [_StencilWriteMaskDepth]
        Ref [_StencilRefDepth]
        CompFront Always
        PassFront Replace
        CompBack Always
        PassBack Replace
        }
        
            // Debug
            // <None>
        
            // --------------------------------------------------
            // Pass
        
            HLSLPROGRAM
        
            // Pragmas
            #pragma instancing_options renderinglayer
        #pragma target 4.5
        #pragma vertex Vert
        #pragma fragment Frag
        #pragma only_renderers d3d11 playstation xboxone xboxseries vulkan metal switch
        #pragma multi_compile_instancing
        
            // Keywords
            #pragma multi_compile_fragment _ WRITE_MSAA_DEPTH
        #pragma shader_feature _ _SURFACE_TYPE_TRANSPARENT
        #pragma shader_feature_local _BLENDMODE_OFF _BLENDMODE_ALPHA _BLENDMODE_ADD _BLENDMODE_PRE_MULTIPLY
        #pragma shader_feature_local _ _ADD_PRECOMPUTED_VELOCITY
        #pragma shader_feature_local _ _TRANSPARENT_WRITES_MOTION_VEC
        #pragma shader_feature_local_fragment _ _ENABLE_FOG_ON_TRANSPARENT
            // GraphKeywords: <None>
        
            // Early Instancing Defines
            // DotsInstancingOptions: <None>
        
            // Injected Instanced Properties (must be included before UnityInstancing.hlsl)
            // HybridV1InjectedBuiltinProperties: <None>
        
            // For custom interpolators to inject a substruct definition before FragInputs definition,
            // allowing for FragInputs to capture CI's intended for ShaderGraph's SDI.
            struct CustomInterpolators
        {
        };
        #define USE_CUSTOMINTERP_SUBSTRUCT
        
        
        
            // TODO: Merge FragInputsVFX substruct with CustomInterpolators.
        	#ifdef HAVE_VFX_MODIFICATION
        	struct FragInputsVFX
            {
                /* WARNING: $splice Could not find named fragment 'FragInputsVFX' */
            };
            #endif
        
            #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Common.hlsl"
        	#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/GeometricTools.hlsl" // Required by Tessellation.hlsl
        	#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Tessellation.hlsl"
            #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Texture.hlsl"
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderVariables.hlsl"
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/ShaderPass/ShaderPass.cs.hlsl"
            #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/TextureStack.hlsl" // Required to be include before we include properties as it define DECLARE_STACK_CB
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderGraphHeader.hlsl" // Need to be here for Gradient struct definition
        
            // --------------------------------------------------
            // Defines
        
            // Attribute
            #define ATTRIBUTES_NEED_NORMAL
            #define ATTRIBUTES_NEED_TANGENT
            #define VARYINGS_NEED_POSITION_WS
            #define VARYINGS_NEED_TANGENT_TO_WORLD
        
            #define HAVE_MESH_MODIFICATION
        
            //Strip down the FragInputs.hlsl (on graphics), so we can only optimize the interpolators we use.
            //if by accident something requests contents of FragInputs.hlsl, it will be caught as a compiler error
            //Frag inputs stripping is only enabled when FRAG_INPUTS_ENABLE_STRIPPING is set
            #if !defined(SHADER_STAGE_RAY_TRACING) && SHADERPASS != SHADERPASS_RAYTRACING_GBUFFER && SHADERPASS != SHADERPASS_FULL_SCREEN_DEBUG
            #define FRAG_INPUTS_ENABLE_STRIPPING
            #endif
        
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/ShaderPass/FragInputs.hlsl"
        
        
        
            #define SHADERPASS SHADERPASS_DEPTH_ONLY
        #define REQUIRE_DEPTH_TEXTURE
        
        
            // Following two define are a workaround introduce in 10.1.x for RaytracingQualityNode
            // The ShaderGraph don't support correctly migration of this node as it serialize all the node data
            // in the json file making it impossible to uprgrade. Until we get a fix, we do a workaround here
            // to still allow us to rename the field and keyword of this node without breaking existing code.
            #ifdef RAYTRACING_SHADER_GRAPH_DEFAULT
            #define RAYTRACING_SHADER_GRAPH_HIGH
            #endif
        
            #ifdef RAYTRACING_SHADER_GRAPH_RAYTRACED
            #define RAYTRACING_SHADER_GRAPH_LOW
            #endif
            // end
        
            #ifndef SHADER_UNLIT
            // We need isFrontFace when using double sided - it is not required for unlit as in case of unlit double sided only drive the cullmode
            // VARYINGS_NEED_CULLFACE can be define by VaryingsMeshToPS.FaceSign input if a IsFrontFace Node is included in the shader graph.
            #if defined(_DOUBLESIDED_ON) && !defined(VARYINGS_NEED_CULLFACE)
                #define VARYINGS_NEED_CULLFACE
            #endif
            #endif
        
            // Specific Material Define
        // Setup a define to say we are an unlit shader
        #define SHADER_UNLIT
        
        // Following Macro are only used by Unlit material
        #if defined(_ENABLE_SHADOW_MATTE) && (SHADERPASS == SHADERPASS_FORWARD_UNLIT || SHADERPASS == SHADERPASS_PATH_TRACING)
        #define LIGHTLOOP_DISABLE_TILE_AND_CLUSTER
        #define HAS_LIGHTLOOP
        #endif
            // Caution: we can use the define SHADER_UNLIT onlit after the above Material include as it is the Unlit template who define it
        
            // To handle SSR on transparent correctly with a possibility to enable/disable it per framesettings
            // we should have a code like this:
            // if !defined(_DISABLE_SSR_TRANSPARENT)
            // pragma multi_compile _ WRITE_NORMAL_BUFFER
            // endif
            // i.e we enable the multicompile only if we can receive SSR or not, and then C# code drive
            // it based on if SSR transparent in frame settings and not (and stripper can strip it).
            // this is currently not possible with our current preprocessor as _DISABLE_SSR_TRANSPARENT is a keyword not a define
            // so instead we used this and chose to pay the extra cost of normal write even if SSR transaprent is disabled.
            // Ideally the shader graph generator should handle it but condition below can't be handle correctly for now.
            #if SHADERPASS == SHADERPASS_TRANSPARENT_DEPTH_PREPASS
            #if !defined(_DISABLE_SSR_TRANSPARENT) && !defined(SHADER_UNLIT)
                #define WRITE_NORMAL_BUFFER
            #endif
            #endif
        
            #ifndef DEBUG_DISPLAY
                // In case of opaque we don't want to perform the alpha test, it is done in depth prepass and we use depth equal for ztest (setup from UI)
                // Don't do it with debug display mode as it is possible there is no depth prepass in this case
                #if !defined(_SURFACE_TYPE_TRANSPARENT)
                    #if SHADERPASS == SHADERPASS_FORWARD
                    #define SHADERPASS_FORWARD_BYPASS_ALPHA_TEST
                    #elif SHADERPASS == SHADERPASS_GBUFFER
                    #define SHADERPASS_GBUFFER_BYPASS_ALPHA_TEST
                    #endif
                #endif
            #endif
        
            // Define _DEFERRED_CAPABLE_MATERIAL for shader capable to run in deferred pass
            #if defined(SHADER_LIT) && !defined(_SURFACE_TYPE_TRANSPARENT)
                #define _DEFERRED_CAPABLE_MATERIAL
            #endif
        
            // Translate transparent motion vector define
            #if defined(_TRANSPARENT_WRITES_MOTION_VEC) && defined(_SURFACE_TYPE_TRANSPARENT)
                #define _WRITE_TRANSPARENT_MOTION_VECTOR
            #endif
        
            // -- Graph Properties
            CBUFFER_START(UnityPerMaterial)
        float4 _Rotate_Projection;
        float _Noise_Scale;
        float _Speed;
        float _Vertexoffset;
        float4 _Remap_xy_zw;
        float4 _Color_Peak;
        float4 _Color_Valley;
        float _SmoothEdge1;
        float _SmoothEdge2;
        float _Cloud_Pow;
        float _Base_Scale;
        float _Base_Speed;
        float _BaseStrength;
        float _Emission_Strength;
        float _Curvate_Radius;
        float _Fresnel_Power;
        float _Fresnel_Opacity;
        float _Depth_Fade;
        float4 _EmissionColor;
        float _UseShadowThreshold;
        float4 _DoubleSidedConstants;
        float _BlendMode;
        float _EnableBlendModePreserveSpecularLighting;
        CBUFFER_END
        
        // Object and Global properties
        
            // -- Property used by ScenePickingPass
            #ifdef SCENEPICKINGPASS
            float4 _SelectionID;
            #endif
        
            // -- Properties used by SceneSelectionPass
            #ifdef SCENESELECTIONPASS
            int _ObjectId;
            int _PassValue;
            #endif
        
            // Includes
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/Debug/DebugDisplay.hlsl"
        #include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Material.hlsl"
        #include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Unlit/Unlit.hlsl"
        #include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/BuiltinUtilities.hlsl"
        #include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/MaterialUtilities.hlsl"
        #include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderGraphFunctions.hlsl"
        	// GraphIncludes: <None>
        
            // --------------------------------------------------
            // Structs and Packing
        
            struct AttributesMesh
        {
             float3 positionOS : POSITION;
             float3 normalOS : NORMAL;
             float4 tangentOS : TANGENT;
            #if UNITY_ANY_INSTANCING_ENABLED
             uint instanceID : INSTANCEID_SEMANTIC;
            #endif
        };
        struct VaryingsMeshToPS
        {
            SV_POSITION_QUALIFIERS float4 positionCS : SV_POSITION;
             float3 positionRWS;
             float3 normalWS;
             float4 tangentWS;
            #if UNITY_ANY_INSTANCING_ENABLED
             uint instanceID : CUSTOM_INSTANCE_ID;
            #endif
        };
        struct VertexDescriptionInputs
        {
             float3 ObjectSpaceNormal;
             float3 ObjectSpaceTangent;
             float3 ObjectSpacePosition;
             float3 TimeParameters;
        };
        struct SurfaceDescriptionInputs
        {
             float3 WorldSpaceNormal;
             float3 WorldSpaceViewDirection;
             float3 ObjectSpacePosition;
             float3 WorldSpacePosition;
             float4 ScreenPosition;
             float3 TimeParameters;
        };
        struct PackedVaryingsMeshToPS
        {
            SV_POSITION_QUALIFIERS float4 positionCS : SV_POSITION;
             float3 interp0 : INTERP0;
             float3 interp1 : INTERP1;
             float4 interp2 : INTERP2;
            #if UNITY_ANY_INSTANCING_ENABLED
             uint instanceID : CUSTOM_INSTANCE_ID;
            #endif
        };
        
            PackedVaryingsMeshToPS PackVaryingsMeshToPS (VaryingsMeshToPS input)
        {
            PackedVaryingsMeshToPS output;
            ZERO_INITIALIZE(PackedVaryingsMeshToPS, output);
            output.positionCS = input.positionCS;
            output.interp0.xyz =  input.positionRWS;
            output.interp1.xyz =  input.normalWS;
            output.interp2.xyzw =  input.tangentWS;
            #if UNITY_ANY_INSTANCING_ENABLED
            output.instanceID = input.instanceID;
            #endif
            return output;
        }
        
        VaryingsMeshToPS UnpackVaryingsMeshToPS (PackedVaryingsMeshToPS input)
        {
            VaryingsMeshToPS output;
            output.positionCS = input.positionCS;
            output.positionRWS = input.interp0.xyz;
            output.normalWS = input.interp1.xyz;
            output.tangentWS = input.interp2.xyzw;
            #if UNITY_ANY_INSTANCING_ENABLED
            output.instanceID = input.instanceID;
            #endif
            return output;
        }
        
        
            // --------------------------------------------------
            // Graph
        
        
            // Graph Functions
            
        void Unity_Distance_float3(float3 A, float3 B, out float Out)
        {
            Out = distance(A, B);
        }
        
        void Unity_Divide_float(float A, float B, out float Out)
        {
            Out = A / B;
        }
        
        void Unity_Power_float(float A, float B, out float Out)
        {
            Out = pow(A, B);
        }
        
        void Unity_Multiply_float3_float3(float3 A, float3 B, out float3 Out)
        {
            Out = A * B;
        }
        
        void Unity_Rotate_About_Axis_Radians_float(float3 In, float3 Axis, float Rotation, out float3 Out)
        {
            float s = sin(Rotation);
            float c = cos(Rotation);
            float one_minus_c = 1.0 - c;
        
            Axis = normalize(Axis);
        
            float3x3 rot_mat = { one_minus_c * Axis.x * Axis.x + c,            one_minus_c * Axis.x * Axis.y - Axis.z * s,     one_minus_c * Axis.z * Axis.x + Axis.y * s,
                                      one_minus_c * Axis.x * Axis.y + Axis.z * s,   one_minus_c * Axis.y * Axis.y + c,              one_minus_c * Axis.y * Axis.z - Axis.x * s,
                                      one_minus_c * Axis.z * Axis.x - Axis.y * s,   one_minus_c * Axis.y * Axis.z + Axis.x * s,     one_minus_c * Axis.z * Axis.z + c
                                    };
        
            Out = mul(rot_mat,  In);
        }
        
        void Unity_Multiply_float_float(float A, float B, out float Out)
        {
            Out = A * B;
        }
        
        void Unity_TilingAndOffset_float(float2 UV, float2 Tiling, float2 Offset, out float2 Out)
        {
            Out = UV * Tiling + Offset;
        }
        
        
        float2 Unity_GradientNoise_Dir_float(float2 p)
        {
            // Permutation and hashing used in webgl-nosie goo.gl/pX7HtC
            p = p % 289;
            // need full precision, otherwise half overflows when p > 1
            float x = float(34 * p.x + 1) * p.x % 289 + p.y;
            x = (34 * x + 1) * x % 289;
            x = frac(x / 41) * 2 - 1;
            return normalize(float2(x - floor(x + 0.5), abs(x) - 0.5));
        }
        
        void Unity_GradientNoise_float(float2 UV, float Scale, out float Out)
        {
            float2 p = UV * Scale;
            float2 ip = floor(p);
            float2 fp = frac(p);
            float d00 = dot(Unity_GradientNoise_Dir_float(ip), fp);
            float d01 = dot(Unity_GradientNoise_Dir_float(ip + float2(0, 1)), fp - float2(0, 1));
            float d10 = dot(Unity_GradientNoise_Dir_float(ip + float2(1, 0)), fp - float2(1, 0));
            float d11 = dot(Unity_GradientNoise_Dir_float(ip + float2(1, 1)), fp - float2(1, 1));
            fp = fp * fp * fp * (fp * (fp * 6 - 15) + 10);
            Out = lerp(lerp(d00, d01, fp.y), lerp(d10, d11, fp.y), fp.x) + 0.5;
        }
        
        void Unity_Add_float(float A, float B, out float Out)
        {
            Out = A + B;
        }
        
        void Unity_Saturate_float(float In, out float Out)
        {
            Out = saturate(In);
        }
        
        void Unity_Combine_float(float R, float G, float B, float A, out float4 RGBA, out float3 RGB, out float2 RG)
        {
            RGBA = float4(R, G, B, A);
            RGB = float3(R, G, B);
            RG = float2(R, G);
        }
        
        void Unity_Remap_float(float In, float2 InMinMax, float2 OutMinMax, out float Out)
        {
            Out = OutMinMax.x + (In - InMinMax.x) * (OutMinMax.y - OutMinMax.x) / (InMinMax.y - InMinMax.x);
        }
        
        void Unity_Absolute_float(float In, out float Out)
        {
            Out = abs(In);
        }
        
        void Unity_Smoothstep_float(float Edge1, float Edge2, float In, out float Out)
        {
            Out = smoothstep(Edge1, Edge2, In);
        }
        
        void Unity_Add_float3(float3 A, float3 B, out float3 Out)
        {
            Out = A + B;
        }
        
        void Unity_FresnelEffect_float(float3 Normal, float3 ViewDir, float Power, out float Out)
        {
            Out = pow((1.0 - saturate(dot(normalize(Normal), normalize(ViewDir)))), Power);
        }
        
        void Unity_Lerp_float4(float4 A, float4 B, float4 T, out float4 Out)
        {
            Out = lerp(A, B, T);
        }
        
        void Unity_Add_float4(float4 A, float4 B, out float4 Out)
        {
            Out = A + B;
        }
        
        void Unity_Multiply_float4_float4(float4 A, float4 B, out float4 Out)
        {
            Out = A * B;
        }
        
        void Unity_SceneDepth_Eye_float(float4 UV, out float Out)
        {
            if (unity_OrthoParams.w == 1.0)
            {
                Out = LinearEyeDepth(ComputeWorldSpacePosition(UV.xy, SHADERGRAPH_SAMPLE_SCENE_DEPTH(UV.xy), UNITY_MATRIX_I_VP), UNITY_MATRIX_V);
            }
            else
            {
                Out = LinearEyeDepth(SHADERGRAPH_SAMPLE_SCENE_DEPTH(UV.xy), _ZBufferParams);
            }
        }
        
        void Unity_Subtract_float(float A, float B, out float Out)
        {
            Out = A - B;
        }
        
            // Graph Vertex
            struct VertexDescription
        {
            float3 Position;
            float3 Normal;
            float3 Tangent;
        };
        
        VertexDescription VertexDescriptionFunction(VertexDescriptionInputs IN)
        {
            VertexDescription description = (VertexDescription)0;
            float _Distance_389dd396e31949b9a8a01d35896316a6_Out_2;
            Unity_Distance_float3(SHADERGRAPH_OBJECT_POSITION, IN.ObjectSpacePosition, _Distance_389dd396e31949b9a8a01d35896316a6_Out_2);
            float _Property_d58669debb0246fe82fb0fb0bffa2edc_Out_0 = _Curvate_Radius;
            float _Divide_0b143990dbbc4cbdb5129fcbf5511012_Out_2;
            Unity_Divide_float(_Distance_389dd396e31949b9a8a01d35896316a6_Out_2, _Property_d58669debb0246fe82fb0fb0bffa2edc_Out_0, _Divide_0b143990dbbc4cbdb5129fcbf5511012_Out_2);
            float _Power_89ab1e29e2cb42a9acd2aed36f4fdcfe_Out_2;
            Unity_Power_float(_Divide_0b143990dbbc4cbdb5129fcbf5511012_Out_2, 2, _Power_89ab1e29e2cb42a9acd2aed36f4fdcfe_Out_2);
            float3 _Multiply_22e187ffacc7402bbe63087272b7efb5_Out_2;
            Unity_Multiply_float3_float3(IN.ObjectSpaceNormal, (_Power_89ab1e29e2cb42a9acd2aed36f4fdcfe_Out_2.xxx), _Multiply_22e187ffacc7402bbe63087272b7efb5_Out_2);
            float _Property_7d8e49b5efe94dea8210c34a6319b1ef_Out_0 = _SmoothEdge1;
            float _Property_09307b889e8945078bacabda50cca5c6_Out_0 = _SmoothEdge2;
            float4 _Property_a8d53d7ea07349e0979b956475bdd7cc_Out_0 = _Rotate_Projection;
            float _Split_7d12b2bb5feb46d685603473d0cf5818_R_1 = _Property_a8d53d7ea07349e0979b956475bdd7cc_Out_0[0];
            float _Split_7d12b2bb5feb46d685603473d0cf5818_G_2 = _Property_a8d53d7ea07349e0979b956475bdd7cc_Out_0[1];
            float _Split_7d12b2bb5feb46d685603473d0cf5818_B_3 = _Property_a8d53d7ea07349e0979b956475bdd7cc_Out_0[2];
            float _Split_7d12b2bb5feb46d685603473d0cf5818_A_4 = _Property_a8d53d7ea07349e0979b956475bdd7cc_Out_0[3];
            float3 _RotateAboutAxis_1b91481bceed4e9a82a13975af123b02_Out_3;
            Unity_Rotate_About_Axis_Radians_float(IN.ObjectSpacePosition, (_Property_a8d53d7ea07349e0979b956475bdd7cc_Out_0.xyz), _Split_7d12b2bb5feb46d685603473d0cf5818_A_4, _RotateAboutAxis_1b91481bceed4e9a82a13975af123b02_Out_3);
            float _Property_258f4645340c46f69274c9f077f1a73c_Out_0 = _Speed;
            float _Multiply_94f6d857831c4e69b53b9bfc92dd852f_Out_2;
            Unity_Multiply_float_float(IN.TimeParameters.x, _Property_258f4645340c46f69274c9f077f1a73c_Out_0, _Multiply_94f6d857831c4e69b53b9bfc92dd852f_Out_2);
            float2 _TilingAndOffset_6cb9fd57231c4a429c9c0fe5aeb7cc58_Out_3;
            Unity_TilingAndOffset_float((_RotateAboutAxis_1b91481bceed4e9a82a13975af123b02_Out_3.xy), float2 (1, 1), (_Multiply_94f6d857831c4e69b53b9bfc92dd852f_Out_2.xx), _TilingAndOffset_6cb9fd57231c4a429c9c0fe5aeb7cc58_Out_3);
            float _Property_2b9001a870d04f8eb60f5d7e1ce909c5_Out_0 = _Noise_Scale;
            float _GradientNoise_061679506b214bb8b4792ec4dfe82ec6_Out_2;
            Unity_GradientNoise_float(_TilingAndOffset_6cb9fd57231c4a429c9c0fe5aeb7cc58_Out_3, _Property_2b9001a870d04f8eb60f5d7e1ce909c5_Out_0, _GradientNoise_061679506b214bb8b4792ec4dfe82ec6_Out_2);
            float2 _TilingAndOffset_1d2491b5855e49d3b2e6b5dbe5db07d4_Out_3;
            Unity_TilingAndOffset_float((_RotateAboutAxis_1b91481bceed4e9a82a13975af123b02_Out_3.xy), float2 (1, 1), float2 (0, 0), _TilingAndOffset_1d2491b5855e49d3b2e6b5dbe5db07d4_Out_3);
            float _GradientNoise_8a27c3fb323f4db1b38f287380605198_Out_2;
            Unity_GradientNoise_float(_TilingAndOffset_1d2491b5855e49d3b2e6b5dbe5db07d4_Out_3, _Property_2b9001a870d04f8eb60f5d7e1ce909c5_Out_0, _GradientNoise_8a27c3fb323f4db1b38f287380605198_Out_2);
            float _Add_a6dd2d6e3f564decbca34ec03a419130_Out_2;
            Unity_Add_float(_GradientNoise_061679506b214bb8b4792ec4dfe82ec6_Out_2, _GradientNoise_8a27c3fb323f4db1b38f287380605198_Out_2, _Add_a6dd2d6e3f564decbca34ec03a419130_Out_2);
            float _Divide_a757ea7167f343ecaec30e69b58c9bae_Out_2;
            Unity_Divide_float(_Add_a6dd2d6e3f564decbca34ec03a419130_Out_2, 2, _Divide_a757ea7167f343ecaec30e69b58c9bae_Out_2);
            float _Saturate_f355ba5a467f4488b7ec89e8a08484a3_Out_1;
            Unity_Saturate_float(_Divide_a757ea7167f343ecaec30e69b58c9bae_Out_2, _Saturate_f355ba5a467f4488b7ec89e8a08484a3_Out_1);
            float _Property_96da655cc17e4594836aa02d74efe33c_Out_0 = _Cloud_Pow;
            float _Power_318bede735044ec6811f2a5c345b7d73_Out_2;
            Unity_Power_float(_Saturate_f355ba5a467f4488b7ec89e8a08484a3_Out_1, _Property_96da655cc17e4594836aa02d74efe33c_Out_0, _Power_318bede735044ec6811f2a5c345b7d73_Out_2);
            float4 _Property_317e8becc0724841a13cbcf8d4c4efbc_Out_0 = _Remap_xy_zw;
            float _Split_3dee68ff9a374966b7612da59c6ac20a_R_1 = _Property_317e8becc0724841a13cbcf8d4c4efbc_Out_0[0];
            float _Split_3dee68ff9a374966b7612da59c6ac20a_G_2 = _Property_317e8becc0724841a13cbcf8d4c4efbc_Out_0[1];
            float _Split_3dee68ff9a374966b7612da59c6ac20a_B_3 = _Property_317e8becc0724841a13cbcf8d4c4efbc_Out_0[2];
            float _Split_3dee68ff9a374966b7612da59c6ac20a_A_4 = _Property_317e8becc0724841a13cbcf8d4c4efbc_Out_0[3];
            float4 _Combine_4e3ec9a6e4064091bba919631e732b7a_RGBA_4;
            float3 _Combine_4e3ec9a6e4064091bba919631e732b7a_RGB_5;
            float2 _Combine_4e3ec9a6e4064091bba919631e732b7a_RG_6;
            Unity_Combine_float(_Split_3dee68ff9a374966b7612da59c6ac20a_R_1, _Split_3dee68ff9a374966b7612da59c6ac20a_G_2, 0, 0, _Combine_4e3ec9a6e4064091bba919631e732b7a_RGBA_4, _Combine_4e3ec9a6e4064091bba919631e732b7a_RGB_5, _Combine_4e3ec9a6e4064091bba919631e732b7a_RG_6);
            float4 _Combine_6f976751f1234c77908b163e59da18bb_RGBA_4;
            float3 _Combine_6f976751f1234c77908b163e59da18bb_RGB_5;
            float2 _Combine_6f976751f1234c77908b163e59da18bb_RG_6;
            Unity_Combine_float(_Split_3dee68ff9a374966b7612da59c6ac20a_B_3, _Split_3dee68ff9a374966b7612da59c6ac20a_A_4, 0, 0, _Combine_6f976751f1234c77908b163e59da18bb_RGBA_4, _Combine_6f976751f1234c77908b163e59da18bb_RGB_5, _Combine_6f976751f1234c77908b163e59da18bb_RG_6);
            float _Remap_a11bf825d8d54f198c2355e6d3cc1fba_Out_3;
            Unity_Remap_float(_Power_318bede735044ec6811f2a5c345b7d73_Out_2, _Combine_4e3ec9a6e4064091bba919631e732b7a_RG_6, _Combine_6f976751f1234c77908b163e59da18bb_RG_6, _Remap_a11bf825d8d54f198c2355e6d3cc1fba_Out_3);
            float _Absolute_553a57701af34a45a18ca7b2af677c8a_Out_1;
            Unity_Absolute_float(_Remap_a11bf825d8d54f198c2355e6d3cc1fba_Out_3, _Absolute_553a57701af34a45a18ca7b2af677c8a_Out_1);
            float _Smoothstep_6babd4aa745b40db842b941b96adf7e9_Out_3;
            Unity_Smoothstep_float(_Property_7d8e49b5efe94dea8210c34a6319b1ef_Out_0, _Property_09307b889e8945078bacabda50cca5c6_Out_0, _Absolute_553a57701af34a45a18ca7b2af677c8a_Out_1, _Smoothstep_6babd4aa745b40db842b941b96adf7e9_Out_3);
            float _Property_17631cb6b51c44b593b4fb1f0ac8fa75_Out_0 = _Base_Speed;
            float _Multiply_2e98faddc46143bea8e48ab17d0e1c15_Out_2;
            Unity_Multiply_float_float(IN.TimeParameters.x, _Property_17631cb6b51c44b593b4fb1f0ac8fa75_Out_0, _Multiply_2e98faddc46143bea8e48ab17d0e1c15_Out_2);
            float2 _TilingAndOffset_d8c83d87b12649f7b6a3902973c4457a_Out_3;
            Unity_TilingAndOffset_float((_RotateAboutAxis_1b91481bceed4e9a82a13975af123b02_Out_3.xy), float2 (1, 1), (_Multiply_2e98faddc46143bea8e48ab17d0e1c15_Out_2.xx), _TilingAndOffset_d8c83d87b12649f7b6a3902973c4457a_Out_3);
            float _Property_2792df33a4d44e20b2f71fe244d5f369_Out_0 = _Base_Scale;
            float _GradientNoise_702d412fe90e4c64b91e9defbe1ffff2_Out_2;
            Unity_GradientNoise_float(_TilingAndOffset_d8c83d87b12649f7b6a3902973c4457a_Out_3, _Property_2792df33a4d44e20b2f71fe244d5f369_Out_0, _GradientNoise_702d412fe90e4c64b91e9defbe1ffff2_Out_2);
            float _Property_a965b78b3be84255ae4ff1617bd2df01_Out_0 = _BaseStrength;
            float _Multiply_9880df30952a454781c1f0c8356100dd_Out_2;
            Unity_Multiply_float_float(_GradientNoise_702d412fe90e4c64b91e9defbe1ffff2_Out_2, _Property_a965b78b3be84255ae4ff1617bd2df01_Out_0, _Multiply_9880df30952a454781c1f0c8356100dd_Out_2);
            float _Add_98d9cdbb65e44e0282692d35bd9d237b_Out_2;
            Unity_Add_float(_Smoothstep_6babd4aa745b40db842b941b96adf7e9_Out_3, _Multiply_9880df30952a454781c1f0c8356100dd_Out_2, _Add_98d9cdbb65e44e0282692d35bd9d237b_Out_2);
            float _Add_d305fd085a9b459da3d4bd5108430b3f_Out_2;
            Unity_Add_float(1, _Property_a965b78b3be84255ae4ff1617bd2df01_Out_0, _Add_d305fd085a9b459da3d4bd5108430b3f_Out_2);
            float _Divide_55db7b7a0b8b481d83fb512a13a2dba6_Out_2;
            Unity_Divide_float(_Add_98d9cdbb65e44e0282692d35bd9d237b_Out_2, _Add_d305fd085a9b459da3d4bd5108430b3f_Out_2, _Divide_55db7b7a0b8b481d83fb512a13a2dba6_Out_2);
            float3 _Multiply_639bbd01ca0947fdbb4245744090b06e_Out_2;
            Unity_Multiply_float3_float3(IN.ObjectSpaceNormal, (_Divide_55db7b7a0b8b481d83fb512a13a2dba6_Out_2.xxx), _Multiply_639bbd01ca0947fdbb4245744090b06e_Out_2);
            float _Property_8b198d3112494fb98defdd5dc1b13601_Out_0 = _Vertexoffset;
            float3 _Multiply_2119a238e1d14c34879c4926fe468be5_Out_2;
            Unity_Multiply_float3_float3(_Multiply_639bbd01ca0947fdbb4245744090b06e_Out_2, (_Property_8b198d3112494fb98defdd5dc1b13601_Out_0.xxx), _Multiply_2119a238e1d14c34879c4926fe468be5_Out_2);
            float3 _Add_18a07d3e52a847f594f01810747a3393_Out_2;
            Unity_Add_float3(IN.ObjectSpacePosition, _Multiply_2119a238e1d14c34879c4926fe468be5_Out_2, _Add_18a07d3e52a847f594f01810747a3393_Out_2);
            float3 _Add_b9cf96b2dcd84792b2e40dd036537586_Out_2;
            Unity_Add_float3(_Multiply_22e187ffacc7402bbe63087272b7efb5_Out_2, _Add_18a07d3e52a847f594f01810747a3393_Out_2, _Add_b9cf96b2dcd84792b2e40dd036537586_Out_2);
            description.Position = _Add_b9cf96b2dcd84792b2e40dd036537586_Out_2;
            description.Normal = IN.ObjectSpaceNormal;
            description.Tangent = IN.ObjectSpaceTangent;
            return description;
        }
        
            // Graph Pixel
            struct SurfaceDescription
        {
            float3 BaseColor;
            float3 Emission;
            float Alpha;
        };
        
        SurfaceDescription SurfaceDescriptionFunction(SurfaceDescriptionInputs IN)
        {
            SurfaceDescription surface = (SurfaceDescription)0;
            float _Property_7d8e49b5efe94dea8210c34a6319b1ef_Out_0 = _SmoothEdge1;
            float _Property_09307b889e8945078bacabda50cca5c6_Out_0 = _SmoothEdge2;
            float4 _Property_a8d53d7ea07349e0979b956475bdd7cc_Out_0 = _Rotate_Projection;
            float _Split_7d12b2bb5feb46d685603473d0cf5818_R_1 = _Property_a8d53d7ea07349e0979b956475bdd7cc_Out_0[0];
            float _Split_7d12b2bb5feb46d685603473d0cf5818_G_2 = _Property_a8d53d7ea07349e0979b956475bdd7cc_Out_0[1];
            float _Split_7d12b2bb5feb46d685603473d0cf5818_B_3 = _Property_a8d53d7ea07349e0979b956475bdd7cc_Out_0[2];
            float _Split_7d12b2bb5feb46d685603473d0cf5818_A_4 = _Property_a8d53d7ea07349e0979b956475bdd7cc_Out_0[3];
            float3 _RotateAboutAxis_1b91481bceed4e9a82a13975af123b02_Out_3;
            Unity_Rotate_About_Axis_Radians_float(IN.ObjectSpacePosition, (_Property_a8d53d7ea07349e0979b956475bdd7cc_Out_0.xyz), _Split_7d12b2bb5feb46d685603473d0cf5818_A_4, _RotateAboutAxis_1b91481bceed4e9a82a13975af123b02_Out_3);
            float _Property_258f4645340c46f69274c9f077f1a73c_Out_0 = _Speed;
            float _Multiply_94f6d857831c4e69b53b9bfc92dd852f_Out_2;
            Unity_Multiply_float_float(IN.TimeParameters.x, _Property_258f4645340c46f69274c9f077f1a73c_Out_0, _Multiply_94f6d857831c4e69b53b9bfc92dd852f_Out_2);
            float2 _TilingAndOffset_6cb9fd57231c4a429c9c0fe5aeb7cc58_Out_3;
            Unity_TilingAndOffset_float((_RotateAboutAxis_1b91481bceed4e9a82a13975af123b02_Out_3.xy), float2 (1, 1), (_Multiply_94f6d857831c4e69b53b9bfc92dd852f_Out_2.xx), _TilingAndOffset_6cb9fd57231c4a429c9c0fe5aeb7cc58_Out_3);
            float _Property_2b9001a870d04f8eb60f5d7e1ce909c5_Out_0 = _Noise_Scale;
            float _GradientNoise_061679506b214bb8b4792ec4dfe82ec6_Out_2;
            Unity_GradientNoise_float(_TilingAndOffset_6cb9fd57231c4a429c9c0fe5aeb7cc58_Out_3, _Property_2b9001a870d04f8eb60f5d7e1ce909c5_Out_0, _GradientNoise_061679506b214bb8b4792ec4dfe82ec6_Out_2);
            float2 _TilingAndOffset_1d2491b5855e49d3b2e6b5dbe5db07d4_Out_3;
            Unity_TilingAndOffset_float((_RotateAboutAxis_1b91481bceed4e9a82a13975af123b02_Out_3.xy), float2 (1, 1), float2 (0, 0), _TilingAndOffset_1d2491b5855e49d3b2e6b5dbe5db07d4_Out_3);
            float _GradientNoise_8a27c3fb323f4db1b38f287380605198_Out_2;
            Unity_GradientNoise_float(_TilingAndOffset_1d2491b5855e49d3b2e6b5dbe5db07d4_Out_3, _Property_2b9001a870d04f8eb60f5d7e1ce909c5_Out_0, _GradientNoise_8a27c3fb323f4db1b38f287380605198_Out_2);
            float _Add_a6dd2d6e3f564decbca34ec03a419130_Out_2;
            Unity_Add_float(_GradientNoise_061679506b214bb8b4792ec4dfe82ec6_Out_2, _GradientNoise_8a27c3fb323f4db1b38f287380605198_Out_2, _Add_a6dd2d6e3f564decbca34ec03a419130_Out_2);
            float _Divide_a757ea7167f343ecaec30e69b58c9bae_Out_2;
            Unity_Divide_float(_Add_a6dd2d6e3f564decbca34ec03a419130_Out_2, 2, _Divide_a757ea7167f343ecaec30e69b58c9bae_Out_2);
            float _Saturate_f355ba5a467f4488b7ec89e8a08484a3_Out_1;
            Unity_Saturate_float(_Divide_a757ea7167f343ecaec30e69b58c9bae_Out_2, _Saturate_f355ba5a467f4488b7ec89e8a08484a3_Out_1);
            float _Property_96da655cc17e4594836aa02d74efe33c_Out_0 = _Cloud_Pow;
            float _Power_318bede735044ec6811f2a5c345b7d73_Out_2;
            Unity_Power_float(_Saturate_f355ba5a467f4488b7ec89e8a08484a3_Out_1, _Property_96da655cc17e4594836aa02d74efe33c_Out_0, _Power_318bede735044ec6811f2a5c345b7d73_Out_2);
            float4 _Property_317e8becc0724841a13cbcf8d4c4efbc_Out_0 = _Remap_xy_zw;
            float _Split_3dee68ff9a374966b7612da59c6ac20a_R_1 = _Property_317e8becc0724841a13cbcf8d4c4efbc_Out_0[0];
            float _Split_3dee68ff9a374966b7612da59c6ac20a_G_2 = _Property_317e8becc0724841a13cbcf8d4c4efbc_Out_0[1];
            float _Split_3dee68ff9a374966b7612da59c6ac20a_B_3 = _Property_317e8becc0724841a13cbcf8d4c4efbc_Out_0[2];
            float _Split_3dee68ff9a374966b7612da59c6ac20a_A_4 = _Property_317e8becc0724841a13cbcf8d4c4efbc_Out_0[3];
            float4 _Combine_4e3ec9a6e4064091bba919631e732b7a_RGBA_4;
            float3 _Combine_4e3ec9a6e4064091bba919631e732b7a_RGB_5;
            float2 _Combine_4e3ec9a6e4064091bba919631e732b7a_RG_6;
            Unity_Combine_float(_Split_3dee68ff9a374966b7612da59c6ac20a_R_1, _Split_3dee68ff9a374966b7612da59c6ac20a_G_2, 0, 0, _Combine_4e3ec9a6e4064091bba919631e732b7a_RGBA_4, _Combine_4e3ec9a6e4064091bba919631e732b7a_RGB_5, _Combine_4e3ec9a6e4064091bba919631e732b7a_RG_6);
            float4 _Combine_6f976751f1234c77908b163e59da18bb_RGBA_4;
            float3 _Combine_6f976751f1234c77908b163e59da18bb_RGB_5;
            float2 _Combine_6f976751f1234c77908b163e59da18bb_RG_6;
            Unity_Combine_float(_Split_3dee68ff9a374966b7612da59c6ac20a_B_3, _Split_3dee68ff9a374966b7612da59c6ac20a_A_4, 0, 0, _Combine_6f976751f1234c77908b163e59da18bb_RGBA_4, _Combine_6f976751f1234c77908b163e59da18bb_RGB_5, _Combine_6f976751f1234c77908b163e59da18bb_RG_6);
            float _Remap_a11bf825d8d54f198c2355e6d3cc1fba_Out_3;
            Unity_Remap_float(_Power_318bede735044ec6811f2a5c345b7d73_Out_2, _Combine_4e3ec9a6e4064091bba919631e732b7a_RG_6, _Combine_6f976751f1234c77908b163e59da18bb_RG_6, _Remap_a11bf825d8d54f198c2355e6d3cc1fba_Out_3);
            float _Absolute_553a57701af34a45a18ca7b2af677c8a_Out_1;
            Unity_Absolute_float(_Remap_a11bf825d8d54f198c2355e6d3cc1fba_Out_3, _Absolute_553a57701af34a45a18ca7b2af677c8a_Out_1);
            float _Smoothstep_6babd4aa745b40db842b941b96adf7e9_Out_3;
            Unity_Smoothstep_float(_Property_7d8e49b5efe94dea8210c34a6319b1ef_Out_0, _Property_09307b889e8945078bacabda50cca5c6_Out_0, _Absolute_553a57701af34a45a18ca7b2af677c8a_Out_1, _Smoothstep_6babd4aa745b40db842b941b96adf7e9_Out_3);
            float _Property_17631cb6b51c44b593b4fb1f0ac8fa75_Out_0 = _Base_Speed;
            float _Multiply_2e98faddc46143bea8e48ab17d0e1c15_Out_2;
            Unity_Multiply_float_float(IN.TimeParameters.x, _Property_17631cb6b51c44b593b4fb1f0ac8fa75_Out_0, _Multiply_2e98faddc46143bea8e48ab17d0e1c15_Out_2);
            float2 _TilingAndOffset_d8c83d87b12649f7b6a3902973c4457a_Out_3;
            Unity_TilingAndOffset_float((_RotateAboutAxis_1b91481bceed4e9a82a13975af123b02_Out_3.xy), float2 (1, 1), (_Multiply_2e98faddc46143bea8e48ab17d0e1c15_Out_2.xx), _TilingAndOffset_d8c83d87b12649f7b6a3902973c4457a_Out_3);
            float _Property_2792df33a4d44e20b2f71fe244d5f369_Out_0 = _Base_Scale;
            float _GradientNoise_702d412fe90e4c64b91e9defbe1ffff2_Out_2;
            Unity_GradientNoise_float(_TilingAndOffset_d8c83d87b12649f7b6a3902973c4457a_Out_3, _Property_2792df33a4d44e20b2f71fe244d5f369_Out_0, _GradientNoise_702d412fe90e4c64b91e9defbe1ffff2_Out_2);
            float _Property_a965b78b3be84255ae4ff1617bd2df01_Out_0 = _BaseStrength;
            float _Multiply_9880df30952a454781c1f0c8356100dd_Out_2;
            Unity_Multiply_float_float(_GradientNoise_702d412fe90e4c64b91e9defbe1ffff2_Out_2, _Property_a965b78b3be84255ae4ff1617bd2df01_Out_0, _Multiply_9880df30952a454781c1f0c8356100dd_Out_2);
            float _Add_98d9cdbb65e44e0282692d35bd9d237b_Out_2;
            Unity_Add_float(_Smoothstep_6babd4aa745b40db842b941b96adf7e9_Out_3, _Multiply_9880df30952a454781c1f0c8356100dd_Out_2, _Add_98d9cdbb65e44e0282692d35bd9d237b_Out_2);
            float _Add_d305fd085a9b459da3d4bd5108430b3f_Out_2;
            Unity_Add_float(1, _Property_a965b78b3be84255ae4ff1617bd2df01_Out_0, _Add_d305fd085a9b459da3d4bd5108430b3f_Out_2);
            float _Divide_55db7b7a0b8b481d83fb512a13a2dba6_Out_2;
            Unity_Divide_float(_Add_98d9cdbb65e44e0282692d35bd9d237b_Out_2, _Add_d305fd085a9b459da3d4bd5108430b3f_Out_2, _Divide_55db7b7a0b8b481d83fb512a13a2dba6_Out_2);
            float _Property_5a371e38a60143fcae81da7313c1bf15_Out_0 = _Fresnel_Power;
            float _FresnelEffect_4c470240dea248acb0092676d71437cb_Out_3;
            Unity_FresnelEffect_float(IN.WorldSpaceNormal, IN.WorldSpaceViewDirection, _Property_5a371e38a60143fcae81da7313c1bf15_Out_0, _FresnelEffect_4c470240dea248acb0092676d71437cb_Out_3);
            float _Multiply_384d15a2ef094b7e8b1ec6d69dada246_Out_2;
            Unity_Multiply_float_float(_Divide_55db7b7a0b8b481d83fb512a13a2dba6_Out_2, _FresnelEffect_4c470240dea248acb0092676d71437cb_Out_3, _Multiply_384d15a2ef094b7e8b1ec6d69dada246_Out_2);
            float _Property_3c23366c651c4949b03cb10c14ae0a27_Out_0 = _Fresnel_Opacity;
            float _Multiply_9380e32f6e4644e1b42e398229c18d31_Out_2;
            Unity_Multiply_float_float(_Multiply_384d15a2ef094b7e8b1ec6d69dada246_Out_2, _Property_3c23366c651c4949b03cb10c14ae0a27_Out_0, _Multiply_9380e32f6e4644e1b42e398229c18d31_Out_2);
            float4 _Property_dff39e3157cb4a09aac968677ade995d_Out_0 = _Color_Valley;
            float4 _Property_1b300af9e23e428fa893e55f9390600d_Out_0 = _Color_Peak;
            float4 _Lerp_6d0a20bb25554e1fa8697f473485e856_Out_3;
            Unity_Lerp_float4(_Property_dff39e3157cb4a09aac968677ade995d_Out_0, _Property_1b300af9e23e428fa893e55f9390600d_Out_0, (_Add_98d9cdbb65e44e0282692d35bd9d237b_Out_2.xxxx), _Lerp_6d0a20bb25554e1fa8697f473485e856_Out_3);
            float4 _Add_6507a6920d9c478888f235ad9d0bb542_Out_2;
            Unity_Add_float4((_Multiply_9380e32f6e4644e1b42e398229c18d31_Out_2.xxxx), _Lerp_6d0a20bb25554e1fa8697f473485e856_Out_3, _Add_6507a6920d9c478888f235ad9d0bb542_Out_2);
            float _Property_9cf7107417e042afb41766bb37be827b_Out_0 = _Emission_Strength;
            float4 _Multiply_31ae534c0cc640be9fda8de7cc705bbf_Out_2;
            Unity_Multiply_float4_float4(_Add_6507a6920d9c478888f235ad9d0bb542_Out_2, (_Property_9cf7107417e042afb41766bb37be827b_Out_0.xxxx), _Multiply_31ae534c0cc640be9fda8de7cc705bbf_Out_2);
            float _SceneDepth_619a7e0097894c29ba4557fde6cbb174_Out_1;
            Unity_SceneDepth_Eye_float(float4(IN.ScreenPosition.xy / IN.ScreenPosition.w, 0, 0), _SceneDepth_619a7e0097894c29ba4557fde6cbb174_Out_1);
            float4 _ScreenPosition_ee728e739f744068b0d15c1205d618a0_Out_0 = IN.ScreenPosition;
            float _Split_d5d8a30c527c46a19ab94602c057016e_R_1 = _ScreenPosition_ee728e739f744068b0d15c1205d618a0_Out_0[0];
            float _Split_d5d8a30c527c46a19ab94602c057016e_G_2 = _ScreenPosition_ee728e739f744068b0d15c1205d618a0_Out_0[1];
            float _Split_d5d8a30c527c46a19ab94602c057016e_B_3 = _ScreenPosition_ee728e739f744068b0d15c1205d618a0_Out_0[2];
            float _Split_d5d8a30c527c46a19ab94602c057016e_A_4 = _ScreenPosition_ee728e739f744068b0d15c1205d618a0_Out_0[3];
            float _Subtract_07eb78fa00d74ade84172a64a4a4616c_Out_2;
            Unity_Subtract_float(_Split_d5d8a30c527c46a19ab94602c057016e_A_4, 1, _Subtract_07eb78fa00d74ade84172a64a4a4616c_Out_2);
            float _Subtract_3ef0962257844c2c87b9ff8d165099f3_Out_2;
            Unity_Subtract_float(_SceneDepth_619a7e0097894c29ba4557fde6cbb174_Out_1, _Subtract_07eb78fa00d74ade84172a64a4a4616c_Out_2, _Subtract_3ef0962257844c2c87b9ff8d165099f3_Out_2);
            float _Property_9167e3d66076450baeb620b8f8b66552_Out_0 = _Depth_Fade;
            float _Divide_9a1ae8922923443883cbd9e71941de32_Out_2;
            Unity_Divide_float(_Subtract_3ef0962257844c2c87b9ff8d165099f3_Out_2, _Property_9167e3d66076450baeb620b8f8b66552_Out_0, _Divide_9a1ae8922923443883cbd9e71941de32_Out_2);
            float _Saturate_791ce4d2963e420ba68a97fca0bef8f9_Out_1;
            Unity_Saturate_float(_Divide_9a1ae8922923443883cbd9e71941de32_Out_2, _Saturate_791ce4d2963e420ba68a97fca0bef8f9_Out_1);
            surface.BaseColor = (_Add_6507a6920d9c478888f235ad9d0bb542_Out_2.xyz);
            surface.Emission = (_Multiply_31ae534c0cc640be9fda8de7cc705bbf_Out_2.xyz);
            surface.Alpha = _Saturate_791ce4d2963e420ba68a97fca0bef8f9_Out_1;
            return surface;
        }
        
            // --------------------------------------------------
            // Build Graph Inputs
            #ifdef HAVE_VFX_MODIFICATION
            #define VFX_SRP_ATTRIBUTES AttributesMesh
            #define VaryingsMeshType VaryingsMeshToPS
            #define VFX_SRP_VARYINGS VaryingsMeshType
            #define VFX_SRP_SURFACE_INPUTS FragInputs
            #endif
            
        VertexDescriptionInputs AttributesMeshToVertexDescriptionInputs(AttributesMesh input)
        {
            VertexDescriptionInputs output;
            ZERO_INITIALIZE(VertexDescriptionInputs, output);
        
            output.ObjectSpaceNormal =                          input.normalOS;
            output.ObjectSpaceTangent =                         input.tangentOS.xyz;
            output.ObjectSpacePosition =                        input.positionOS;
            output.TimeParameters =                             _TimeParameters.xyz; // Note: in case of animation this will be overwrite (allow to handle motion vector)
        
            return output;
        }
        
        VertexDescription GetVertexDescription(AttributesMesh input, float3 timeParameters
        #ifdef HAVE_VFX_MODIFICATION
            , AttributesElement element
        #endif
        )
        {
            // build graph inputs
            VertexDescriptionInputs vertexDescriptionInputs = AttributesMeshToVertexDescriptionInputs(input);
            // Override time parameters with used one (This is required to correctly handle motion vector for vertex animation based on time)
            vertexDescriptionInputs.TimeParameters = timeParameters;
        
            // evaluate vertex graph
        #ifdef HAVE_VFX_MODIFICATION
            GraphProperties properties;
            ZERO_INITIALIZE(GraphProperties, properties);
        
            // Fetch the vertex graph properties for the particle instance.
            GetElementVertexProperties(element, properties);
        
            VertexDescription vertexDescription = VertexDescriptionFunction(vertexDescriptionInputs, properties);
        #else
            VertexDescription vertexDescription = VertexDescriptionFunction(vertexDescriptionInputs);
        #endif
            return vertexDescription;
        
        }
        
        AttributesMesh ApplyMeshModification(AttributesMesh input, float3 timeParameters
        #ifdef USE_CUSTOMINTERP_SUBSTRUCT
            #ifdef TESSELLATION_ON
            , inout VaryingsMeshToDS varyings
            #else
            , inout VaryingsMeshToPS varyings
            #endif
        #endif
        #ifdef HAVE_VFX_MODIFICATION
                , AttributesElement element
        #endif
            )
        {
            VertexDescription vertexDescription = GetVertexDescription(input, timeParameters
        #ifdef HAVE_VFX_MODIFICATION
                , element
        #endif
            );
        
            // copy graph output to the results
            input.positionOS = vertexDescription.Position;
            input.normalOS = vertexDescription.Normal;
            input.tangentOS.xyz = vertexDescription.Tangent;
        
            
        
            return input;
        }
        
        #if defined(_ADD_CUSTOM_VELOCITY) // For shader graph custom velocity
        // Return precomputed Velocity in object space
        float3 GetCustomVelocity(AttributesMesh input
        #ifdef HAVE_VFX_MODIFICATION
            , AttributesElement element
        #endif
        )
        {
            VertexDescription vertexDescription = GetVertexDescription(input, _TimeParameters.xyz
        #ifdef HAVE_VFX_MODIFICATION
                , element
        #endif
            );
            return vertexDescription.CustomVelocity;
        }
        #endif
        
        FragInputs BuildFragInputs(VaryingsMeshToPS input)
        {
            FragInputs output;
            ZERO_INITIALIZE(FragInputs, output);
        
            // Init to some default value to make the computer quiet (else it output 'divide by zero' warning even if value is not used).
            // TODO: this is a really poor workaround, but the variable is used in a bunch of places
            // to compute normals which are then passed on elsewhere to compute other values...
            output.tangentToWorld = k_identity3x3;
            output.positionSS = input.positionCS;       // input.positionCS is SV_Position
        
            output.positionRWS =                input.positionRWS;
            output.tangentToWorld =             BuildTangentToWorld(input.tangentWS, input.normalWS);
        
        #ifdef HAVE_VFX_MODIFICATION
            // FragInputs from VFX come from two places: Interpolator or CBuffer.
            /* WARNING: $splice Could not find named fragment 'VFXSetFragInputs' */
        
        #endif
        
            // splice point to copy custom interpolator fields from varyings to frag inputs
            
        
            return output;
        }
        
        // existing HDRP code uses the combined function to go directly from packed to frag inputs
        FragInputs UnpackVaryingsMeshToFragInputs(PackedVaryingsMeshToPS input)
        {
            UNITY_SETUP_INSTANCE_ID(input);
            VaryingsMeshToPS unpacked = UnpackVaryingsMeshToPS(input);
            return BuildFragInputs(unpacked);
        }
            SurfaceDescriptionInputs FragInputsToSurfaceDescriptionInputs(FragInputs input, float3 viewWS)
        {
            SurfaceDescriptionInputs output;
            ZERO_INITIALIZE(SurfaceDescriptionInputs, output);
        
            output.WorldSpaceNormal =                           normalize(input.tangentToWorld[2].xyz);
            #if defined(SHADER_STAGE_RAY_TRACING)
            #else
            #endif
            output.WorldSpaceViewDirection =                    normalize(viewWS);
            output.WorldSpacePosition =                         input.positionRWS;
            output.ObjectSpacePosition =                        TransformWorldToObject(input.positionRWS);
            output.ScreenPosition =                             ComputeScreenPos(TransformWorldToHClip(input.positionRWS), _ProjectionParams.x);
            output.TimeParameters =                             _TimeParameters.xyz; // This is mainly for LW as HD overwrite this value
        
            // splice point to copy frag inputs custom interpolator pack into the SDI
            
        
            return output;
        }
        
            // --------------------------------------------------
            // Build Surface Data (Specific Material)
        
        void BuildSurfaceData(FragInputs fragInputs, inout SurfaceDescription surfaceDescription, float3 V, PositionInputs posInput, out SurfaceData surfaceData)
        {
            // setup defaults -- these are used if the graph doesn't output a value
            ZERO_INITIALIZE(SurfaceData, surfaceData);
        
            // copy across graph values, if defined
            surfaceData.color = surfaceDescription.BaseColor;
        
            #ifdef WRITE_NORMAL_BUFFER
            // When we need to export the normal (in the depth prepass, we write the geometry one)
            surfaceData.normalWS = fragInputs.tangentToWorld[2];
            #endif
        
            #if defined(DEBUG_DISPLAY)
            if (_DebugMipMapMode != DEBUGMIPMAPMODE_NONE)
            {
                // TODO
            }
            #endif
        
            #ifdef _ENABLE_SHADOW_MATTE
        
                #if (SHADERPASS == SHADERPASS_FORWARD_UNLIT) || (SHADERPASS == SHADERPASS_RAYTRACING_GBUFFER) || (SHADERPASS == SHADERPASS_RAYTRACING_INDIRECT) || (SHADERPASS == SHADERPASS_RAYTRACING_FORWARD)
        
                    HDShadowContext shadowContext = InitShadowContext();
        
                    // Evaluate the shadow, the normal is guaranteed if shadow matte is enabled on this shader.
                    float3 shadow3;
                    ShadowLoopMin(shadowContext, posInput, normalize(fragInputs.tangentToWorld[2]), asuint(_ShadowMatteFilter), GetMeshRenderingLightLayer(), shadow3);
        
                    // Compute the average value in the fourth channel
                    float4 shadow = float4(shadow3, dot(shadow3, float3(1.0/3.0, 1.0/3.0, 1.0/3.0)));
        
                    float4 shadowColor = (1.0 - shadow) * surfaceDescription.ShadowTint.rgba;
                    float  localAlpha  = saturate(shadowColor.a + surfaceDescription.Alpha);
        
                    // Keep the nested lerp
                    // With no Color (bsdfData.color.rgb, bsdfData.color.a == 0.0f), just use ShadowColor*Color to avoid a ring of "white" around the shadow
                    // And mix color to consider the Color & ShadowColor alpha (from texture or/and color picker)
                    #ifdef _SURFACE_TYPE_TRANSPARENT
                        surfaceData.color = lerp(shadowColor.rgb * surfaceData.color, lerp(lerp(shadowColor.rgb, surfaceData.color, 1.0 - surfaceDescription.ShadowTint.a), surfaceData.color, shadow.rgb), surfaceDescription.Alpha);
                    #else
                        surfaceData.color = lerp(lerp(shadowColor.rgb, surfaceData.color, 1.0 - surfaceDescription.ShadowTint.a), surfaceData.color, shadow.rgb);
                    #endif
                    localAlpha = ApplyBlendMode(surfaceData.color, localAlpha).a;
        
                    surfaceDescription.Alpha = localAlpha;
        
                #elif SHADERPASS == SHADERPASS_PATH_TRACING
        
                    surfaceData.normalWS = fragInputs.tangentToWorld[2];
                    surfaceData.shadowTint = surfaceDescription.ShadowTint.rgba;
        
                #endif
        
            #endif // _ENABLE_SHADOW_MATTE
        }
        
            // --------------------------------------------------
            // Get Surface And BuiltinData
        
            void GetSurfaceAndBuiltinData(FragInputs fragInputs, float3 V, inout PositionInputs posInput, out SurfaceData surfaceData, out BuiltinData builtinData RAY_TRACING_OPTIONAL_PARAMETERS)
            {
                // Don't dither if displaced tessellation (we're fading out the displacement instead to match the next LOD)
                #if !defined(SHADER_STAGE_RAY_TRACING) && !defined(_TESSELLATION_DISPLACEMENT)
                #ifdef LOD_FADE_CROSSFADE // enable dithering LOD transition if user select CrossFade transition in LOD group
                LODDitheringTransition(ComputeFadeMaskSeed(V, posInput.positionSS), unity_LODFade.x);
                #endif
                #endif
        
                #ifndef SHADER_UNLIT
                #ifdef _DOUBLESIDED_ON
                    float3 doubleSidedConstants = _DoubleSidedConstants.xyz;
                #else
                    float3 doubleSidedConstants = float3(1.0, 1.0, 1.0);
                #endif
        
                ApplyDoubleSidedFlipOrMirror(fragInputs, doubleSidedConstants); // Apply double sided flip on the vertex normal
                #endif // SHADER_UNLIT
        
                SurfaceDescriptionInputs surfaceDescriptionInputs = FragInputsToSurfaceDescriptionInputs(fragInputs, V);
        
                #if defined(HAVE_VFX_MODIFICATION)
                GraphProperties properties;
                ZERO_INITIALIZE(GraphProperties, properties);
        
                GetElementPixelProperties(fragInputs, properties);
        
                SurfaceDescription surfaceDescription = SurfaceDescriptionFunction(surfaceDescriptionInputs, properties);
                #else
                SurfaceDescription surfaceDescription = SurfaceDescriptionFunction(surfaceDescriptionInputs);
                #endif
        
                // Perform alpha test very early to save performance (a killed pixel will not sample textures)
                // TODO: split graph evaluation to grab just alpha dependencies first? tricky..
                #ifdef _ALPHATEST_ON
                    float alphaCutoff = surfaceDescription.AlphaClipThreshold;
                    #if SHADERPASS == SHADERPASS_TRANSPARENT_DEPTH_PREPASS
                    // The TransparentDepthPrepass is also used with SSR transparent.
                    // If an artists enable transaprent SSR but not the TransparentDepthPrepass itself, then we use AlphaClipThreshold
                    // otherwise if TransparentDepthPrepass is enabled we use AlphaClipThresholdDepthPrepass
                    #elif SHADERPASS == SHADERPASS_TRANSPARENT_DEPTH_POSTPASS
                    // DepthPostpass always use its own alpha threshold
                    alphaCutoff = surfaceDescription.AlphaClipThresholdDepthPostpass;
                    #elif (SHADERPASS == SHADERPASS_SHADOWS) || (SHADERPASS == SHADERPASS_RAYTRACING_VISIBILITY)
                    // If use shadow threshold isn't enable we don't allow any test
                    #endif
        
                    GENERIC_ALPHA_TEST(surfaceDescription.Alpha, alphaCutoff);
                #endif
        
                #if !defined(SHADER_STAGE_RAY_TRACING) && _DEPTHOFFSET_ON
                ApplyDepthOffsetPositionInput(V, surfaceDescription.DepthOffset, GetViewForwardDir(), GetWorldToHClipMatrix(), posInput);
                #endif
        
                #ifndef SHADER_UNLIT
                float3 bentNormalWS;
                BuildSurfaceData(fragInputs, surfaceDescription, V, posInput, surfaceData, bentNormalWS);
        
                #ifdef FRAG_INPUTS_USE_TEXCOORD1
                    float4 lightmapTexCoord1 = fragInputs.texCoord1;
                #else
                    float4 lightmapTexCoord1 = float4(0,0,0,0);
                #endif
        
                #ifdef FRAG_INPUTS_USE_TEXCOORD2
                    float4 lightmapTexCoord2 = fragInputs.texCoord2;
                #else
                    float4 lightmapTexCoord2 = float4(0,0,0,0);
                #endif
        
                // Builtin Data
                // For back lighting we use the oposite vertex normal
                InitBuiltinData(posInput, surfaceDescription.Alpha, bentNormalWS, -fragInputs.tangentToWorld[2], lightmapTexCoord1, lightmapTexCoord2, builtinData);
        
                #else
                BuildSurfaceData(fragInputs, surfaceDescription, V, posInput, surfaceData);
        
                ZERO_BUILTIN_INITIALIZE(builtinData); // No call to InitBuiltinData as we don't have any lighting
                builtinData.opacity = surfaceDescription.Alpha;
        
                #if defined(DEBUG_DISPLAY)
                    // Light Layers are currently not used for the Unlit shader (because it is not lit)
                    // But Unlit objects do cast shadows according to their rendering layer mask, which is what we want to
                    // display in the light layers visualization mode, therefore we need the renderingLayers
                    builtinData.renderingLayers = GetMeshRenderingLightLayer();
                #endif
        
                #endif // SHADER_UNLIT
        
                #ifdef _ALPHATEST_ON
                    // Used for sharpening by alpha to mask - Alpha to covertage is only used with depth only and forward pass (no shadow pass, no transparent pass)
                    builtinData.alphaClipTreshold = alphaCutoff;
                #endif
        
                // override sampleBakedGI - not used by Unlit
        
                builtinData.emissiveColor = surfaceDescription.Emission;
        
                // Note this will not fully work on transparent surfaces (can check with _SURFACE_TYPE_TRANSPARENT define)
                // We will always overwrite vt feeback with the nearest. So behind transparent surfaces vt will not be resolved
                // This is a limitation of the current MRT approach.
                #ifdef UNITY_VIRTUAL_TEXTURING
                #endif
        
                #if _DEPTHOFFSET_ON
                builtinData.depthOffset = surfaceDescription.DepthOffset;
                #endif
        
                // TODO: We should generate distortion / distortionBlur for non distortion pass
                #if (SHADERPASS == SHADERPASS_DISTORTION)
                builtinData.distortion = surfaceDescription.Distortion;
                builtinData.distortionBlur = surfaceDescription.DistortionBlur;
                #endif
        
                #ifndef SHADER_UNLIT
                // PostInitBuiltinData call ApplyDebugToBuiltinData
                PostInitBuiltinData(V, posInput, surfaceData, builtinData);
                #else
                ApplyDebugToBuiltinData(builtinData);
                #endif
        
                RAY_TRACING_OPTIONAL_ALPHA_TEST_PASS
            }
        
            // --------------------------------------------------
            // Main
        
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/ShaderPass/ShaderPassDepthOnly.hlsl"
        
            // --------------------------------------------------
            // Visual Effect Vertex Invocations
        
        	#ifdef HAVE_VFX_MODIFICATION
        	#include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/VisualEffectVertex.hlsl"
        	#endif
        
            ENDHLSL
        }
        Pass
        {
            Name "ForwardOnly"
            Tags
            {
                "LightMode" = "ForwardOnly"
            }
        
            // Render State
            Cull [_CullModeForward]
        Blend [_SrcBlend] [_DstBlend], [_AlphaSrcBlend] [_AlphaDstBlend]
        ZTest [_ZTestDepthEqualForOpaque]
        ZWrite On
        ColorMask [_ColorMaskTransparentVelOne] 1
        ColorMask [_ColorMaskTransparentVelTwo] 2
        Stencil
        {
        WriteMask [_StencilWriteMask]
        Ref [_StencilRef]
        CompFront Always
        PassFront Replace
        CompBack Always
        PassBack Replace
        }
        
            // Debug
            // <None>
        
            // --------------------------------------------------
            // Pass
        
            HLSLPROGRAM
        
            // Pragmas
            #pragma instancing_options renderinglayer
        #pragma target 4.5
        #pragma vertex Vert
        #pragma fragment Frag
        #pragma only_renderers d3d11 playstation xboxone xboxseries vulkan metal switch
        #pragma multi_compile_instancing
        
            // Keywords
            #pragma shader_feature _ _SURFACE_TYPE_TRANSPARENT
        #pragma shader_feature_local _BLENDMODE_OFF _BLENDMODE_ALPHA _BLENDMODE_ADD _BLENDMODE_PRE_MULTIPLY
        #pragma shader_feature_local _ _ADD_PRECOMPUTED_VELOCITY
        #pragma shader_feature_local _ _TRANSPARENT_WRITES_MOTION_VEC
        #pragma shader_feature_local_fragment _ _ENABLE_FOG_ON_TRANSPARENT
        #pragma multi_compile _ DEBUG_DISPLAY
            // GraphKeywords: <None>
        
            // Early Instancing Defines
            // DotsInstancingOptions: <None>
        
            // Injected Instanced Properties (must be included before UnityInstancing.hlsl)
            // HybridV1InjectedBuiltinProperties: <None>
        
            // For custom interpolators to inject a substruct definition before FragInputs definition,
            // allowing for FragInputs to capture CI's intended for ShaderGraph's SDI.
            struct CustomInterpolators
        {
        };
        #define USE_CUSTOMINTERP_SUBSTRUCT
        
        
        
            // TODO: Merge FragInputsVFX substruct with CustomInterpolators.
        	#ifdef HAVE_VFX_MODIFICATION
        	struct FragInputsVFX
            {
                /* WARNING: $splice Could not find named fragment 'FragInputsVFX' */
            };
            #endif
        
            #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Common.hlsl"
        	#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/GeometricTools.hlsl" // Required by Tessellation.hlsl
        	#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Tessellation.hlsl"
            #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Texture.hlsl"
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderVariables.hlsl"
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/ShaderPass/ShaderPass.cs.hlsl"
            #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/TextureStack.hlsl" // Required to be include before we include properties as it define DECLARE_STACK_CB
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderGraphHeader.hlsl" // Need to be here for Gradient struct definition
        
            // --------------------------------------------------
            // Defines
        
            // Attribute
            #define ATTRIBUTES_NEED_NORMAL
            #define ATTRIBUTES_NEED_TANGENT
            #define VARYINGS_NEED_POSITION_WS
            #define VARYINGS_NEED_TANGENT_TO_WORLD
        
            #define HAVE_MESH_MODIFICATION
        
            //Strip down the FragInputs.hlsl (on graphics), so we can only optimize the interpolators we use.
            //if by accident something requests contents of FragInputs.hlsl, it will be caught as a compiler error
            //Frag inputs stripping is only enabled when FRAG_INPUTS_ENABLE_STRIPPING is set
            #if !defined(SHADER_STAGE_RAY_TRACING) && SHADERPASS != SHADERPASS_RAYTRACING_GBUFFER && SHADERPASS != SHADERPASS_FULL_SCREEN_DEBUG
            #define FRAG_INPUTS_ENABLE_STRIPPING
            #endif
        
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/ShaderPass/FragInputs.hlsl"
        
        
        
            #define SHADERPASS SHADERPASS_FORWARD_UNLIT
        #define RAYTRACING_SHADER_GRAPH_DEFAULT
        #define REQUIRE_DEPTH_TEXTURE
        
        
            // Following two define are a workaround introduce in 10.1.x for RaytracingQualityNode
            // The ShaderGraph don't support correctly migration of this node as it serialize all the node data
            // in the json file making it impossible to uprgrade. Until we get a fix, we do a workaround here
            // to still allow us to rename the field and keyword of this node without breaking existing code.
            #ifdef RAYTRACING_SHADER_GRAPH_DEFAULT
            #define RAYTRACING_SHADER_GRAPH_HIGH
            #endif
        
            #ifdef RAYTRACING_SHADER_GRAPH_RAYTRACED
            #define RAYTRACING_SHADER_GRAPH_LOW
            #endif
            // end
        
            #ifndef SHADER_UNLIT
            // We need isFrontFace when using double sided - it is not required for unlit as in case of unlit double sided only drive the cullmode
            // VARYINGS_NEED_CULLFACE can be define by VaryingsMeshToPS.FaceSign input if a IsFrontFace Node is included in the shader graph.
            #if defined(_DOUBLESIDED_ON) && !defined(VARYINGS_NEED_CULLFACE)
                #define VARYINGS_NEED_CULLFACE
            #endif
            #endif
        
            // Specific Material Define
        // Setup a define to say we are an unlit shader
        #define SHADER_UNLIT
        
        // Following Macro are only used by Unlit material
        #if defined(_ENABLE_SHADOW_MATTE) && (SHADERPASS == SHADERPASS_FORWARD_UNLIT || SHADERPASS == SHADERPASS_PATH_TRACING)
        #define LIGHTLOOP_DISABLE_TILE_AND_CLUSTER
        #define HAS_LIGHTLOOP
        #endif
            // Caution: we can use the define SHADER_UNLIT onlit after the above Material include as it is the Unlit template who define it
        
            // To handle SSR on transparent correctly with a possibility to enable/disable it per framesettings
            // we should have a code like this:
            // if !defined(_DISABLE_SSR_TRANSPARENT)
            // pragma multi_compile _ WRITE_NORMAL_BUFFER
            // endif
            // i.e we enable the multicompile only if we can receive SSR or not, and then C# code drive
            // it based on if SSR transparent in frame settings and not (and stripper can strip it).
            // this is currently not possible with our current preprocessor as _DISABLE_SSR_TRANSPARENT is a keyword not a define
            // so instead we used this and chose to pay the extra cost of normal write even if SSR transaprent is disabled.
            // Ideally the shader graph generator should handle it but condition below can't be handle correctly for now.
            #if SHADERPASS == SHADERPASS_TRANSPARENT_DEPTH_PREPASS
            #if !defined(_DISABLE_SSR_TRANSPARENT) && !defined(SHADER_UNLIT)
                #define WRITE_NORMAL_BUFFER
            #endif
            #endif
        
            #ifndef DEBUG_DISPLAY
                // In case of opaque we don't want to perform the alpha test, it is done in depth prepass and we use depth equal for ztest (setup from UI)
                // Don't do it with debug display mode as it is possible there is no depth prepass in this case
                #if !defined(_SURFACE_TYPE_TRANSPARENT)
                    #if SHADERPASS == SHADERPASS_FORWARD
                    #define SHADERPASS_FORWARD_BYPASS_ALPHA_TEST
                    #elif SHADERPASS == SHADERPASS_GBUFFER
                    #define SHADERPASS_GBUFFER_BYPASS_ALPHA_TEST
                    #endif
                #endif
            #endif
        
            // Define _DEFERRED_CAPABLE_MATERIAL for shader capable to run in deferred pass
            #if defined(SHADER_LIT) && !defined(_SURFACE_TYPE_TRANSPARENT)
                #define _DEFERRED_CAPABLE_MATERIAL
            #endif
        
            // Translate transparent motion vector define
            #if defined(_TRANSPARENT_WRITES_MOTION_VEC) && defined(_SURFACE_TYPE_TRANSPARENT)
                #define _WRITE_TRANSPARENT_MOTION_VECTOR
            #endif
        
            // -- Graph Properties
            CBUFFER_START(UnityPerMaterial)
        float4 _Rotate_Projection;
        float _Noise_Scale;
        float _Speed;
        float _Vertexoffset;
        float4 _Remap_xy_zw;
        float4 _Color_Peak;
        float4 _Color_Valley;
        float _SmoothEdge1;
        float _SmoothEdge2;
        float _Cloud_Pow;
        float _Base_Scale;
        float _Base_Speed;
        float _BaseStrength;
        float _Emission_Strength;
        float _Curvate_Radius;
        float _Fresnel_Power;
        float _Fresnel_Opacity;
        float _Depth_Fade;
        float4 _EmissionColor;
        float _UseShadowThreshold;
        float4 _DoubleSidedConstants;
        float _BlendMode;
        float _EnableBlendModePreserveSpecularLighting;
        CBUFFER_END
        
        // Object and Global properties
        
            // -- Property used by ScenePickingPass
            #ifdef SCENEPICKINGPASS
            float4 _SelectionID;
            #endif
        
            // -- Properties used by SceneSelectionPass
            #ifdef SCENESELECTIONPASS
            int _ObjectId;
            int _PassValue;
            #endif
        
            // Includes
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/Debug/DebugDisplay.hlsl"
        #include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Material.hlsl"
        #include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Unlit/Unlit.hlsl"
        #include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/BuiltinUtilities.hlsl"
        #include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/MaterialUtilities.hlsl"
        #include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderGraphFunctions.hlsl"
        	// GraphIncludes: <None>
        
            // --------------------------------------------------
            // Structs and Packing
        
            struct AttributesMesh
        {
             float3 positionOS : POSITION;
             float3 normalOS : NORMAL;
             float4 tangentOS : TANGENT;
            #if UNITY_ANY_INSTANCING_ENABLED
             uint instanceID : INSTANCEID_SEMANTIC;
            #endif
        };
        struct VaryingsMeshToPS
        {
            SV_POSITION_QUALIFIERS float4 positionCS : SV_POSITION;
             float3 positionRWS;
             float3 normalWS;
             float4 tangentWS;
            #if UNITY_ANY_INSTANCING_ENABLED
             uint instanceID : CUSTOM_INSTANCE_ID;
            #endif
        };
        struct VertexDescriptionInputs
        {
             float3 ObjectSpaceNormal;
             float3 ObjectSpaceTangent;
             float3 ObjectSpacePosition;
             float3 TimeParameters;
        };
        struct SurfaceDescriptionInputs
        {
             float3 WorldSpaceNormal;
             float3 WorldSpaceViewDirection;
             float3 ObjectSpacePosition;
             float3 WorldSpacePosition;
             float4 ScreenPosition;
             float3 TimeParameters;
        };
        struct PackedVaryingsMeshToPS
        {
            SV_POSITION_QUALIFIERS float4 positionCS : SV_POSITION;
             float3 interp0 : INTERP0;
             float3 interp1 : INTERP1;
             float4 interp2 : INTERP2;
            #if UNITY_ANY_INSTANCING_ENABLED
             uint instanceID : CUSTOM_INSTANCE_ID;
            #endif
        };
        
            PackedVaryingsMeshToPS PackVaryingsMeshToPS (VaryingsMeshToPS input)
        {
            PackedVaryingsMeshToPS output;
            ZERO_INITIALIZE(PackedVaryingsMeshToPS, output);
            output.positionCS = input.positionCS;
            output.interp0.xyz =  input.positionRWS;
            output.interp1.xyz =  input.normalWS;
            output.interp2.xyzw =  input.tangentWS;
            #if UNITY_ANY_INSTANCING_ENABLED
            output.instanceID = input.instanceID;
            #endif
            return output;
        }
        
        VaryingsMeshToPS UnpackVaryingsMeshToPS (PackedVaryingsMeshToPS input)
        {
            VaryingsMeshToPS output;
            output.positionCS = input.positionCS;
            output.positionRWS = input.interp0.xyz;
            output.normalWS = input.interp1.xyz;
            output.tangentWS = input.interp2.xyzw;
            #if UNITY_ANY_INSTANCING_ENABLED
            output.instanceID = input.instanceID;
            #endif
            return output;
        }
        
        
            // --------------------------------------------------
            // Graph
        
        
            // Graph Functions
            
        void Unity_Distance_float3(float3 A, float3 B, out float Out)
        {
            Out = distance(A, B);
        }
        
        void Unity_Divide_float(float A, float B, out float Out)
        {
            Out = A / B;
        }
        
        void Unity_Power_float(float A, float B, out float Out)
        {
            Out = pow(A, B);
        }
        
        void Unity_Multiply_float3_float3(float3 A, float3 B, out float3 Out)
        {
            Out = A * B;
        }
        
        void Unity_Rotate_About_Axis_Radians_float(float3 In, float3 Axis, float Rotation, out float3 Out)
        {
            float s = sin(Rotation);
            float c = cos(Rotation);
            float one_minus_c = 1.0 - c;
        
            Axis = normalize(Axis);
        
            float3x3 rot_mat = { one_minus_c * Axis.x * Axis.x + c,            one_minus_c * Axis.x * Axis.y - Axis.z * s,     one_minus_c * Axis.z * Axis.x + Axis.y * s,
                                      one_minus_c * Axis.x * Axis.y + Axis.z * s,   one_minus_c * Axis.y * Axis.y + c,              one_minus_c * Axis.y * Axis.z - Axis.x * s,
                                      one_minus_c * Axis.z * Axis.x - Axis.y * s,   one_minus_c * Axis.y * Axis.z + Axis.x * s,     one_minus_c * Axis.z * Axis.z + c
                                    };
        
            Out = mul(rot_mat,  In);
        }
        
        void Unity_Multiply_float_float(float A, float B, out float Out)
        {
            Out = A * B;
        }
        
        void Unity_TilingAndOffset_float(float2 UV, float2 Tiling, float2 Offset, out float2 Out)
        {
            Out = UV * Tiling + Offset;
        }
        
        
        float2 Unity_GradientNoise_Dir_float(float2 p)
        {
            // Permutation and hashing used in webgl-nosie goo.gl/pX7HtC
            p = p % 289;
            // need full precision, otherwise half overflows when p > 1
            float x = float(34 * p.x + 1) * p.x % 289 + p.y;
            x = (34 * x + 1) * x % 289;
            x = frac(x / 41) * 2 - 1;
            return normalize(float2(x - floor(x + 0.5), abs(x) - 0.5));
        }
        
        void Unity_GradientNoise_float(float2 UV, float Scale, out float Out)
        {
            float2 p = UV * Scale;
            float2 ip = floor(p);
            float2 fp = frac(p);
            float d00 = dot(Unity_GradientNoise_Dir_float(ip), fp);
            float d01 = dot(Unity_GradientNoise_Dir_float(ip + float2(0, 1)), fp - float2(0, 1));
            float d10 = dot(Unity_GradientNoise_Dir_float(ip + float2(1, 0)), fp - float2(1, 0));
            float d11 = dot(Unity_GradientNoise_Dir_float(ip + float2(1, 1)), fp - float2(1, 1));
            fp = fp * fp * fp * (fp * (fp * 6 - 15) + 10);
            Out = lerp(lerp(d00, d01, fp.y), lerp(d10, d11, fp.y), fp.x) + 0.5;
        }
        
        void Unity_Add_float(float A, float B, out float Out)
        {
            Out = A + B;
        }
        
        void Unity_Saturate_float(float In, out float Out)
        {
            Out = saturate(In);
        }
        
        void Unity_Combine_float(float R, float G, float B, float A, out float4 RGBA, out float3 RGB, out float2 RG)
        {
            RGBA = float4(R, G, B, A);
            RGB = float3(R, G, B);
            RG = float2(R, G);
        }
        
        void Unity_Remap_float(float In, float2 InMinMax, float2 OutMinMax, out float Out)
        {
            Out = OutMinMax.x + (In - InMinMax.x) * (OutMinMax.y - OutMinMax.x) / (InMinMax.y - InMinMax.x);
        }
        
        void Unity_Absolute_float(float In, out float Out)
        {
            Out = abs(In);
        }
        
        void Unity_Smoothstep_float(float Edge1, float Edge2, float In, out float Out)
        {
            Out = smoothstep(Edge1, Edge2, In);
        }
        
        void Unity_Add_float3(float3 A, float3 B, out float3 Out)
        {
            Out = A + B;
        }
        
        void Unity_FresnelEffect_float(float3 Normal, float3 ViewDir, float Power, out float Out)
        {
            Out = pow((1.0 - saturate(dot(normalize(Normal), normalize(ViewDir)))), Power);
        }
        
        void Unity_Lerp_float4(float4 A, float4 B, float4 T, out float4 Out)
        {
            Out = lerp(A, B, T);
        }
        
        void Unity_Add_float4(float4 A, float4 B, out float4 Out)
        {
            Out = A + B;
        }
        
        void Unity_Multiply_float4_float4(float4 A, float4 B, out float4 Out)
        {
            Out = A * B;
        }
        
        void Unity_SceneDepth_Eye_float(float4 UV, out float Out)
        {
            if (unity_OrthoParams.w == 1.0)
            {
                Out = LinearEyeDepth(ComputeWorldSpacePosition(UV.xy, SHADERGRAPH_SAMPLE_SCENE_DEPTH(UV.xy), UNITY_MATRIX_I_VP), UNITY_MATRIX_V);
            }
            else
            {
                Out = LinearEyeDepth(SHADERGRAPH_SAMPLE_SCENE_DEPTH(UV.xy), _ZBufferParams);
            }
        }
        
        void Unity_Subtract_float(float A, float B, out float Out)
        {
            Out = A - B;
        }
        
            // Graph Vertex
            struct VertexDescription
        {
            float3 Position;
            float3 Normal;
            float3 Tangent;
        };
        
        VertexDescription VertexDescriptionFunction(VertexDescriptionInputs IN)
        {
            VertexDescription description = (VertexDescription)0;
            float _Distance_389dd396e31949b9a8a01d35896316a6_Out_2;
            Unity_Distance_float3(SHADERGRAPH_OBJECT_POSITION, IN.ObjectSpacePosition, _Distance_389dd396e31949b9a8a01d35896316a6_Out_2);
            float _Property_d58669debb0246fe82fb0fb0bffa2edc_Out_0 = _Curvate_Radius;
            float _Divide_0b143990dbbc4cbdb5129fcbf5511012_Out_2;
            Unity_Divide_float(_Distance_389dd396e31949b9a8a01d35896316a6_Out_2, _Property_d58669debb0246fe82fb0fb0bffa2edc_Out_0, _Divide_0b143990dbbc4cbdb5129fcbf5511012_Out_2);
            float _Power_89ab1e29e2cb42a9acd2aed36f4fdcfe_Out_2;
            Unity_Power_float(_Divide_0b143990dbbc4cbdb5129fcbf5511012_Out_2, 2, _Power_89ab1e29e2cb42a9acd2aed36f4fdcfe_Out_2);
            float3 _Multiply_22e187ffacc7402bbe63087272b7efb5_Out_2;
            Unity_Multiply_float3_float3(IN.ObjectSpaceNormal, (_Power_89ab1e29e2cb42a9acd2aed36f4fdcfe_Out_2.xxx), _Multiply_22e187ffacc7402bbe63087272b7efb5_Out_2);
            float _Property_7d8e49b5efe94dea8210c34a6319b1ef_Out_0 = _SmoothEdge1;
            float _Property_09307b889e8945078bacabda50cca5c6_Out_0 = _SmoothEdge2;
            float4 _Property_a8d53d7ea07349e0979b956475bdd7cc_Out_0 = _Rotate_Projection;
            float _Split_7d12b2bb5feb46d685603473d0cf5818_R_1 = _Property_a8d53d7ea07349e0979b956475bdd7cc_Out_0[0];
            float _Split_7d12b2bb5feb46d685603473d0cf5818_G_2 = _Property_a8d53d7ea07349e0979b956475bdd7cc_Out_0[1];
            float _Split_7d12b2bb5feb46d685603473d0cf5818_B_3 = _Property_a8d53d7ea07349e0979b956475bdd7cc_Out_0[2];
            float _Split_7d12b2bb5feb46d685603473d0cf5818_A_4 = _Property_a8d53d7ea07349e0979b956475bdd7cc_Out_0[3];
            float3 _RotateAboutAxis_1b91481bceed4e9a82a13975af123b02_Out_3;
            Unity_Rotate_About_Axis_Radians_float(IN.ObjectSpacePosition, (_Property_a8d53d7ea07349e0979b956475bdd7cc_Out_0.xyz), _Split_7d12b2bb5feb46d685603473d0cf5818_A_4, _RotateAboutAxis_1b91481bceed4e9a82a13975af123b02_Out_3);
            float _Property_258f4645340c46f69274c9f077f1a73c_Out_0 = _Speed;
            float _Multiply_94f6d857831c4e69b53b9bfc92dd852f_Out_2;
            Unity_Multiply_float_float(IN.TimeParameters.x, _Property_258f4645340c46f69274c9f077f1a73c_Out_0, _Multiply_94f6d857831c4e69b53b9bfc92dd852f_Out_2);
            float2 _TilingAndOffset_6cb9fd57231c4a429c9c0fe5aeb7cc58_Out_3;
            Unity_TilingAndOffset_float((_RotateAboutAxis_1b91481bceed4e9a82a13975af123b02_Out_3.xy), float2 (1, 1), (_Multiply_94f6d857831c4e69b53b9bfc92dd852f_Out_2.xx), _TilingAndOffset_6cb9fd57231c4a429c9c0fe5aeb7cc58_Out_3);
            float _Property_2b9001a870d04f8eb60f5d7e1ce909c5_Out_0 = _Noise_Scale;
            float _GradientNoise_061679506b214bb8b4792ec4dfe82ec6_Out_2;
            Unity_GradientNoise_float(_TilingAndOffset_6cb9fd57231c4a429c9c0fe5aeb7cc58_Out_3, _Property_2b9001a870d04f8eb60f5d7e1ce909c5_Out_0, _GradientNoise_061679506b214bb8b4792ec4dfe82ec6_Out_2);
            float2 _TilingAndOffset_1d2491b5855e49d3b2e6b5dbe5db07d4_Out_3;
            Unity_TilingAndOffset_float((_RotateAboutAxis_1b91481bceed4e9a82a13975af123b02_Out_3.xy), float2 (1, 1), float2 (0, 0), _TilingAndOffset_1d2491b5855e49d3b2e6b5dbe5db07d4_Out_3);
            float _GradientNoise_8a27c3fb323f4db1b38f287380605198_Out_2;
            Unity_GradientNoise_float(_TilingAndOffset_1d2491b5855e49d3b2e6b5dbe5db07d4_Out_3, _Property_2b9001a870d04f8eb60f5d7e1ce909c5_Out_0, _GradientNoise_8a27c3fb323f4db1b38f287380605198_Out_2);
            float _Add_a6dd2d6e3f564decbca34ec03a419130_Out_2;
            Unity_Add_float(_GradientNoise_061679506b214bb8b4792ec4dfe82ec6_Out_2, _GradientNoise_8a27c3fb323f4db1b38f287380605198_Out_2, _Add_a6dd2d6e3f564decbca34ec03a419130_Out_2);
            float _Divide_a757ea7167f343ecaec30e69b58c9bae_Out_2;
            Unity_Divide_float(_Add_a6dd2d6e3f564decbca34ec03a419130_Out_2, 2, _Divide_a757ea7167f343ecaec30e69b58c9bae_Out_2);
            float _Saturate_f355ba5a467f4488b7ec89e8a08484a3_Out_1;
            Unity_Saturate_float(_Divide_a757ea7167f343ecaec30e69b58c9bae_Out_2, _Saturate_f355ba5a467f4488b7ec89e8a08484a3_Out_1);
            float _Property_96da655cc17e4594836aa02d74efe33c_Out_0 = _Cloud_Pow;
            float _Power_318bede735044ec6811f2a5c345b7d73_Out_2;
            Unity_Power_float(_Saturate_f355ba5a467f4488b7ec89e8a08484a3_Out_1, _Property_96da655cc17e4594836aa02d74efe33c_Out_0, _Power_318bede735044ec6811f2a5c345b7d73_Out_2);
            float4 _Property_317e8becc0724841a13cbcf8d4c4efbc_Out_0 = _Remap_xy_zw;
            float _Split_3dee68ff9a374966b7612da59c6ac20a_R_1 = _Property_317e8becc0724841a13cbcf8d4c4efbc_Out_0[0];
            float _Split_3dee68ff9a374966b7612da59c6ac20a_G_2 = _Property_317e8becc0724841a13cbcf8d4c4efbc_Out_0[1];
            float _Split_3dee68ff9a374966b7612da59c6ac20a_B_3 = _Property_317e8becc0724841a13cbcf8d4c4efbc_Out_0[2];
            float _Split_3dee68ff9a374966b7612da59c6ac20a_A_4 = _Property_317e8becc0724841a13cbcf8d4c4efbc_Out_0[3];
            float4 _Combine_4e3ec9a6e4064091bba919631e732b7a_RGBA_4;
            float3 _Combine_4e3ec9a6e4064091bba919631e732b7a_RGB_5;
            float2 _Combine_4e3ec9a6e4064091bba919631e732b7a_RG_6;
            Unity_Combine_float(_Split_3dee68ff9a374966b7612da59c6ac20a_R_1, _Split_3dee68ff9a374966b7612da59c6ac20a_G_2, 0, 0, _Combine_4e3ec9a6e4064091bba919631e732b7a_RGBA_4, _Combine_4e3ec9a6e4064091bba919631e732b7a_RGB_5, _Combine_4e3ec9a6e4064091bba919631e732b7a_RG_6);
            float4 _Combine_6f976751f1234c77908b163e59da18bb_RGBA_4;
            float3 _Combine_6f976751f1234c77908b163e59da18bb_RGB_5;
            float2 _Combine_6f976751f1234c77908b163e59da18bb_RG_6;
            Unity_Combine_float(_Split_3dee68ff9a374966b7612da59c6ac20a_B_3, _Split_3dee68ff9a374966b7612da59c6ac20a_A_4, 0, 0, _Combine_6f976751f1234c77908b163e59da18bb_RGBA_4, _Combine_6f976751f1234c77908b163e59da18bb_RGB_5, _Combine_6f976751f1234c77908b163e59da18bb_RG_6);
            float _Remap_a11bf825d8d54f198c2355e6d3cc1fba_Out_3;
            Unity_Remap_float(_Power_318bede735044ec6811f2a5c345b7d73_Out_2, _Combine_4e3ec9a6e4064091bba919631e732b7a_RG_6, _Combine_6f976751f1234c77908b163e59da18bb_RG_6, _Remap_a11bf825d8d54f198c2355e6d3cc1fba_Out_3);
            float _Absolute_553a57701af34a45a18ca7b2af677c8a_Out_1;
            Unity_Absolute_float(_Remap_a11bf825d8d54f198c2355e6d3cc1fba_Out_3, _Absolute_553a57701af34a45a18ca7b2af677c8a_Out_1);
            float _Smoothstep_6babd4aa745b40db842b941b96adf7e9_Out_3;
            Unity_Smoothstep_float(_Property_7d8e49b5efe94dea8210c34a6319b1ef_Out_0, _Property_09307b889e8945078bacabda50cca5c6_Out_0, _Absolute_553a57701af34a45a18ca7b2af677c8a_Out_1, _Smoothstep_6babd4aa745b40db842b941b96adf7e9_Out_3);
            float _Property_17631cb6b51c44b593b4fb1f0ac8fa75_Out_0 = _Base_Speed;
            float _Multiply_2e98faddc46143bea8e48ab17d0e1c15_Out_2;
            Unity_Multiply_float_float(IN.TimeParameters.x, _Property_17631cb6b51c44b593b4fb1f0ac8fa75_Out_0, _Multiply_2e98faddc46143bea8e48ab17d0e1c15_Out_2);
            float2 _TilingAndOffset_d8c83d87b12649f7b6a3902973c4457a_Out_3;
            Unity_TilingAndOffset_float((_RotateAboutAxis_1b91481bceed4e9a82a13975af123b02_Out_3.xy), float2 (1, 1), (_Multiply_2e98faddc46143bea8e48ab17d0e1c15_Out_2.xx), _TilingAndOffset_d8c83d87b12649f7b6a3902973c4457a_Out_3);
            float _Property_2792df33a4d44e20b2f71fe244d5f369_Out_0 = _Base_Scale;
            float _GradientNoise_702d412fe90e4c64b91e9defbe1ffff2_Out_2;
            Unity_GradientNoise_float(_TilingAndOffset_d8c83d87b12649f7b6a3902973c4457a_Out_3, _Property_2792df33a4d44e20b2f71fe244d5f369_Out_0, _GradientNoise_702d412fe90e4c64b91e9defbe1ffff2_Out_2);
            float _Property_a965b78b3be84255ae4ff1617bd2df01_Out_0 = _BaseStrength;
            float _Multiply_9880df30952a454781c1f0c8356100dd_Out_2;
            Unity_Multiply_float_float(_GradientNoise_702d412fe90e4c64b91e9defbe1ffff2_Out_2, _Property_a965b78b3be84255ae4ff1617bd2df01_Out_0, _Multiply_9880df30952a454781c1f0c8356100dd_Out_2);
            float _Add_98d9cdbb65e44e0282692d35bd9d237b_Out_2;
            Unity_Add_float(_Smoothstep_6babd4aa745b40db842b941b96adf7e9_Out_3, _Multiply_9880df30952a454781c1f0c8356100dd_Out_2, _Add_98d9cdbb65e44e0282692d35bd9d237b_Out_2);
            float _Add_d305fd085a9b459da3d4bd5108430b3f_Out_2;
            Unity_Add_float(1, _Property_a965b78b3be84255ae4ff1617bd2df01_Out_0, _Add_d305fd085a9b459da3d4bd5108430b3f_Out_2);
            float _Divide_55db7b7a0b8b481d83fb512a13a2dba6_Out_2;
            Unity_Divide_float(_Add_98d9cdbb65e44e0282692d35bd9d237b_Out_2, _Add_d305fd085a9b459da3d4bd5108430b3f_Out_2, _Divide_55db7b7a0b8b481d83fb512a13a2dba6_Out_2);
            float3 _Multiply_639bbd01ca0947fdbb4245744090b06e_Out_2;
            Unity_Multiply_float3_float3(IN.ObjectSpaceNormal, (_Divide_55db7b7a0b8b481d83fb512a13a2dba6_Out_2.xxx), _Multiply_639bbd01ca0947fdbb4245744090b06e_Out_2);
            float _Property_8b198d3112494fb98defdd5dc1b13601_Out_0 = _Vertexoffset;
            float3 _Multiply_2119a238e1d14c34879c4926fe468be5_Out_2;
            Unity_Multiply_float3_float3(_Multiply_639bbd01ca0947fdbb4245744090b06e_Out_2, (_Property_8b198d3112494fb98defdd5dc1b13601_Out_0.xxx), _Multiply_2119a238e1d14c34879c4926fe468be5_Out_2);
            float3 _Add_18a07d3e52a847f594f01810747a3393_Out_2;
            Unity_Add_float3(IN.ObjectSpacePosition, _Multiply_2119a238e1d14c34879c4926fe468be5_Out_2, _Add_18a07d3e52a847f594f01810747a3393_Out_2);
            float3 _Add_b9cf96b2dcd84792b2e40dd036537586_Out_2;
            Unity_Add_float3(_Multiply_22e187ffacc7402bbe63087272b7efb5_Out_2, _Add_18a07d3e52a847f594f01810747a3393_Out_2, _Add_b9cf96b2dcd84792b2e40dd036537586_Out_2);
            description.Position = _Add_b9cf96b2dcd84792b2e40dd036537586_Out_2;
            description.Normal = IN.ObjectSpaceNormal;
            description.Tangent = IN.ObjectSpaceTangent;
            return description;
        }
        
            // Graph Pixel
            struct SurfaceDescription
        {
            float3 BaseColor;
            float3 Emission;
            float Alpha;
            float4 VTPackedFeedback;
        };
        
        SurfaceDescription SurfaceDescriptionFunction(SurfaceDescriptionInputs IN)
        {
            SurfaceDescription surface = (SurfaceDescription)0;
            float _Property_7d8e49b5efe94dea8210c34a6319b1ef_Out_0 = _SmoothEdge1;
            float _Property_09307b889e8945078bacabda50cca5c6_Out_0 = _SmoothEdge2;
            float4 _Property_a8d53d7ea07349e0979b956475bdd7cc_Out_0 = _Rotate_Projection;
            float _Split_7d12b2bb5feb46d685603473d0cf5818_R_1 = _Property_a8d53d7ea07349e0979b956475bdd7cc_Out_0[0];
            float _Split_7d12b2bb5feb46d685603473d0cf5818_G_2 = _Property_a8d53d7ea07349e0979b956475bdd7cc_Out_0[1];
            float _Split_7d12b2bb5feb46d685603473d0cf5818_B_3 = _Property_a8d53d7ea07349e0979b956475bdd7cc_Out_0[2];
            float _Split_7d12b2bb5feb46d685603473d0cf5818_A_4 = _Property_a8d53d7ea07349e0979b956475bdd7cc_Out_0[3];
            float3 _RotateAboutAxis_1b91481bceed4e9a82a13975af123b02_Out_3;
            Unity_Rotate_About_Axis_Radians_float(IN.ObjectSpacePosition, (_Property_a8d53d7ea07349e0979b956475bdd7cc_Out_0.xyz), _Split_7d12b2bb5feb46d685603473d0cf5818_A_4, _RotateAboutAxis_1b91481bceed4e9a82a13975af123b02_Out_3);
            float _Property_258f4645340c46f69274c9f077f1a73c_Out_0 = _Speed;
            float _Multiply_94f6d857831c4e69b53b9bfc92dd852f_Out_2;
            Unity_Multiply_float_float(IN.TimeParameters.x, _Property_258f4645340c46f69274c9f077f1a73c_Out_0, _Multiply_94f6d857831c4e69b53b9bfc92dd852f_Out_2);
            float2 _TilingAndOffset_6cb9fd57231c4a429c9c0fe5aeb7cc58_Out_3;
            Unity_TilingAndOffset_float((_RotateAboutAxis_1b91481bceed4e9a82a13975af123b02_Out_3.xy), float2 (1, 1), (_Multiply_94f6d857831c4e69b53b9bfc92dd852f_Out_2.xx), _TilingAndOffset_6cb9fd57231c4a429c9c0fe5aeb7cc58_Out_3);
            float _Property_2b9001a870d04f8eb60f5d7e1ce909c5_Out_0 = _Noise_Scale;
            float _GradientNoise_061679506b214bb8b4792ec4dfe82ec6_Out_2;
            Unity_GradientNoise_float(_TilingAndOffset_6cb9fd57231c4a429c9c0fe5aeb7cc58_Out_3, _Property_2b9001a870d04f8eb60f5d7e1ce909c5_Out_0, _GradientNoise_061679506b214bb8b4792ec4dfe82ec6_Out_2);
            float2 _TilingAndOffset_1d2491b5855e49d3b2e6b5dbe5db07d4_Out_3;
            Unity_TilingAndOffset_float((_RotateAboutAxis_1b91481bceed4e9a82a13975af123b02_Out_3.xy), float2 (1, 1), float2 (0, 0), _TilingAndOffset_1d2491b5855e49d3b2e6b5dbe5db07d4_Out_3);
            float _GradientNoise_8a27c3fb323f4db1b38f287380605198_Out_2;
            Unity_GradientNoise_float(_TilingAndOffset_1d2491b5855e49d3b2e6b5dbe5db07d4_Out_3, _Property_2b9001a870d04f8eb60f5d7e1ce909c5_Out_0, _GradientNoise_8a27c3fb323f4db1b38f287380605198_Out_2);
            float _Add_a6dd2d6e3f564decbca34ec03a419130_Out_2;
            Unity_Add_float(_GradientNoise_061679506b214bb8b4792ec4dfe82ec6_Out_2, _GradientNoise_8a27c3fb323f4db1b38f287380605198_Out_2, _Add_a6dd2d6e3f564decbca34ec03a419130_Out_2);
            float _Divide_a757ea7167f343ecaec30e69b58c9bae_Out_2;
            Unity_Divide_float(_Add_a6dd2d6e3f564decbca34ec03a419130_Out_2, 2, _Divide_a757ea7167f343ecaec30e69b58c9bae_Out_2);
            float _Saturate_f355ba5a467f4488b7ec89e8a08484a3_Out_1;
            Unity_Saturate_float(_Divide_a757ea7167f343ecaec30e69b58c9bae_Out_2, _Saturate_f355ba5a467f4488b7ec89e8a08484a3_Out_1);
            float _Property_96da655cc17e4594836aa02d74efe33c_Out_0 = _Cloud_Pow;
            float _Power_318bede735044ec6811f2a5c345b7d73_Out_2;
            Unity_Power_float(_Saturate_f355ba5a467f4488b7ec89e8a08484a3_Out_1, _Property_96da655cc17e4594836aa02d74efe33c_Out_0, _Power_318bede735044ec6811f2a5c345b7d73_Out_2);
            float4 _Property_317e8becc0724841a13cbcf8d4c4efbc_Out_0 = _Remap_xy_zw;
            float _Split_3dee68ff9a374966b7612da59c6ac20a_R_1 = _Property_317e8becc0724841a13cbcf8d4c4efbc_Out_0[0];
            float _Split_3dee68ff9a374966b7612da59c6ac20a_G_2 = _Property_317e8becc0724841a13cbcf8d4c4efbc_Out_0[1];
            float _Split_3dee68ff9a374966b7612da59c6ac20a_B_3 = _Property_317e8becc0724841a13cbcf8d4c4efbc_Out_0[2];
            float _Split_3dee68ff9a374966b7612da59c6ac20a_A_4 = _Property_317e8becc0724841a13cbcf8d4c4efbc_Out_0[3];
            float4 _Combine_4e3ec9a6e4064091bba919631e732b7a_RGBA_4;
            float3 _Combine_4e3ec9a6e4064091bba919631e732b7a_RGB_5;
            float2 _Combine_4e3ec9a6e4064091bba919631e732b7a_RG_6;
            Unity_Combine_float(_Split_3dee68ff9a374966b7612da59c6ac20a_R_1, _Split_3dee68ff9a374966b7612da59c6ac20a_G_2, 0, 0, _Combine_4e3ec9a6e4064091bba919631e732b7a_RGBA_4, _Combine_4e3ec9a6e4064091bba919631e732b7a_RGB_5, _Combine_4e3ec9a6e4064091bba919631e732b7a_RG_6);
            float4 _Combine_6f976751f1234c77908b163e59da18bb_RGBA_4;
            float3 _Combine_6f976751f1234c77908b163e59da18bb_RGB_5;
            float2 _Combine_6f976751f1234c77908b163e59da18bb_RG_6;
            Unity_Combine_float(_Split_3dee68ff9a374966b7612da59c6ac20a_B_3, _Split_3dee68ff9a374966b7612da59c6ac20a_A_4, 0, 0, _Combine_6f976751f1234c77908b163e59da18bb_RGBA_4, _Combine_6f976751f1234c77908b163e59da18bb_RGB_5, _Combine_6f976751f1234c77908b163e59da18bb_RG_6);
            float _Remap_a11bf825d8d54f198c2355e6d3cc1fba_Out_3;
            Unity_Remap_float(_Power_318bede735044ec6811f2a5c345b7d73_Out_2, _Combine_4e3ec9a6e4064091bba919631e732b7a_RG_6, _Combine_6f976751f1234c77908b163e59da18bb_RG_6, _Remap_a11bf825d8d54f198c2355e6d3cc1fba_Out_3);
            float _Absolute_553a57701af34a45a18ca7b2af677c8a_Out_1;
            Unity_Absolute_float(_Remap_a11bf825d8d54f198c2355e6d3cc1fba_Out_3, _Absolute_553a57701af34a45a18ca7b2af677c8a_Out_1);
            float _Smoothstep_6babd4aa745b40db842b941b96adf7e9_Out_3;
            Unity_Smoothstep_float(_Property_7d8e49b5efe94dea8210c34a6319b1ef_Out_0, _Property_09307b889e8945078bacabda50cca5c6_Out_0, _Absolute_553a57701af34a45a18ca7b2af677c8a_Out_1, _Smoothstep_6babd4aa745b40db842b941b96adf7e9_Out_3);
            float _Property_17631cb6b51c44b593b4fb1f0ac8fa75_Out_0 = _Base_Speed;
            float _Multiply_2e98faddc46143bea8e48ab17d0e1c15_Out_2;
            Unity_Multiply_float_float(IN.TimeParameters.x, _Property_17631cb6b51c44b593b4fb1f0ac8fa75_Out_0, _Multiply_2e98faddc46143bea8e48ab17d0e1c15_Out_2);
            float2 _TilingAndOffset_d8c83d87b12649f7b6a3902973c4457a_Out_3;
            Unity_TilingAndOffset_float((_RotateAboutAxis_1b91481bceed4e9a82a13975af123b02_Out_3.xy), float2 (1, 1), (_Multiply_2e98faddc46143bea8e48ab17d0e1c15_Out_2.xx), _TilingAndOffset_d8c83d87b12649f7b6a3902973c4457a_Out_3);
            float _Property_2792df33a4d44e20b2f71fe244d5f369_Out_0 = _Base_Scale;
            float _GradientNoise_702d412fe90e4c64b91e9defbe1ffff2_Out_2;
            Unity_GradientNoise_float(_TilingAndOffset_d8c83d87b12649f7b6a3902973c4457a_Out_3, _Property_2792df33a4d44e20b2f71fe244d5f369_Out_0, _GradientNoise_702d412fe90e4c64b91e9defbe1ffff2_Out_2);
            float _Property_a965b78b3be84255ae4ff1617bd2df01_Out_0 = _BaseStrength;
            float _Multiply_9880df30952a454781c1f0c8356100dd_Out_2;
            Unity_Multiply_float_float(_GradientNoise_702d412fe90e4c64b91e9defbe1ffff2_Out_2, _Property_a965b78b3be84255ae4ff1617bd2df01_Out_0, _Multiply_9880df30952a454781c1f0c8356100dd_Out_2);
            float _Add_98d9cdbb65e44e0282692d35bd9d237b_Out_2;
            Unity_Add_float(_Smoothstep_6babd4aa745b40db842b941b96adf7e9_Out_3, _Multiply_9880df30952a454781c1f0c8356100dd_Out_2, _Add_98d9cdbb65e44e0282692d35bd9d237b_Out_2);
            float _Add_d305fd085a9b459da3d4bd5108430b3f_Out_2;
            Unity_Add_float(1, _Property_a965b78b3be84255ae4ff1617bd2df01_Out_0, _Add_d305fd085a9b459da3d4bd5108430b3f_Out_2);
            float _Divide_55db7b7a0b8b481d83fb512a13a2dba6_Out_2;
            Unity_Divide_float(_Add_98d9cdbb65e44e0282692d35bd9d237b_Out_2, _Add_d305fd085a9b459da3d4bd5108430b3f_Out_2, _Divide_55db7b7a0b8b481d83fb512a13a2dba6_Out_2);
            float _Property_5a371e38a60143fcae81da7313c1bf15_Out_0 = _Fresnel_Power;
            float _FresnelEffect_4c470240dea248acb0092676d71437cb_Out_3;
            Unity_FresnelEffect_float(IN.WorldSpaceNormal, IN.WorldSpaceViewDirection, _Property_5a371e38a60143fcae81da7313c1bf15_Out_0, _FresnelEffect_4c470240dea248acb0092676d71437cb_Out_3);
            float _Multiply_384d15a2ef094b7e8b1ec6d69dada246_Out_2;
            Unity_Multiply_float_float(_Divide_55db7b7a0b8b481d83fb512a13a2dba6_Out_2, _FresnelEffect_4c470240dea248acb0092676d71437cb_Out_3, _Multiply_384d15a2ef094b7e8b1ec6d69dada246_Out_2);
            float _Property_3c23366c651c4949b03cb10c14ae0a27_Out_0 = _Fresnel_Opacity;
            float _Multiply_9380e32f6e4644e1b42e398229c18d31_Out_2;
            Unity_Multiply_float_float(_Multiply_384d15a2ef094b7e8b1ec6d69dada246_Out_2, _Property_3c23366c651c4949b03cb10c14ae0a27_Out_0, _Multiply_9380e32f6e4644e1b42e398229c18d31_Out_2);
            float4 _Property_dff39e3157cb4a09aac968677ade995d_Out_0 = _Color_Valley;
            float4 _Property_1b300af9e23e428fa893e55f9390600d_Out_0 = _Color_Peak;
            float4 _Lerp_6d0a20bb25554e1fa8697f473485e856_Out_3;
            Unity_Lerp_float4(_Property_dff39e3157cb4a09aac968677ade995d_Out_0, _Property_1b300af9e23e428fa893e55f9390600d_Out_0, (_Add_98d9cdbb65e44e0282692d35bd9d237b_Out_2.xxxx), _Lerp_6d0a20bb25554e1fa8697f473485e856_Out_3);
            float4 _Add_6507a6920d9c478888f235ad9d0bb542_Out_2;
            Unity_Add_float4((_Multiply_9380e32f6e4644e1b42e398229c18d31_Out_2.xxxx), _Lerp_6d0a20bb25554e1fa8697f473485e856_Out_3, _Add_6507a6920d9c478888f235ad9d0bb542_Out_2);
            float _Property_9cf7107417e042afb41766bb37be827b_Out_0 = _Emission_Strength;
            float4 _Multiply_31ae534c0cc640be9fda8de7cc705bbf_Out_2;
            Unity_Multiply_float4_float4(_Add_6507a6920d9c478888f235ad9d0bb542_Out_2, (_Property_9cf7107417e042afb41766bb37be827b_Out_0.xxxx), _Multiply_31ae534c0cc640be9fda8de7cc705bbf_Out_2);
            float _SceneDepth_619a7e0097894c29ba4557fde6cbb174_Out_1;
            Unity_SceneDepth_Eye_float(float4(IN.ScreenPosition.xy / IN.ScreenPosition.w, 0, 0), _SceneDepth_619a7e0097894c29ba4557fde6cbb174_Out_1);
            float4 _ScreenPosition_ee728e739f744068b0d15c1205d618a0_Out_0 = IN.ScreenPosition;
            float _Split_d5d8a30c527c46a19ab94602c057016e_R_1 = _ScreenPosition_ee728e739f744068b0d15c1205d618a0_Out_0[0];
            float _Split_d5d8a30c527c46a19ab94602c057016e_G_2 = _ScreenPosition_ee728e739f744068b0d15c1205d618a0_Out_0[1];
            float _Split_d5d8a30c527c46a19ab94602c057016e_B_3 = _ScreenPosition_ee728e739f744068b0d15c1205d618a0_Out_0[2];
            float _Split_d5d8a30c527c46a19ab94602c057016e_A_4 = _ScreenPosition_ee728e739f744068b0d15c1205d618a0_Out_0[3];
            float _Subtract_07eb78fa00d74ade84172a64a4a4616c_Out_2;
            Unity_Subtract_float(_Split_d5d8a30c527c46a19ab94602c057016e_A_4, 1, _Subtract_07eb78fa00d74ade84172a64a4a4616c_Out_2);
            float _Subtract_3ef0962257844c2c87b9ff8d165099f3_Out_2;
            Unity_Subtract_float(_SceneDepth_619a7e0097894c29ba4557fde6cbb174_Out_1, _Subtract_07eb78fa00d74ade84172a64a4a4616c_Out_2, _Subtract_3ef0962257844c2c87b9ff8d165099f3_Out_2);
            float _Property_9167e3d66076450baeb620b8f8b66552_Out_0 = _Depth_Fade;
            float _Divide_9a1ae8922923443883cbd9e71941de32_Out_2;
            Unity_Divide_float(_Subtract_3ef0962257844c2c87b9ff8d165099f3_Out_2, _Property_9167e3d66076450baeb620b8f8b66552_Out_0, _Divide_9a1ae8922923443883cbd9e71941de32_Out_2);
            float _Saturate_791ce4d2963e420ba68a97fca0bef8f9_Out_1;
            Unity_Saturate_float(_Divide_9a1ae8922923443883cbd9e71941de32_Out_2, _Saturate_791ce4d2963e420ba68a97fca0bef8f9_Out_1);
            surface.BaseColor = (_Add_6507a6920d9c478888f235ad9d0bb542_Out_2.xyz);
            surface.Emission = (_Multiply_31ae534c0cc640be9fda8de7cc705bbf_Out_2.xyz);
            surface.Alpha = _Saturate_791ce4d2963e420ba68a97fca0bef8f9_Out_1;
            {
                surface.VTPackedFeedback = float4(1.0f,1.0f,1.0f,1.0f);
            }
            return surface;
        }
        
            // --------------------------------------------------
            // Build Graph Inputs
            #ifdef HAVE_VFX_MODIFICATION
            #define VFX_SRP_ATTRIBUTES AttributesMesh
            #define VaryingsMeshType VaryingsMeshToPS
            #define VFX_SRP_VARYINGS VaryingsMeshType
            #define VFX_SRP_SURFACE_INPUTS FragInputs
            #endif
            
        VertexDescriptionInputs AttributesMeshToVertexDescriptionInputs(AttributesMesh input)
        {
            VertexDescriptionInputs output;
            ZERO_INITIALIZE(VertexDescriptionInputs, output);
        
            output.ObjectSpaceNormal =                          input.normalOS;
            output.ObjectSpaceTangent =                         input.tangentOS.xyz;
            output.ObjectSpacePosition =                        input.positionOS;
            output.TimeParameters =                             _TimeParameters.xyz; // Note: in case of animation this will be overwrite (allow to handle motion vector)
        
            return output;
        }
        
        VertexDescription GetVertexDescription(AttributesMesh input, float3 timeParameters
        #ifdef HAVE_VFX_MODIFICATION
            , AttributesElement element
        #endif
        )
        {
            // build graph inputs
            VertexDescriptionInputs vertexDescriptionInputs = AttributesMeshToVertexDescriptionInputs(input);
            // Override time parameters with used one (This is required to correctly handle motion vector for vertex animation based on time)
            vertexDescriptionInputs.TimeParameters = timeParameters;
        
            // evaluate vertex graph
        #ifdef HAVE_VFX_MODIFICATION
            GraphProperties properties;
            ZERO_INITIALIZE(GraphProperties, properties);
        
            // Fetch the vertex graph properties for the particle instance.
            GetElementVertexProperties(element, properties);
        
            VertexDescription vertexDescription = VertexDescriptionFunction(vertexDescriptionInputs, properties);
        #else
            VertexDescription vertexDescription = VertexDescriptionFunction(vertexDescriptionInputs);
        #endif
            return vertexDescription;
        
        }
        
        AttributesMesh ApplyMeshModification(AttributesMesh input, float3 timeParameters
        #ifdef USE_CUSTOMINTERP_SUBSTRUCT
            #ifdef TESSELLATION_ON
            , inout VaryingsMeshToDS varyings
            #else
            , inout VaryingsMeshToPS varyings
            #endif
        #endif
        #ifdef HAVE_VFX_MODIFICATION
                , AttributesElement element
        #endif
            )
        {
            VertexDescription vertexDescription = GetVertexDescription(input, timeParameters
        #ifdef HAVE_VFX_MODIFICATION
                , element
        #endif
            );
        
            // copy graph output to the results
            input.positionOS = vertexDescription.Position;
            input.normalOS = vertexDescription.Normal;
            input.tangentOS.xyz = vertexDescription.Tangent;
        
            
        
            return input;
        }
        
        #if defined(_ADD_CUSTOM_VELOCITY) // For shader graph custom velocity
        // Return precomputed Velocity in object space
        float3 GetCustomVelocity(AttributesMesh input
        #ifdef HAVE_VFX_MODIFICATION
            , AttributesElement element
        #endif
        )
        {
            VertexDescription vertexDescription = GetVertexDescription(input, _TimeParameters.xyz
        #ifdef HAVE_VFX_MODIFICATION
                , element
        #endif
            );
            return vertexDescription.CustomVelocity;
        }
        #endif
        
        FragInputs BuildFragInputs(VaryingsMeshToPS input)
        {
            FragInputs output;
            ZERO_INITIALIZE(FragInputs, output);
        
            // Init to some default value to make the computer quiet (else it output 'divide by zero' warning even if value is not used).
            // TODO: this is a really poor workaround, but the variable is used in a bunch of places
            // to compute normals which are then passed on elsewhere to compute other values...
            output.tangentToWorld = k_identity3x3;
            output.positionSS = input.positionCS;       // input.positionCS is SV_Position
        
            output.positionRWS =                input.positionRWS;
            output.tangentToWorld =             BuildTangentToWorld(input.tangentWS, input.normalWS);
        
        #ifdef HAVE_VFX_MODIFICATION
            // FragInputs from VFX come from two places: Interpolator or CBuffer.
            /* WARNING: $splice Could not find named fragment 'VFXSetFragInputs' */
        
        #endif
        
            // splice point to copy custom interpolator fields from varyings to frag inputs
            
        
            return output;
        }
        
        // existing HDRP code uses the combined function to go directly from packed to frag inputs
        FragInputs UnpackVaryingsMeshToFragInputs(PackedVaryingsMeshToPS input)
        {
            UNITY_SETUP_INSTANCE_ID(input);
            VaryingsMeshToPS unpacked = UnpackVaryingsMeshToPS(input);
            return BuildFragInputs(unpacked);
        }
            SurfaceDescriptionInputs FragInputsToSurfaceDescriptionInputs(FragInputs input, float3 viewWS)
        {
            SurfaceDescriptionInputs output;
            ZERO_INITIALIZE(SurfaceDescriptionInputs, output);
        
            output.WorldSpaceNormal =                           normalize(input.tangentToWorld[2].xyz);
            #if defined(SHADER_STAGE_RAY_TRACING)
            #else
            #endif
            output.WorldSpaceViewDirection =                    normalize(viewWS);
            output.WorldSpacePosition =                         input.positionRWS;
            output.ObjectSpacePosition =                        TransformWorldToObject(input.positionRWS);
            output.ScreenPosition =                             ComputeScreenPos(TransformWorldToHClip(input.positionRWS), _ProjectionParams.x);
            output.TimeParameters =                             _TimeParameters.xyz; // This is mainly for LW as HD overwrite this value
        
            // splice point to copy frag inputs custom interpolator pack into the SDI
            
        
            return output;
        }
        
            // --------------------------------------------------
            // Build Surface Data (Specific Material)
        
        void BuildSurfaceData(FragInputs fragInputs, inout SurfaceDescription surfaceDescription, float3 V, PositionInputs posInput, out SurfaceData surfaceData)
        {
            // setup defaults -- these are used if the graph doesn't output a value
            ZERO_INITIALIZE(SurfaceData, surfaceData);
        
            // copy across graph values, if defined
            surfaceData.color = surfaceDescription.BaseColor;
        
            #ifdef WRITE_NORMAL_BUFFER
            // When we need to export the normal (in the depth prepass, we write the geometry one)
            surfaceData.normalWS = fragInputs.tangentToWorld[2];
            #endif
        
            #if defined(DEBUG_DISPLAY)
            if (_DebugMipMapMode != DEBUGMIPMAPMODE_NONE)
            {
                // TODO
            }
            #endif
        
            #ifdef _ENABLE_SHADOW_MATTE
        
                #if (SHADERPASS == SHADERPASS_FORWARD_UNLIT) || (SHADERPASS == SHADERPASS_RAYTRACING_GBUFFER) || (SHADERPASS == SHADERPASS_RAYTRACING_INDIRECT) || (SHADERPASS == SHADERPASS_RAYTRACING_FORWARD)
        
                    HDShadowContext shadowContext = InitShadowContext();
        
                    // Evaluate the shadow, the normal is guaranteed if shadow matte is enabled on this shader.
                    float3 shadow3;
                    ShadowLoopMin(shadowContext, posInput, normalize(fragInputs.tangentToWorld[2]), asuint(_ShadowMatteFilter), GetMeshRenderingLightLayer(), shadow3);
        
                    // Compute the average value in the fourth channel
                    float4 shadow = float4(shadow3, dot(shadow3, float3(1.0/3.0, 1.0/3.0, 1.0/3.0)));
        
                    float4 shadowColor = (1.0 - shadow) * surfaceDescription.ShadowTint.rgba;
                    float  localAlpha  = saturate(shadowColor.a + surfaceDescription.Alpha);
        
                    // Keep the nested lerp
                    // With no Color (bsdfData.color.rgb, bsdfData.color.a == 0.0f), just use ShadowColor*Color to avoid a ring of "white" around the shadow
                    // And mix color to consider the Color & ShadowColor alpha (from texture or/and color picker)
                    #ifdef _SURFACE_TYPE_TRANSPARENT
                        surfaceData.color = lerp(shadowColor.rgb * surfaceData.color, lerp(lerp(shadowColor.rgb, surfaceData.color, 1.0 - surfaceDescription.ShadowTint.a), surfaceData.color, shadow.rgb), surfaceDescription.Alpha);
                    #else
                        surfaceData.color = lerp(lerp(shadowColor.rgb, surfaceData.color, 1.0 - surfaceDescription.ShadowTint.a), surfaceData.color, shadow.rgb);
                    #endif
                    localAlpha = ApplyBlendMode(surfaceData.color, localAlpha).a;
        
                    surfaceDescription.Alpha = localAlpha;
        
                #elif SHADERPASS == SHADERPASS_PATH_TRACING
        
                    surfaceData.normalWS = fragInputs.tangentToWorld[2];
                    surfaceData.shadowTint = surfaceDescription.ShadowTint.rgba;
        
                #endif
        
            #endif // _ENABLE_SHADOW_MATTE
        }
        
            // --------------------------------------------------
            // Get Surface And BuiltinData
        
            void GetSurfaceAndBuiltinData(FragInputs fragInputs, float3 V, inout PositionInputs posInput, out SurfaceData surfaceData, out BuiltinData builtinData RAY_TRACING_OPTIONAL_PARAMETERS)
            {
                // Don't dither if displaced tessellation (we're fading out the displacement instead to match the next LOD)
                #if !defined(SHADER_STAGE_RAY_TRACING) && !defined(_TESSELLATION_DISPLACEMENT)
                #ifdef LOD_FADE_CROSSFADE // enable dithering LOD transition if user select CrossFade transition in LOD group
                LODDitheringTransition(ComputeFadeMaskSeed(V, posInput.positionSS), unity_LODFade.x);
                #endif
                #endif
        
                #ifndef SHADER_UNLIT
                #ifdef _DOUBLESIDED_ON
                    float3 doubleSidedConstants = _DoubleSidedConstants.xyz;
                #else
                    float3 doubleSidedConstants = float3(1.0, 1.0, 1.0);
                #endif
        
                ApplyDoubleSidedFlipOrMirror(fragInputs, doubleSidedConstants); // Apply double sided flip on the vertex normal
                #endif // SHADER_UNLIT
        
                SurfaceDescriptionInputs surfaceDescriptionInputs = FragInputsToSurfaceDescriptionInputs(fragInputs, V);
        
                #if defined(HAVE_VFX_MODIFICATION)
                GraphProperties properties;
                ZERO_INITIALIZE(GraphProperties, properties);
        
                GetElementPixelProperties(fragInputs, properties);
        
                SurfaceDescription surfaceDescription = SurfaceDescriptionFunction(surfaceDescriptionInputs, properties);
                #else
                SurfaceDescription surfaceDescription = SurfaceDescriptionFunction(surfaceDescriptionInputs);
                #endif
        
                // Perform alpha test very early to save performance (a killed pixel will not sample textures)
                // TODO: split graph evaluation to grab just alpha dependencies first? tricky..
                #ifdef _ALPHATEST_ON
                    float alphaCutoff = surfaceDescription.AlphaClipThreshold;
                    #if SHADERPASS == SHADERPASS_TRANSPARENT_DEPTH_PREPASS
                    // The TransparentDepthPrepass is also used with SSR transparent.
                    // If an artists enable transaprent SSR but not the TransparentDepthPrepass itself, then we use AlphaClipThreshold
                    // otherwise if TransparentDepthPrepass is enabled we use AlphaClipThresholdDepthPrepass
                    #elif SHADERPASS == SHADERPASS_TRANSPARENT_DEPTH_POSTPASS
                    // DepthPostpass always use its own alpha threshold
                    alphaCutoff = surfaceDescription.AlphaClipThresholdDepthPostpass;
                    #elif (SHADERPASS == SHADERPASS_SHADOWS) || (SHADERPASS == SHADERPASS_RAYTRACING_VISIBILITY)
                    // If use shadow threshold isn't enable we don't allow any test
                    #endif
        
                    GENERIC_ALPHA_TEST(surfaceDescription.Alpha, alphaCutoff);
                #endif
        
                #if !defined(SHADER_STAGE_RAY_TRACING) && _DEPTHOFFSET_ON
                ApplyDepthOffsetPositionInput(V, surfaceDescription.DepthOffset, GetViewForwardDir(), GetWorldToHClipMatrix(), posInput);
                #endif
        
                #ifndef SHADER_UNLIT
                float3 bentNormalWS;
                BuildSurfaceData(fragInputs, surfaceDescription, V, posInput, surfaceData, bentNormalWS);
        
                #ifdef FRAG_INPUTS_USE_TEXCOORD1
                    float4 lightmapTexCoord1 = fragInputs.texCoord1;
                #else
                    float4 lightmapTexCoord1 = float4(0,0,0,0);
                #endif
        
                #ifdef FRAG_INPUTS_USE_TEXCOORD2
                    float4 lightmapTexCoord2 = fragInputs.texCoord2;
                #else
                    float4 lightmapTexCoord2 = float4(0,0,0,0);
                #endif
        
                // Builtin Data
                // For back lighting we use the oposite vertex normal
                InitBuiltinData(posInput, surfaceDescription.Alpha, bentNormalWS, -fragInputs.tangentToWorld[2], lightmapTexCoord1, lightmapTexCoord2, builtinData);
        
                #else
                BuildSurfaceData(fragInputs, surfaceDescription, V, posInput, surfaceData);
        
                ZERO_BUILTIN_INITIALIZE(builtinData); // No call to InitBuiltinData as we don't have any lighting
                builtinData.opacity = surfaceDescription.Alpha;
        
                #if defined(DEBUG_DISPLAY)
                    // Light Layers are currently not used for the Unlit shader (because it is not lit)
                    // But Unlit objects do cast shadows according to their rendering layer mask, which is what we want to
                    // display in the light layers visualization mode, therefore we need the renderingLayers
                    builtinData.renderingLayers = GetMeshRenderingLightLayer();
                #endif
        
                #endif // SHADER_UNLIT
        
                #ifdef _ALPHATEST_ON
                    // Used for sharpening by alpha to mask - Alpha to covertage is only used with depth only and forward pass (no shadow pass, no transparent pass)
                    builtinData.alphaClipTreshold = alphaCutoff;
                #endif
        
                // override sampleBakedGI - not used by Unlit
        
                builtinData.emissiveColor = surfaceDescription.Emission;
        
                // Note this will not fully work on transparent surfaces (can check with _SURFACE_TYPE_TRANSPARENT define)
                // We will always overwrite vt feeback with the nearest. So behind transparent surfaces vt will not be resolved
                // This is a limitation of the current MRT approach.
                #ifdef UNITY_VIRTUAL_TEXTURING
                builtinData.vtPackedFeedback = surfaceDescription.VTPackedFeedback;
                #endif
        
                #if _DEPTHOFFSET_ON
                builtinData.depthOffset = surfaceDescription.DepthOffset;
                #endif
        
                // TODO: We should generate distortion / distortionBlur for non distortion pass
                #if (SHADERPASS == SHADERPASS_DISTORTION)
                builtinData.distortion = surfaceDescription.Distortion;
                builtinData.distortionBlur = surfaceDescription.DistortionBlur;
                #endif
        
                #ifndef SHADER_UNLIT
                // PostInitBuiltinData call ApplyDebugToBuiltinData
                PostInitBuiltinData(V, posInput, surfaceData, builtinData);
                #else
                ApplyDebugToBuiltinData(builtinData);
                #endif
        
                RAY_TRACING_OPTIONAL_ALPHA_TEST_PASS
            }
        
            // --------------------------------------------------
            // Main
        
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/ShaderPass/ShaderPassForwardUnlit.hlsl"
        
            // --------------------------------------------------
            // Visual Effect Vertex Invocations
        
        	#ifdef HAVE_VFX_MODIFICATION
        	#include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/VisualEffectVertex.hlsl"
        	#endif
        
            ENDHLSL
        }
        Pass
        {
            Name "FullScreenDebug"
            Tags
            {
                "LightMode" = "FullScreenDebug"
            }
        
            // Render State
            Cull [_CullMode]
        ZTest LEqual
        ZWrite Off
        
            // Debug
            // <None>
        
            // --------------------------------------------------
            // Pass
        
            HLSLPROGRAM
        
            // Pragmas
            #pragma instancing_options renderinglayer
        #pragma target 4.5
        #pragma vertex Vert
        #pragma fragment Frag
        #pragma only_renderers d3d11 playstation xboxone xboxseries vulkan metal switch
        #pragma multi_compile_instancing
        
            // Keywords
            #pragma shader_feature _ _SURFACE_TYPE_TRANSPARENT
        #pragma shader_feature_local _BLENDMODE_OFF _BLENDMODE_ALPHA _BLENDMODE_ADD _BLENDMODE_PRE_MULTIPLY
        #pragma shader_feature_local _ _ADD_PRECOMPUTED_VELOCITY
        #pragma shader_feature_local _ _TRANSPARENT_WRITES_MOTION_VEC
        #pragma shader_feature_local_fragment _ _ENABLE_FOG_ON_TRANSPARENT
            // GraphKeywords: <None>
        
            // Early Instancing Defines
            // DotsInstancingOptions: <None>
        
            // Injected Instanced Properties (must be included before UnityInstancing.hlsl)
            // HybridV1InjectedBuiltinProperties: <None>
        
            // For custom interpolators to inject a substruct definition before FragInputs definition,
            // allowing for FragInputs to capture CI's intended for ShaderGraph's SDI.
            struct CustomInterpolators
        {
        };
        #define USE_CUSTOMINTERP_SUBSTRUCT
        
        
        
            // TODO: Merge FragInputsVFX substruct with CustomInterpolators.
        	#ifdef HAVE_VFX_MODIFICATION
        	struct FragInputsVFX
            {
                /* WARNING: $splice Could not find named fragment 'FragInputsVFX' */
            };
            #endif
        
            #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Common.hlsl"
        	#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/GeometricTools.hlsl" // Required by Tessellation.hlsl
        	#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Tessellation.hlsl"
            #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Texture.hlsl"
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderVariables.hlsl"
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/ShaderPass/ShaderPass.cs.hlsl"
            #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/TextureStack.hlsl" // Required to be include before we include properties as it define DECLARE_STACK_CB
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderGraphHeader.hlsl" // Need to be here for Gradient struct definition
        
            // --------------------------------------------------
            // Defines
        
            // Attribute
            #define ATTRIBUTES_NEED_NORMAL
            #define ATTRIBUTES_NEED_TANGENT
            #define VARYINGS_NEED_POSITION_WS
            #define VARYINGS_NEED_TANGENT_TO_WORLD
        
            #define HAVE_MESH_MODIFICATION
        
            //Strip down the FragInputs.hlsl (on graphics), so we can only optimize the interpolators we use.
            //if by accident something requests contents of FragInputs.hlsl, it will be caught as a compiler error
            //Frag inputs stripping is only enabled when FRAG_INPUTS_ENABLE_STRIPPING is set
            #if !defined(SHADER_STAGE_RAY_TRACING) && SHADERPASS != SHADERPASS_RAYTRACING_GBUFFER && SHADERPASS != SHADERPASS_FULL_SCREEN_DEBUG
            #define FRAG_INPUTS_ENABLE_STRIPPING
            #endif
        
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/ShaderPass/FragInputs.hlsl"
        
        
        
            #define SHADERPASS SHADERPASS_FULL_SCREEN_DEBUG
        #define RAYTRACING_SHADER_GRAPH_DEFAULT
        #define REQUIRE_DEPTH_TEXTURE
        
        
            // Following two define are a workaround introduce in 10.1.x for RaytracingQualityNode
            // The ShaderGraph don't support correctly migration of this node as it serialize all the node data
            // in the json file making it impossible to uprgrade. Until we get a fix, we do a workaround here
            // to still allow us to rename the field and keyword of this node without breaking existing code.
            #ifdef RAYTRACING_SHADER_GRAPH_DEFAULT
            #define RAYTRACING_SHADER_GRAPH_HIGH
            #endif
        
            #ifdef RAYTRACING_SHADER_GRAPH_RAYTRACED
            #define RAYTRACING_SHADER_GRAPH_LOW
            #endif
            // end
        
            #ifndef SHADER_UNLIT
            // We need isFrontFace when using double sided - it is not required for unlit as in case of unlit double sided only drive the cullmode
            // VARYINGS_NEED_CULLFACE can be define by VaryingsMeshToPS.FaceSign input if a IsFrontFace Node is included in the shader graph.
            #if defined(_DOUBLESIDED_ON) && !defined(VARYINGS_NEED_CULLFACE)
                #define VARYINGS_NEED_CULLFACE
            #endif
            #endif
        
            // Specific Material Define
        // Setup a define to say we are an unlit shader
        #define SHADER_UNLIT
        
        // Following Macro are only used by Unlit material
        #if defined(_ENABLE_SHADOW_MATTE) && (SHADERPASS == SHADERPASS_FORWARD_UNLIT || SHADERPASS == SHADERPASS_PATH_TRACING)
        #define LIGHTLOOP_DISABLE_TILE_AND_CLUSTER
        #define HAS_LIGHTLOOP
        #endif
            // Caution: we can use the define SHADER_UNLIT onlit after the above Material include as it is the Unlit template who define it
        
            // To handle SSR on transparent correctly with a possibility to enable/disable it per framesettings
            // we should have a code like this:
            // if !defined(_DISABLE_SSR_TRANSPARENT)
            // pragma multi_compile _ WRITE_NORMAL_BUFFER
            // endif
            // i.e we enable the multicompile only if we can receive SSR or not, and then C# code drive
            // it based on if SSR transparent in frame settings and not (and stripper can strip it).
            // this is currently not possible with our current preprocessor as _DISABLE_SSR_TRANSPARENT is a keyword not a define
            // so instead we used this and chose to pay the extra cost of normal write even if SSR transaprent is disabled.
            // Ideally the shader graph generator should handle it but condition below can't be handle correctly for now.
            #if SHADERPASS == SHADERPASS_TRANSPARENT_DEPTH_PREPASS
            #if !defined(_DISABLE_SSR_TRANSPARENT) && !defined(SHADER_UNLIT)
                #define WRITE_NORMAL_BUFFER
            #endif
            #endif
        
            #ifndef DEBUG_DISPLAY
                // In case of opaque we don't want to perform the alpha test, it is done in depth prepass and we use depth equal for ztest (setup from UI)
                // Don't do it with debug display mode as it is possible there is no depth prepass in this case
                #if !defined(_SURFACE_TYPE_TRANSPARENT)
                    #if SHADERPASS == SHADERPASS_FORWARD
                    #define SHADERPASS_FORWARD_BYPASS_ALPHA_TEST
                    #elif SHADERPASS == SHADERPASS_GBUFFER
                    #define SHADERPASS_GBUFFER_BYPASS_ALPHA_TEST
                    #endif
                #endif
            #endif
        
            // Define _DEFERRED_CAPABLE_MATERIAL for shader capable to run in deferred pass
            #if defined(SHADER_LIT) && !defined(_SURFACE_TYPE_TRANSPARENT)
                #define _DEFERRED_CAPABLE_MATERIAL
            #endif
        
            // Translate transparent motion vector define
            #if defined(_TRANSPARENT_WRITES_MOTION_VEC) && defined(_SURFACE_TYPE_TRANSPARENT)
                #define _WRITE_TRANSPARENT_MOTION_VECTOR
            #endif
        
            // -- Graph Properties
            CBUFFER_START(UnityPerMaterial)
        float4 _Rotate_Projection;
        float _Noise_Scale;
        float _Speed;
        float _Vertexoffset;
        float4 _Remap_xy_zw;
        float4 _Color_Peak;
        float4 _Color_Valley;
        float _SmoothEdge1;
        float _SmoothEdge2;
        float _Cloud_Pow;
        float _Base_Scale;
        float _Base_Speed;
        float _BaseStrength;
        float _Emission_Strength;
        float _Curvate_Radius;
        float _Fresnel_Power;
        float _Fresnel_Opacity;
        float _Depth_Fade;
        float4 _EmissionColor;
        float _UseShadowThreshold;
        float4 _DoubleSidedConstants;
        float _BlendMode;
        float _EnableBlendModePreserveSpecularLighting;
        CBUFFER_END
        
        // Object and Global properties
        
            // -- Property used by ScenePickingPass
            #ifdef SCENEPICKINGPASS
            float4 _SelectionID;
            #endif
        
            // -- Properties used by SceneSelectionPass
            #ifdef SCENESELECTIONPASS
            int _ObjectId;
            int _PassValue;
            #endif
        
            // Includes
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/Debug/DebugDisplay.hlsl"
        #include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Material.hlsl"
        #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/NormalSurfaceGradient.hlsl"
        #include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Unlit/Unlit.hlsl"
        #include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/BuiltinUtilities.hlsl"
        #include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/MaterialUtilities.hlsl"
        #include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderGraphFunctions.hlsl"
        	// GraphIncludes: <None>
        
            // --------------------------------------------------
            // Structs and Packing
        
            struct AttributesMesh
        {
             float3 positionOS : POSITION;
             float3 normalOS : NORMAL;
             float4 tangentOS : TANGENT;
            #if UNITY_ANY_INSTANCING_ENABLED
             uint instanceID : INSTANCEID_SEMANTIC;
            #endif
        };
        struct VaryingsMeshToPS
        {
            SV_POSITION_QUALIFIERS float4 positionCS : SV_POSITION;
             float3 positionRWS;
             float3 normalWS;
             float4 tangentWS;
            #if UNITY_ANY_INSTANCING_ENABLED
             uint instanceID : CUSTOM_INSTANCE_ID;
            #endif
        };
        struct VertexDescriptionInputs
        {
             float3 ObjectSpaceNormal;
             float3 ObjectSpaceTangent;
             float3 ObjectSpacePosition;
             float3 TimeParameters;
        };
        struct SurfaceDescriptionInputs
        {
             float3 WorldSpaceNormal;
             float3 WorldSpaceViewDirection;
             float3 ObjectSpacePosition;
             float3 WorldSpacePosition;
             float4 ScreenPosition;
             float3 TimeParameters;
        };
        struct PackedVaryingsMeshToPS
        {
            SV_POSITION_QUALIFIERS float4 positionCS : SV_POSITION;
             float3 interp0 : INTERP0;
             float3 interp1 : INTERP1;
             float4 interp2 : INTERP2;
            #if UNITY_ANY_INSTANCING_ENABLED
             uint instanceID : CUSTOM_INSTANCE_ID;
            #endif
        };
        
            PackedVaryingsMeshToPS PackVaryingsMeshToPS (VaryingsMeshToPS input)
        {
            PackedVaryingsMeshToPS output;
            ZERO_INITIALIZE(PackedVaryingsMeshToPS, output);
            output.positionCS = input.positionCS;
            output.interp0.xyz =  input.positionRWS;
            output.interp1.xyz =  input.normalWS;
            output.interp2.xyzw =  input.tangentWS;
            #if UNITY_ANY_INSTANCING_ENABLED
            output.instanceID = input.instanceID;
            #endif
            return output;
        }
        
        VaryingsMeshToPS UnpackVaryingsMeshToPS (PackedVaryingsMeshToPS input)
        {
            VaryingsMeshToPS output;
            output.positionCS = input.positionCS;
            output.positionRWS = input.interp0.xyz;
            output.normalWS = input.interp1.xyz;
            output.tangentWS = input.interp2.xyzw;
            #if UNITY_ANY_INSTANCING_ENABLED
            output.instanceID = input.instanceID;
            #endif
            return output;
        }
        
        
            // --------------------------------------------------
            // Graph
        
        
            // Graph Functions
            
        void Unity_Distance_float3(float3 A, float3 B, out float Out)
        {
            Out = distance(A, B);
        }
        
        void Unity_Divide_float(float A, float B, out float Out)
        {
            Out = A / B;
        }
        
        void Unity_Power_float(float A, float B, out float Out)
        {
            Out = pow(A, B);
        }
        
        void Unity_Multiply_float3_float3(float3 A, float3 B, out float3 Out)
        {
            Out = A * B;
        }
        
        void Unity_Rotate_About_Axis_Radians_float(float3 In, float3 Axis, float Rotation, out float3 Out)
        {
            float s = sin(Rotation);
            float c = cos(Rotation);
            float one_minus_c = 1.0 - c;
        
            Axis = normalize(Axis);
        
            float3x3 rot_mat = { one_minus_c * Axis.x * Axis.x + c,            one_minus_c * Axis.x * Axis.y - Axis.z * s,     one_minus_c * Axis.z * Axis.x + Axis.y * s,
                                      one_minus_c * Axis.x * Axis.y + Axis.z * s,   one_minus_c * Axis.y * Axis.y + c,              one_minus_c * Axis.y * Axis.z - Axis.x * s,
                                      one_minus_c * Axis.z * Axis.x - Axis.y * s,   one_minus_c * Axis.y * Axis.z + Axis.x * s,     one_minus_c * Axis.z * Axis.z + c
                                    };
        
            Out = mul(rot_mat,  In);
        }
        
        void Unity_Multiply_float_float(float A, float B, out float Out)
        {
            Out = A * B;
        }
        
        void Unity_TilingAndOffset_float(float2 UV, float2 Tiling, float2 Offset, out float2 Out)
        {
            Out = UV * Tiling + Offset;
        }
        
        
        float2 Unity_GradientNoise_Dir_float(float2 p)
        {
            // Permutation and hashing used in webgl-nosie goo.gl/pX7HtC
            p = p % 289;
            // need full precision, otherwise half overflows when p > 1
            float x = float(34 * p.x + 1) * p.x % 289 + p.y;
            x = (34 * x + 1) * x % 289;
            x = frac(x / 41) * 2 - 1;
            return normalize(float2(x - floor(x + 0.5), abs(x) - 0.5));
        }
        
        void Unity_GradientNoise_float(float2 UV, float Scale, out float Out)
        {
            float2 p = UV * Scale;
            float2 ip = floor(p);
            float2 fp = frac(p);
            float d00 = dot(Unity_GradientNoise_Dir_float(ip), fp);
            float d01 = dot(Unity_GradientNoise_Dir_float(ip + float2(0, 1)), fp - float2(0, 1));
            float d10 = dot(Unity_GradientNoise_Dir_float(ip + float2(1, 0)), fp - float2(1, 0));
            float d11 = dot(Unity_GradientNoise_Dir_float(ip + float2(1, 1)), fp - float2(1, 1));
            fp = fp * fp * fp * (fp * (fp * 6 - 15) + 10);
            Out = lerp(lerp(d00, d01, fp.y), lerp(d10, d11, fp.y), fp.x) + 0.5;
        }
        
        void Unity_Add_float(float A, float B, out float Out)
        {
            Out = A + B;
        }
        
        void Unity_Saturate_float(float In, out float Out)
        {
            Out = saturate(In);
        }
        
        void Unity_Combine_float(float R, float G, float B, float A, out float4 RGBA, out float3 RGB, out float2 RG)
        {
            RGBA = float4(R, G, B, A);
            RGB = float3(R, G, B);
            RG = float2(R, G);
        }
        
        void Unity_Remap_float(float In, float2 InMinMax, float2 OutMinMax, out float Out)
        {
            Out = OutMinMax.x + (In - InMinMax.x) * (OutMinMax.y - OutMinMax.x) / (InMinMax.y - InMinMax.x);
        }
        
        void Unity_Absolute_float(float In, out float Out)
        {
            Out = abs(In);
        }
        
        void Unity_Smoothstep_float(float Edge1, float Edge2, float In, out float Out)
        {
            Out = smoothstep(Edge1, Edge2, In);
        }
        
        void Unity_Add_float3(float3 A, float3 B, out float3 Out)
        {
            Out = A + B;
        }
        
        void Unity_FresnelEffect_float(float3 Normal, float3 ViewDir, float Power, out float Out)
        {
            Out = pow((1.0 - saturate(dot(normalize(Normal), normalize(ViewDir)))), Power);
        }
        
        void Unity_Lerp_float4(float4 A, float4 B, float4 T, out float4 Out)
        {
            Out = lerp(A, B, T);
        }
        
        void Unity_Add_float4(float4 A, float4 B, out float4 Out)
        {
            Out = A + B;
        }
        
        void Unity_Multiply_float4_float4(float4 A, float4 B, out float4 Out)
        {
            Out = A * B;
        }
        
        void Unity_SceneDepth_Eye_float(float4 UV, out float Out)
        {
            if (unity_OrthoParams.w == 1.0)
            {
                Out = LinearEyeDepth(ComputeWorldSpacePosition(UV.xy, SHADERGRAPH_SAMPLE_SCENE_DEPTH(UV.xy), UNITY_MATRIX_I_VP), UNITY_MATRIX_V);
            }
            else
            {
                Out = LinearEyeDepth(SHADERGRAPH_SAMPLE_SCENE_DEPTH(UV.xy), _ZBufferParams);
            }
        }
        
        void Unity_Subtract_float(float A, float B, out float Out)
        {
            Out = A - B;
        }
        
            // Graph Vertex
            struct VertexDescription
        {
            float3 Position;
            float3 Normal;
            float3 Tangent;
        };
        
        VertexDescription VertexDescriptionFunction(VertexDescriptionInputs IN)
        {
            VertexDescription description = (VertexDescription)0;
            float _Distance_389dd396e31949b9a8a01d35896316a6_Out_2;
            Unity_Distance_float3(SHADERGRAPH_OBJECT_POSITION, IN.ObjectSpacePosition, _Distance_389dd396e31949b9a8a01d35896316a6_Out_2);
            float _Property_d58669debb0246fe82fb0fb0bffa2edc_Out_0 = _Curvate_Radius;
            float _Divide_0b143990dbbc4cbdb5129fcbf5511012_Out_2;
            Unity_Divide_float(_Distance_389dd396e31949b9a8a01d35896316a6_Out_2, _Property_d58669debb0246fe82fb0fb0bffa2edc_Out_0, _Divide_0b143990dbbc4cbdb5129fcbf5511012_Out_2);
            float _Power_89ab1e29e2cb42a9acd2aed36f4fdcfe_Out_2;
            Unity_Power_float(_Divide_0b143990dbbc4cbdb5129fcbf5511012_Out_2, 2, _Power_89ab1e29e2cb42a9acd2aed36f4fdcfe_Out_2);
            float3 _Multiply_22e187ffacc7402bbe63087272b7efb5_Out_2;
            Unity_Multiply_float3_float3(IN.ObjectSpaceNormal, (_Power_89ab1e29e2cb42a9acd2aed36f4fdcfe_Out_2.xxx), _Multiply_22e187ffacc7402bbe63087272b7efb5_Out_2);
            float _Property_7d8e49b5efe94dea8210c34a6319b1ef_Out_0 = _SmoothEdge1;
            float _Property_09307b889e8945078bacabda50cca5c6_Out_0 = _SmoothEdge2;
            float4 _Property_a8d53d7ea07349e0979b956475bdd7cc_Out_0 = _Rotate_Projection;
            float _Split_7d12b2bb5feb46d685603473d0cf5818_R_1 = _Property_a8d53d7ea07349e0979b956475bdd7cc_Out_0[0];
            float _Split_7d12b2bb5feb46d685603473d0cf5818_G_2 = _Property_a8d53d7ea07349e0979b956475bdd7cc_Out_0[1];
            float _Split_7d12b2bb5feb46d685603473d0cf5818_B_3 = _Property_a8d53d7ea07349e0979b956475bdd7cc_Out_0[2];
            float _Split_7d12b2bb5feb46d685603473d0cf5818_A_4 = _Property_a8d53d7ea07349e0979b956475bdd7cc_Out_0[3];
            float3 _RotateAboutAxis_1b91481bceed4e9a82a13975af123b02_Out_3;
            Unity_Rotate_About_Axis_Radians_float(IN.ObjectSpacePosition, (_Property_a8d53d7ea07349e0979b956475bdd7cc_Out_0.xyz), _Split_7d12b2bb5feb46d685603473d0cf5818_A_4, _RotateAboutAxis_1b91481bceed4e9a82a13975af123b02_Out_3);
            float _Property_258f4645340c46f69274c9f077f1a73c_Out_0 = _Speed;
            float _Multiply_94f6d857831c4e69b53b9bfc92dd852f_Out_2;
            Unity_Multiply_float_float(IN.TimeParameters.x, _Property_258f4645340c46f69274c9f077f1a73c_Out_0, _Multiply_94f6d857831c4e69b53b9bfc92dd852f_Out_2);
            float2 _TilingAndOffset_6cb9fd57231c4a429c9c0fe5aeb7cc58_Out_3;
            Unity_TilingAndOffset_float((_RotateAboutAxis_1b91481bceed4e9a82a13975af123b02_Out_3.xy), float2 (1, 1), (_Multiply_94f6d857831c4e69b53b9bfc92dd852f_Out_2.xx), _TilingAndOffset_6cb9fd57231c4a429c9c0fe5aeb7cc58_Out_3);
            float _Property_2b9001a870d04f8eb60f5d7e1ce909c5_Out_0 = _Noise_Scale;
            float _GradientNoise_061679506b214bb8b4792ec4dfe82ec6_Out_2;
            Unity_GradientNoise_float(_TilingAndOffset_6cb9fd57231c4a429c9c0fe5aeb7cc58_Out_3, _Property_2b9001a870d04f8eb60f5d7e1ce909c5_Out_0, _GradientNoise_061679506b214bb8b4792ec4dfe82ec6_Out_2);
            float2 _TilingAndOffset_1d2491b5855e49d3b2e6b5dbe5db07d4_Out_3;
            Unity_TilingAndOffset_float((_RotateAboutAxis_1b91481bceed4e9a82a13975af123b02_Out_3.xy), float2 (1, 1), float2 (0, 0), _TilingAndOffset_1d2491b5855e49d3b2e6b5dbe5db07d4_Out_3);
            float _GradientNoise_8a27c3fb323f4db1b38f287380605198_Out_2;
            Unity_GradientNoise_float(_TilingAndOffset_1d2491b5855e49d3b2e6b5dbe5db07d4_Out_3, _Property_2b9001a870d04f8eb60f5d7e1ce909c5_Out_0, _GradientNoise_8a27c3fb323f4db1b38f287380605198_Out_2);
            float _Add_a6dd2d6e3f564decbca34ec03a419130_Out_2;
            Unity_Add_float(_GradientNoise_061679506b214bb8b4792ec4dfe82ec6_Out_2, _GradientNoise_8a27c3fb323f4db1b38f287380605198_Out_2, _Add_a6dd2d6e3f564decbca34ec03a419130_Out_2);
            float _Divide_a757ea7167f343ecaec30e69b58c9bae_Out_2;
            Unity_Divide_float(_Add_a6dd2d6e3f564decbca34ec03a419130_Out_2, 2, _Divide_a757ea7167f343ecaec30e69b58c9bae_Out_2);
            float _Saturate_f355ba5a467f4488b7ec89e8a08484a3_Out_1;
            Unity_Saturate_float(_Divide_a757ea7167f343ecaec30e69b58c9bae_Out_2, _Saturate_f355ba5a467f4488b7ec89e8a08484a3_Out_1);
            float _Property_96da655cc17e4594836aa02d74efe33c_Out_0 = _Cloud_Pow;
            float _Power_318bede735044ec6811f2a5c345b7d73_Out_2;
            Unity_Power_float(_Saturate_f355ba5a467f4488b7ec89e8a08484a3_Out_1, _Property_96da655cc17e4594836aa02d74efe33c_Out_0, _Power_318bede735044ec6811f2a5c345b7d73_Out_2);
            float4 _Property_317e8becc0724841a13cbcf8d4c4efbc_Out_0 = _Remap_xy_zw;
            float _Split_3dee68ff9a374966b7612da59c6ac20a_R_1 = _Property_317e8becc0724841a13cbcf8d4c4efbc_Out_0[0];
            float _Split_3dee68ff9a374966b7612da59c6ac20a_G_2 = _Property_317e8becc0724841a13cbcf8d4c4efbc_Out_0[1];
            float _Split_3dee68ff9a374966b7612da59c6ac20a_B_3 = _Property_317e8becc0724841a13cbcf8d4c4efbc_Out_0[2];
            float _Split_3dee68ff9a374966b7612da59c6ac20a_A_4 = _Property_317e8becc0724841a13cbcf8d4c4efbc_Out_0[3];
            float4 _Combine_4e3ec9a6e4064091bba919631e732b7a_RGBA_4;
            float3 _Combine_4e3ec9a6e4064091bba919631e732b7a_RGB_5;
            float2 _Combine_4e3ec9a6e4064091bba919631e732b7a_RG_6;
            Unity_Combine_float(_Split_3dee68ff9a374966b7612da59c6ac20a_R_1, _Split_3dee68ff9a374966b7612da59c6ac20a_G_2, 0, 0, _Combine_4e3ec9a6e4064091bba919631e732b7a_RGBA_4, _Combine_4e3ec9a6e4064091bba919631e732b7a_RGB_5, _Combine_4e3ec9a6e4064091bba919631e732b7a_RG_6);
            float4 _Combine_6f976751f1234c77908b163e59da18bb_RGBA_4;
            float3 _Combine_6f976751f1234c77908b163e59da18bb_RGB_5;
            float2 _Combine_6f976751f1234c77908b163e59da18bb_RG_6;
            Unity_Combine_float(_Split_3dee68ff9a374966b7612da59c6ac20a_B_3, _Split_3dee68ff9a374966b7612da59c6ac20a_A_4, 0, 0, _Combine_6f976751f1234c77908b163e59da18bb_RGBA_4, _Combine_6f976751f1234c77908b163e59da18bb_RGB_5, _Combine_6f976751f1234c77908b163e59da18bb_RG_6);
            float _Remap_a11bf825d8d54f198c2355e6d3cc1fba_Out_3;
            Unity_Remap_float(_Power_318bede735044ec6811f2a5c345b7d73_Out_2, _Combine_4e3ec9a6e4064091bba919631e732b7a_RG_6, _Combine_6f976751f1234c77908b163e59da18bb_RG_6, _Remap_a11bf825d8d54f198c2355e6d3cc1fba_Out_3);
            float _Absolute_553a57701af34a45a18ca7b2af677c8a_Out_1;
            Unity_Absolute_float(_Remap_a11bf825d8d54f198c2355e6d3cc1fba_Out_3, _Absolute_553a57701af34a45a18ca7b2af677c8a_Out_1);
            float _Smoothstep_6babd4aa745b40db842b941b96adf7e9_Out_3;
            Unity_Smoothstep_float(_Property_7d8e49b5efe94dea8210c34a6319b1ef_Out_0, _Property_09307b889e8945078bacabda50cca5c6_Out_0, _Absolute_553a57701af34a45a18ca7b2af677c8a_Out_1, _Smoothstep_6babd4aa745b40db842b941b96adf7e9_Out_3);
            float _Property_17631cb6b51c44b593b4fb1f0ac8fa75_Out_0 = _Base_Speed;
            float _Multiply_2e98faddc46143bea8e48ab17d0e1c15_Out_2;
            Unity_Multiply_float_float(IN.TimeParameters.x, _Property_17631cb6b51c44b593b4fb1f0ac8fa75_Out_0, _Multiply_2e98faddc46143bea8e48ab17d0e1c15_Out_2);
            float2 _TilingAndOffset_d8c83d87b12649f7b6a3902973c4457a_Out_3;
            Unity_TilingAndOffset_float((_RotateAboutAxis_1b91481bceed4e9a82a13975af123b02_Out_3.xy), float2 (1, 1), (_Multiply_2e98faddc46143bea8e48ab17d0e1c15_Out_2.xx), _TilingAndOffset_d8c83d87b12649f7b6a3902973c4457a_Out_3);
            float _Property_2792df33a4d44e20b2f71fe244d5f369_Out_0 = _Base_Scale;
            float _GradientNoise_702d412fe90e4c64b91e9defbe1ffff2_Out_2;
            Unity_GradientNoise_float(_TilingAndOffset_d8c83d87b12649f7b6a3902973c4457a_Out_3, _Property_2792df33a4d44e20b2f71fe244d5f369_Out_0, _GradientNoise_702d412fe90e4c64b91e9defbe1ffff2_Out_2);
            float _Property_a965b78b3be84255ae4ff1617bd2df01_Out_0 = _BaseStrength;
            float _Multiply_9880df30952a454781c1f0c8356100dd_Out_2;
            Unity_Multiply_float_float(_GradientNoise_702d412fe90e4c64b91e9defbe1ffff2_Out_2, _Property_a965b78b3be84255ae4ff1617bd2df01_Out_0, _Multiply_9880df30952a454781c1f0c8356100dd_Out_2);
            float _Add_98d9cdbb65e44e0282692d35bd9d237b_Out_2;
            Unity_Add_float(_Smoothstep_6babd4aa745b40db842b941b96adf7e9_Out_3, _Multiply_9880df30952a454781c1f0c8356100dd_Out_2, _Add_98d9cdbb65e44e0282692d35bd9d237b_Out_2);
            float _Add_d305fd085a9b459da3d4bd5108430b3f_Out_2;
            Unity_Add_float(1, _Property_a965b78b3be84255ae4ff1617bd2df01_Out_0, _Add_d305fd085a9b459da3d4bd5108430b3f_Out_2);
            float _Divide_55db7b7a0b8b481d83fb512a13a2dba6_Out_2;
            Unity_Divide_float(_Add_98d9cdbb65e44e0282692d35bd9d237b_Out_2, _Add_d305fd085a9b459da3d4bd5108430b3f_Out_2, _Divide_55db7b7a0b8b481d83fb512a13a2dba6_Out_2);
            float3 _Multiply_639bbd01ca0947fdbb4245744090b06e_Out_2;
            Unity_Multiply_float3_float3(IN.ObjectSpaceNormal, (_Divide_55db7b7a0b8b481d83fb512a13a2dba6_Out_2.xxx), _Multiply_639bbd01ca0947fdbb4245744090b06e_Out_2);
            float _Property_8b198d3112494fb98defdd5dc1b13601_Out_0 = _Vertexoffset;
            float3 _Multiply_2119a238e1d14c34879c4926fe468be5_Out_2;
            Unity_Multiply_float3_float3(_Multiply_639bbd01ca0947fdbb4245744090b06e_Out_2, (_Property_8b198d3112494fb98defdd5dc1b13601_Out_0.xxx), _Multiply_2119a238e1d14c34879c4926fe468be5_Out_2);
            float3 _Add_18a07d3e52a847f594f01810747a3393_Out_2;
            Unity_Add_float3(IN.ObjectSpacePosition, _Multiply_2119a238e1d14c34879c4926fe468be5_Out_2, _Add_18a07d3e52a847f594f01810747a3393_Out_2);
            float3 _Add_b9cf96b2dcd84792b2e40dd036537586_Out_2;
            Unity_Add_float3(_Multiply_22e187ffacc7402bbe63087272b7efb5_Out_2, _Add_18a07d3e52a847f594f01810747a3393_Out_2, _Add_b9cf96b2dcd84792b2e40dd036537586_Out_2);
            description.Position = _Add_b9cf96b2dcd84792b2e40dd036537586_Out_2;
            description.Normal = IN.ObjectSpaceNormal;
            description.Tangent = IN.ObjectSpaceTangent;
            return description;
        }
        
            // Graph Pixel
            struct SurfaceDescription
        {
            float3 BaseColor;
            float3 Emission;
            float Alpha;
        };
        
        SurfaceDescription SurfaceDescriptionFunction(SurfaceDescriptionInputs IN)
        {
            SurfaceDescription surface = (SurfaceDescription)0;
            float _Property_7d8e49b5efe94dea8210c34a6319b1ef_Out_0 = _SmoothEdge1;
            float _Property_09307b889e8945078bacabda50cca5c6_Out_0 = _SmoothEdge2;
            float4 _Property_a8d53d7ea07349e0979b956475bdd7cc_Out_0 = _Rotate_Projection;
            float _Split_7d12b2bb5feb46d685603473d0cf5818_R_1 = _Property_a8d53d7ea07349e0979b956475bdd7cc_Out_0[0];
            float _Split_7d12b2bb5feb46d685603473d0cf5818_G_2 = _Property_a8d53d7ea07349e0979b956475bdd7cc_Out_0[1];
            float _Split_7d12b2bb5feb46d685603473d0cf5818_B_3 = _Property_a8d53d7ea07349e0979b956475bdd7cc_Out_0[2];
            float _Split_7d12b2bb5feb46d685603473d0cf5818_A_4 = _Property_a8d53d7ea07349e0979b956475bdd7cc_Out_0[3];
            float3 _RotateAboutAxis_1b91481bceed4e9a82a13975af123b02_Out_3;
            Unity_Rotate_About_Axis_Radians_float(IN.ObjectSpacePosition, (_Property_a8d53d7ea07349e0979b956475bdd7cc_Out_0.xyz), _Split_7d12b2bb5feb46d685603473d0cf5818_A_4, _RotateAboutAxis_1b91481bceed4e9a82a13975af123b02_Out_3);
            float _Property_258f4645340c46f69274c9f077f1a73c_Out_0 = _Speed;
            float _Multiply_94f6d857831c4e69b53b9bfc92dd852f_Out_2;
            Unity_Multiply_float_float(IN.TimeParameters.x, _Property_258f4645340c46f69274c9f077f1a73c_Out_0, _Multiply_94f6d857831c4e69b53b9bfc92dd852f_Out_2);
            float2 _TilingAndOffset_6cb9fd57231c4a429c9c0fe5aeb7cc58_Out_3;
            Unity_TilingAndOffset_float((_RotateAboutAxis_1b91481bceed4e9a82a13975af123b02_Out_3.xy), float2 (1, 1), (_Multiply_94f6d857831c4e69b53b9bfc92dd852f_Out_2.xx), _TilingAndOffset_6cb9fd57231c4a429c9c0fe5aeb7cc58_Out_3);
            float _Property_2b9001a870d04f8eb60f5d7e1ce909c5_Out_0 = _Noise_Scale;
            float _GradientNoise_061679506b214bb8b4792ec4dfe82ec6_Out_2;
            Unity_GradientNoise_float(_TilingAndOffset_6cb9fd57231c4a429c9c0fe5aeb7cc58_Out_3, _Property_2b9001a870d04f8eb60f5d7e1ce909c5_Out_0, _GradientNoise_061679506b214bb8b4792ec4dfe82ec6_Out_2);
            float2 _TilingAndOffset_1d2491b5855e49d3b2e6b5dbe5db07d4_Out_3;
            Unity_TilingAndOffset_float((_RotateAboutAxis_1b91481bceed4e9a82a13975af123b02_Out_3.xy), float2 (1, 1), float2 (0, 0), _TilingAndOffset_1d2491b5855e49d3b2e6b5dbe5db07d4_Out_3);
            float _GradientNoise_8a27c3fb323f4db1b38f287380605198_Out_2;
            Unity_GradientNoise_float(_TilingAndOffset_1d2491b5855e49d3b2e6b5dbe5db07d4_Out_3, _Property_2b9001a870d04f8eb60f5d7e1ce909c5_Out_0, _GradientNoise_8a27c3fb323f4db1b38f287380605198_Out_2);
            float _Add_a6dd2d6e3f564decbca34ec03a419130_Out_2;
            Unity_Add_float(_GradientNoise_061679506b214bb8b4792ec4dfe82ec6_Out_2, _GradientNoise_8a27c3fb323f4db1b38f287380605198_Out_2, _Add_a6dd2d6e3f564decbca34ec03a419130_Out_2);
            float _Divide_a757ea7167f343ecaec30e69b58c9bae_Out_2;
            Unity_Divide_float(_Add_a6dd2d6e3f564decbca34ec03a419130_Out_2, 2, _Divide_a757ea7167f343ecaec30e69b58c9bae_Out_2);
            float _Saturate_f355ba5a467f4488b7ec89e8a08484a3_Out_1;
            Unity_Saturate_float(_Divide_a757ea7167f343ecaec30e69b58c9bae_Out_2, _Saturate_f355ba5a467f4488b7ec89e8a08484a3_Out_1);
            float _Property_96da655cc17e4594836aa02d74efe33c_Out_0 = _Cloud_Pow;
            float _Power_318bede735044ec6811f2a5c345b7d73_Out_2;
            Unity_Power_float(_Saturate_f355ba5a467f4488b7ec89e8a08484a3_Out_1, _Property_96da655cc17e4594836aa02d74efe33c_Out_0, _Power_318bede735044ec6811f2a5c345b7d73_Out_2);
            float4 _Property_317e8becc0724841a13cbcf8d4c4efbc_Out_0 = _Remap_xy_zw;
            float _Split_3dee68ff9a374966b7612da59c6ac20a_R_1 = _Property_317e8becc0724841a13cbcf8d4c4efbc_Out_0[0];
            float _Split_3dee68ff9a374966b7612da59c6ac20a_G_2 = _Property_317e8becc0724841a13cbcf8d4c4efbc_Out_0[1];
            float _Split_3dee68ff9a374966b7612da59c6ac20a_B_3 = _Property_317e8becc0724841a13cbcf8d4c4efbc_Out_0[2];
            float _Split_3dee68ff9a374966b7612da59c6ac20a_A_4 = _Property_317e8becc0724841a13cbcf8d4c4efbc_Out_0[3];
            float4 _Combine_4e3ec9a6e4064091bba919631e732b7a_RGBA_4;
            float3 _Combine_4e3ec9a6e4064091bba919631e732b7a_RGB_5;
            float2 _Combine_4e3ec9a6e4064091bba919631e732b7a_RG_6;
            Unity_Combine_float(_Split_3dee68ff9a374966b7612da59c6ac20a_R_1, _Split_3dee68ff9a374966b7612da59c6ac20a_G_2, 0, 0, _Combine_4e3ec9a6e4064091bba919631e732b7a_RGBA_4, _Combine_4e3ec9a6e4064091bba919631e732b7a_RGB_5, _Combine_4e3ec9a6e4064091bba919631e732b7a_RG_6);
            float4 _Combine_6f976751f1234c77908b163e59da18bb_RGBA_4;
            float3 _Combine_6f976751f1234c77908b163e59da18bb_RGB_5;
            float2 _Combine_6f976751f1234c77908b163e59da18bb_RG_6;
            Unity_Combine_float(_Split_3dee68ff9a374966b7612da59c6ac20a_B_3, _Split_3dee68ff9a374966b7612da59c6ac20a_A_4, 0, 0, _Combine_6f976751f1234c77908b163e59da18bb_RGBA_4, _Combine_6f976751f1234c77908b163e59da18bb_RGB_5, _Combine_6f976751f1234c77908b163e59da18bb_RG_6);
            float _Remap_a11bf825d8d54f198c2355e6d3cc1fba_Out_3;
            Unity_Remap_float(_Power_318bede735044ec6811f2a5c345b7d73_Out_2, _Combine_4e3ec9a6e4064091bba919631e732b7a_RG_6, _Combine_6f976751f1234c77908b163e59da18bb_RG_6, _Remap_a11bf825d8d54f198c2355e6d3cc1fba_Out_3);
            float _Absolute_553a57701af34a45a18ca7b2af677c8a_Out_1;
            Unity_Absolute_float(_Remap_a11bf825d8d54f198c2355e6d3cc1fba_Out_3, _Absolute_553a57701af34a45a18ca7b2af677c8a_Out_1);
            float _Smoothstep_6babd4aa745b40db842b941b96adf7e9_Out_3;
            Unity_Smoothstep_float(_Property_7d8e49b5efe94dea8210c34a6319b1ef_Out_0, _Property_09307b889e8945078bacabda50cca5c6_Out_0, _Absolute_553a57701af34a45a18ca7b2af677c8a_Out_1, _Smoothstep_6babd4aa745b40db842b941b96adf7e9_Out_3);
            float _Property_17631cb6b51c44b593b4fb1f0ac8fa75_Out_0 = _Base_Speed;
            float _Multiply_2e98faddc46143bea8e48ab17d0e1c15_Out_2;
            Unity_Multiply_float_float(IN.TimeParameters.x, _Property_17631cb6b51c44b593b4fb1f0ac8fa75_Out_0, _Multiply_2e98faddc46143bea8e48ab17d0e1c15_Out_2);
            float2 _TilingAndOffset_d8c83d87b12649f7b6a3902973c4457a_Out_3;
            Unity_TilingAndOffset_float((_RotateAboutAxis_1b91481bceed4e9a82a13975af123b02_Out_3.xy), float2 (1, 1), (_Multiply_2e98faddc46143bea8e48ab17d0e1c15_Out_2.xx), _TilingAndOffset_d8c83d87b12649f7b6a3902973c4457a_Out_3);
            float _Property_2792df33a4d44e20b2f71fe244d5f369_Out_0 = _Base_Scale;
            float _GradientNoise_702d412fe90e4c64b91e9defbe1ffff2_Out_2;
            Unity_GradientNoise_float(_TilingAndOffset_d8c83d87b12649f7b6a3902973c4457a_Out_3, _Property_2792df33a4d44e20b2f71fe244d5f369_Out_0, _GradientNoise_702d412fe90e4c64b91e9defbe1ffff2_Out_2);
            float _Property_a965b78b3be84255ae4ff1617bd2df01_Out_0 = _BaseStrength;
            float _Multiply_9880df30952a454781c1f0c8356100dd_Out_2;
            Unity_Multiply_float_float(_GradientNoise_702d412fe90e4c64b91e9defbe1ffff2_Out_2, _Property_a965b78b3be84255ae4ff1617bd2df01_Out_0, _Multiply_9880df30952a454781c1f0c8356100dd_Out_2);
            float _Add_98d9cdbb65e44e0282692d35bd9d237b_Out_2;
            Unity_Add_float(_Smoothstep_6babd4aa745b40db842b941b96adf7e9_Out_3, _Multiply_9880df30952a454781c1f0c8356100dd_Out_2, _Add_98d9cdbb65e44e0282692d35bd9d237b_Out_2);
            float _Add_d305fd085a9b459da3d4bd5108430b3f_Out_2;
            Unity_Add_float(1, _Property_a965b78b3be84255ae4ff1617bd2df01_Out_0, _Add_d305fd085a9b459da3d4bd5108430b3f_Out_2);
            float _Divide_55db7b7a0b8b481d83fb512a13a2dba6_Out_2;
            Unity_Divide_float(_Add_98d9cdbb65e44e0282692d35bd9d237b_Out_2, _Add_d305fd085a9b459da3d4bd5108430b3f_Out_2, _Divide_55db7b7a0b8b481d83fb512a13a2dba6_Out_2);
            float _Property_5a371e38a60143fcae81da7313c1bf15_Out_0 = _Fresnel_Power;
            float _FresnelEffect_4c470240dea248acb0092676d71437cb_Out_3;
            Unity_FresnelEffect_float(IN.WorldSpaceNormal, IN.WorldSpaceViewDirection, _Property_5a371e38a60143fcae81da7313c1bf15_Out_0, _FresnelEffect_4c470240dea248acb0092676d71437cb_Out_3);
            float _Multiply_384d15a2ef094b7e8b1ec6d69dada246_Out_2;
            Unity_Multiply_float_float(_Divide_55db7b7a0b8b481d83fb512a13a2dba6_Out_2, _FresnelEffect_4c470240dea248acb0092676d71437cb_Out_3, _Multiply_384d15a2ef094b7e8b1ec6d69dada246_Out_2);
            float _Property_3c23366c651c4949b03cb10c14ae0a27_Out_0 = _Fresnel_Opacity;
            float _Multiply_9380e32f6e4644e1b42e398229c18d31_Out_2;
            Unity_Multiply_float_float(_Multiply_384d15a2ef094b7e8b1ec6d69dada246_Out_2, _Property_3c23366c651c4949b03cb10c14ae0a27_Out_0, _Multiply_9380e32f6e4644e1b42e398229c18d31_Out_2);
            float4 _Property_dff39e3157cb4a09aac968677ade995d_Out_0 = _Color_Valley;
            float4 _Property_1b300af9e23e428fa893e55f9390600d_Out_0 = _Color_Peak;
            float4 _Lerp_6d0a20bb25554e1fa8697f473485e856_Out_3;
            Unity_Lerp_float4(_Property_dff39e3157cb4a09aac968677ade995d_Out_0, _Property_1b300af9e23e428fa893e55f9390600d_Out_0, (_Add_98d9cdbb65e44e0282692d35bd9d237b_Out_2.xxxx), _Lerp_6d0a20bb25554e1fa8697f473485e856_Out_3);
            float4 _Add_6507a6920d9c478888f235ad9d0bb542_Out_2;
            Unity_Add_float4((_Multiply_9380e32f6e4644e1b42e398229c18d31_Out_2.xxxx), _Lerp_6d0a20bb25554e1fa8697f473485e856_Out_3, _Add_6507a6920d9c478888f235ad9d0bb542_Out_2);
            float _Property_9cf7107417e042afb41766bb37be827b_Out_0 = _Emission_Strength;
            float4 _Multiply_31ae534c0cc640be9fda8de7cc705bbf_Out_2;
            Unity_Multiply_float4_float4(_Add_6507a6920d9c478888f235ad9d0bb542_Out_2, (_Property_9cf7107417e042afb41766bb37be827b_Out_0.xxxx), _Multiply_31ae534c0cc640be9fda8de7cc705bbf_Out_2);
            float _SceneDepth_619a7e0097894c29ba4557fde6cbb174_Out_1;
            Unity_SceneDepth_Eye_float(float4(IN.ScreenPosition.xy / IN.ScreenPosition.w, 0, 0), _SceneDepth_619a7e0097894c29ba4557fde6cbb174_Out_1);
            float4 _ScreenPosition_ee728e739f744068b0d15c1205d618a0_Out_0 = IN.ScreenPosition;
            float _Split_d5d8a30c527c46a19ab94602c057016e_R_1 = _ScreenPosition_ee728e739f744068b0d15c1205d618a0_Out_0[0];
            float _Split_d5d8a30c527c46a19ab94602c057016e_G_2 = _ScreenPosition_ee728e739f744068b0d15c1205d618a0_Out_0[1];
            float _Split_d5d8a30c527c46a19ab94602c057016e_B_3 = _ScreenPosition_ee728e739f744068b0d15c1205d618a0_Out_0[2];
            float _Split_d5d8a30c527c46a19ab94602c057016e_A_4 = _ScreenPosition_ee728e739f744068b0d15c1205d618a0_Out_0[3];
            float _Subtract_07eb78fa00d74ade84172a64a4a4616c_Out_2;
            Unity_Subtract_float(_Split_d5d8a30c527c46a19ab94602c057016e_A_4, 1, _Subtract_07eb78fa00d74ade84172a64a4a4616c_Out_2);
            float _Subtract_3ef0962257844c2c87b9ff8d165099f3_Out_2;
            Unity_Subtract_float(_SceneDepth_619a7e0097894c29ba4557fde6cbb174_Out_1, _Subtract_07eb78fa00d74ade84172a64a4a4616c_Out_2, _Subtract_3ef0962257844c2c87b9ff8d165099f3_Out_2);
            float _Property_9167e3d66076450baeb620b8f8b66552_Out_0 = _Depth_Fade;
            float _Divide_9a1ae8922923443883cbd9e71941de32_Out_2;
            Unity_Divide_float(_Subtract_3ef0962257844c2c87b9ff8d165099f3_Out_2, _Property_9167e3d66076450baeb620b8f8b66552_Out_0, _Divide_9a1ae8922923443883cbd9e71941de32_Out_2);
            float _Saturate_791ce4d2963e420ba68a97fca0bef8f9_Out_1;
            Unity_Saturate_float(_Divide_9a1ae8922923443883cbd9e71941de32_Out_2, _Saturate_791ce4d2963e420ba68a97fca0bef8f9_Out_1);
            surface.BaseColor = (_Add_6507a6920d9c478888f235ad9d0bb542_Out_2.xyz);
            surface.Emission = (_Multiply_31ae534c0cc640be9fda8de7cc705bbf_Out_2.xyz);
            surface.Alpha = _Saturate_791ce4d2963e420ba68a97fca0bef8f9_Out_1;
            return surface;
        }
        
            // --------------------------------------------------
            // Build Graph Inputs
            #ifdef HAVE_VFX_MODIFICATION
            #define VFX_SRP_ATTRIBUTES AttributesMesh
            #define VaryingsMeshType VaryingsMeshToPS
            #define VFX_SRP_VARYINGS VaryingsMeshType
            #define VFX_SRP_SURFACE_INPUTS FragInputs
            #endif
            
        VertexDescriptionInputs AttributesMeshToVertexDescriptionInputs(AttributesMesh input)
        {
            VertexDescriptionInputs output;
            ZERO_INITIALIZE(VertexDescriptionInputs, output);
        
            output.ObjectSpaceNormal =                          input.normalOS;
            output.ObjectSpaceTangent =                         input.tangentOS.xyz;
            output.ObjectSpacePosition =                        input.positionOS;
            output.TimeParameters =                             _TimeParameters.xyz; // Note: in case of animation this will be overwrite (allow to handle motion vector)
        
            return output;
        }
        
        VertexDescription GetVertexDescription(AttributesMesh input, float3 timeParameters
        #ifdef HAVE_VFX_MODIFICATION
            , AttributesElement element
        #endif
        )
        {
            // build graph inputs
            VertexDescriptionInputs vertexDescriptionInputs = AttributesMeshToVertexDescriptionInputs(input);
            // Override time parameters with used one (This is required to correctly handle motion vector for vertex animation based on time)
            vertexDescriptionInputs.TimeParameters = timeParameters;
        
            // evaluate vertex graph
        #ifdef HAVE_VFX_MODIFICATION
            GraphProperties properties;
            ZERO_INITIALIZE(GraphProperties, properties);
        
            // Fetch the vertex graph properties for the particle instance.
            GetElementVertexProperties(element, properties);
        
            VertexDescription vertexDescription = VertexDescriptionFunction(vertexDescriptionInputs, properties);
        #else
            VertexDescription vertexDescription = VertexDescriptionFunction(vertexDescriptionInputs);
        #endif
            return vertexDescription;
        
        }
        
        AttributesMesh ApplyMeshModification(AttributesMesh input, float3 timeParameters
        #ifdef USE_CUSTOMINTERP_SUBSTRUCT
            #ifdef TESSELLATION_ON
            , inout VaryingsMeshToDS varyings
            #else
            , inout VaryingsMeshToPS varyings
            #endif
        #endif
        #ifdef HAVE_VFX_MODIFICATION
                , AttributesElement element
        #endif
            )
        {
            VertexDescription vertexDescription = GetVertexDescription(input, timeParameters
        #ifdef HAVE_VFX_MODIFICATION
                , element
        #endif
            );
        
            // copy graph output to the results
            input.positionOS = vertexDescription.Position;
            input.normalOS = vertexDescription.Normal;
            input.tangentOS.xyz = vertexDescription.Tangent;
        
            
        
            return input;
        }
        
        #if defined(_ADD_CUSTOM_VELOCITY) // For shader graph custom velocity
        // Return precomputed Velocity in object space
        float3 GetCustomVelocity(AttributesMesh input
        #ifdef HAVE_VFX_MODIFICATION
            , AttributesElement element
        #endif
        )
        {
            VertexDescription vertexDescription = GetVertexDescription(input, _TimeParameters.xyz
        #ifdef HAVE_VFX_MODIFICATION
                , element
        #endif
            );
            return vertexDescription.CustomVelocity;
        }
        #endif
        
        FragInputs BuildFragInputs(VaryingsMeshToPS input)
        {
            FragInputs output;
            ZERO_INITIALIZE(FragInputs, output);
        
            // Init to some default value to make the computer quiet (else it output 'divide by zero' warning even if value is not used).
            // TODO: this is a really poor workaround, but the variable is used in a bunch of places
            // to compute normals which are then passed on elsewhere to compute other values...
            output.tangentToWorld = k_identity3x3;
            output.positionSS = input.positionCS;       // input.positionCS is SV_Position
        
            output.positionRWS =                input.positionRWS;
            output.tangentToWorld =             BuildTangentToWorld(input.tangentWS, input.normalWS);
        
        #ifdef HAVE_VFX_MODIFICATION
            // FragInputs from VFX come from two places: Interpolator or CBuffer.
            /* WARNING: $splice Could not find named fragment 'VFXSetFragInputs' */
        
        #endif
        
            // splice point to copy custom interpolator fields from varyings to frag inputs
            
        
            return output;
        }
        
        // existing HDRP code uses the combined function to go directly from packed to frag inputs
        FragInputs UnpackVaryingsMeshToFragInputs(PackedVaryingsMeshToPS input)
        {
            UNITY_SETUP_INSTANCE_ID(input);
            VaryingsMeshToPS unpacked = UnpackVaryingsMeshToPS(input);
            return BuildFragInputs(unpacked);
        }
            SurfaceDescriptionInputs FragInputsToSurfaceDescriptionInputs(FragInputs input, float3 viewWS)
        {
            SurfaceDescriptionInputs output;
            ZERO_INITIALIZE(SurfaceDescriptionInputs, output);
        
            output.WorldSpaceNormal =                           normalize(input.tangentToWorld[2].xyz);
            #if defined(SHADER_STAGE_RAY_TRACING)
            #else
            #endif
            output.WorldSpaceViewDirection =                    normalize(viewWS);
            output.WorldSpacePosition =                         input.positionRWS;
            output.ObjectSpacePosition =                        TransformWorldToObject(input.positionRWS);
            output.ScreenPosition =                             ComputeScreenPos(TransformWorldToHClip(input.positionRWS), _ProjectionParams.x);
            output.TimeParameters =                             _TimeParameters.xyz; // This is mainly for LW as HD overwrite this value
        
            // splice point to copy frag inputs custom interpolator pack into the SDI
            
        
            return output;
        }
        
            // --------------------------------------------------
            // Build Surface Data (Specific Material)
        
        void BuildSurfaceData(FragInputs fragInputs, inout SurfaceDescription surfaceDescription, float3 V, PositionInputs posInput, out SurfaceData surfaceData)
        {
            // setup defaults -- these are used if the graph doesn't output a value
            ZERO_INITIALIZE(SurfaceData, surfaceData);
        
            // copy across graph values, if defined
            surfaceData.color = surfaceDescription.BaseColor;
        
            #ifdef WRITE_NORMAL_BUFFER
            // When we need to export the normal (in the depth prepass, we write the geometry one)
            surfaceData.normalWS = fragInputs.tangentToWorld[2];
            #endif
        
            #if defined(DEBUG_DISPLAY)
            if (_DebugMipMapMode != DEBUGMIPMAPMODE_NONE)
            {
                // TODO
            }
            #endif
        
            #ifdef _ENABLE_SHADOW_MATTE
        
                #if (SHADERPASS == SHADERPASS_FORWARD_UNLIT) || (SHADERPASS == SHADERPASS_RAYTRACING_GBUFFER) || (SHADERPASS == SHADERPASS_RAYTRACING_INDIRECT) || (SHADERPASS == SHADERPASS_RAYTRACING_FORWARD)
        
                    HDShadowContext shadowContext = InitShadowContext();
        
                    // Evaluate the shadow, the normal is guaranteed if shadow matte is enabled on this shader.
                    float3 shadow3;
                    ShadowLoopMin(shadowContext, posInput, normalize(fragInputs.tangentToWorld[2]), asuint(_ShadowMatteFilter), GetMeshRenderingLightLayer(), shadow3);
        
                    // Compute the average value in the fourth channel
                    float4 shadow = float4(shadow3, dot(shadow3, float3(1.0/3.0, 1.0/3.0, 1.0/3.0)));
        
                    float4 shadowColor = (1.0 - shadow) * surfaceDescription.ShadowTint.rgba;
                    float  localAlpha  = saturate(shadowColor.a + surfaceDescription.Alpha);
        
                    // Keep the nested lerp
                    // With no Color (bsdfData.color.rgb, bsdfData.color.a == 0.0f), just use ShadowColor*Color to avoid a ring of "white" around the shadow
                    // And mix color to consider the Color & ShadowColor alpha (from texture or/and color picker)
                    #ifdef _SURFACE_TYPE_TRANSPARENT
                        surfaceData.color = lerp(shadowColor.rgb * surfaceData.color, lerp(lerp(shadowColor.rgb, surfaceData.color, 1.0 - surfaceDescription.ShadowTint.a), surfaceData.color, shadow.rgb), surfaceDescription.Alpha);
                    #else
                        surfaceData.color = lerp(lerp(shadowColor.rgb, surfaceData.color, 1.0 - surfaceDescription.ShadowTint.a), surfaceData.color, shadow.rgb);
                    #endif
                    localAlpha = ApplyBlendMode(surfaceData.color, localAlpha).a;
        
                    surfaceDescription.Alpha = localAlpha;
        
                #elif SHADERPASS == SHADERPASS_PATH_TRACING
        
                    surfaceData.normalWS = fragInputs.tangentToWorld[2];
                    surfaceData.shadowTint = surfaceDescription.ShadowTint.rgba;
        
                #endif
        
            #endif // _ENABLE_SHADOW_MATTE
        }
        
            // --------------------------------------------------
            // Get Surface And BuiltinData
        
            void GetSurfaceAndBuiltinData(FragInputs fragInputs, float3 V, inout PositionInputs posInput, out SurfaceData surfaceData, out BuiltinData builtinData RAY_TRACING_OPTIONAL_PARAMETERS)
            {
                // Don't dither if displaced tessellation (we're fading out the displacement instead to match the next LOD)
                #if !defined(SHADER_STAGE_RAY_TRACING) && !defined(_TESSELLATION_DISPLACEMENT)
                #ifdef LOD_FADE_CROSSFADE // enable dithering LOD transition if user select CrossFade transition in LOD group
                LODDitheringTransition(ComputeFadeMaskSeed(V, posInput.positionSS), unity_LODFade.x);
                #endif
                #endif
        
                #ifndef SHADER_UNLIT
                #ifdef _DOUBLESIDED_ON
                    float3 doubleSidedConstants = _DoubleSidedConstants.xyz;
                #else
                    float3 doubleSidedConstants = float3(1.0, 1.0, 1.0);
                #endif
        
                ApplyDoubleSidedFlipOrMirror(fragInputs, doubleSidedConstants); // Apply double sided flip on the vertex normal
                #endif // SHADER_UNLIT
        
                SurfaceDescriptionInputs surfaceDescriptionInputs = FragInputsToSurfaceDescriptionInputs(fragInputs, V);
        
                #if defined(HAVE_VFX_MODIFICATION)
                GraphProperties properties;
                ZERO_INITIALIZE(GraphProperties, properties);
        
                GetElementPixelProperties(fragInputs, properties);
        
                SurfaceDescription surfaceDescription = SurfaceDescriptionFunction(surfaceDescriptionInputs, properties);
                #else
                SurfaceDescription surfaceDescription = SurfaceDescriptionFunction(surfaceDescriptionInputs);
                #endif
        
                // Perform alpha test very early to save performance (a killed pixel will not sample textures)
                // TODO: split graph evaluation to grab just alpha dependencies first? tricky..
                #ifdef _ALPHATEST_ON
                    float alphaCutoff = surfaceDescription.AlphaClipThreshold;
                    #if SHADERPASS == SHADERPASS_TRANSPARENT_DEPTH_PREPASS
                    // The TransparentDepthPrepass is also used with SSR transparent.
                    // If an artists enable transaprent SSR but not the TransparentDepthPrepass itself, then we use AlphaClipThreshold
                    // otherwise if TransparentDepthPrepass is enabled we use AlphaClipThresholdDepthPrepass
                    #elif SHADERPASS == SHADERPASS_TRANSPARENT_DEPTH_POSTPASS
                    // DepthPostpass always use its own alpha threshold
                    alphaCutoff = surfaceDescription.AlphaClipThresholdDepthPostpass;
                    #elif (SHADERPASS == SHADERPASS_SHADOWS) || (SHADERPASS == SHADERPASS_RAYTRACING_VISIBILITY)
                    // If use shadow threshold isn't enable we don't allow any test
                    #endif
        
                    GENERIC_ALPHA_TEST(surfaceDescription.Alpha, alphaCutoff);
                #endif
        
                #if !defined(SHADER_STAGE_RAY_TRACING) && _DEPTHOFFSET_ON
                ApplyDepthOffsetPositionInput(V, surfaceDescription.DepthOffset, GetViewForwardDir(), GetWorldToHClipMatrix(), posInput);
                #endif
        
                #ifndef SHADER_UNLIT
                float3 bentNormalWS;
                BuildSurfaceData(fragInputs, surfaceDescription, V, posInput, surfaceData, bentNormalWS);
        
                #ifdef FRAG_INPUTS_USE_TEXCOORD1
                    float4 lightmapTexCoord1 = fragInputs.texCoord1;
                #else
                    float4 lightmapTexCoord1 = float4(0,0,0,0);
                #endif
        
                #ifdef FRAG_INPUTS_USE_TEXCOORD2
                    float4 lightmapTexCoord2 = fragInputs.texCoord2;
                #else
                    float4 lightmapTexCoord2 = float4(0,0,0,0);
                #endif
        
                // Builtin Data
                // For back lighting we use the oposite vertex normal
                InitBuiltinData(posInput, surfaceDescription.Alpha, bentNormalWS, -fragInputs.tangentToWorld[2], lightmapTexCoord1, lightmapTexCoord2, builtinData);
        
                #else
                BuildSurfaceData(fragInputs, surfaceDescription, V, posInput, surfaceData);
        
                ZERO_BUILTIN_INITIALIZE(builtinData); // No call to InitBuiltinData as we don't have any lighting
                builtinData.opacity = surfaceDescription.Alpha;
        
                #if defined(DEBUG_DISPLAY)
                    // Light Layers are currently not used for the Unlit shader (because it is not lit)
                    // But Unlit objects do cast shadows according to their rendering layer mask, which is what we want to
                    // display in the light layers visualization mode, therefore we need the renderingLayers
                    builtinData.renderingLayers = GetMeshRenderingLightLayer();
                #endif
        
                #endif // SHADER_UNLIT
        
                #ifdef _ALPHATEST_ON
                    // Used for sharpening by alpha to mask - Alpha to covertage is only used with depth only and forward pass (no shadow pass, no transparent pass)
                    builtinData.alphaClipTreshold = alphaCutoff;
                #endif
        
                // override sampleBakedGI - not used by Unlit
        
                builtinData.emissiveColor = surfaceDescription.Emission;
        
                // Note this will not fully work on transparent surfaces (can check with _SURFACE_TYPE_TRANSPARENT define)
                // We will always overwrite vt feeback with the nearest. So behind transparent surfaces vt will not be resolved
                // This is a limitation of the current MRT approach.
                #ifdef UNITY_VIRTUAL_TEXTURING
                #endif
        
                #if _DEPTHOFFSET_ON
                builtinData.depthOffset = surfaceDescription.DepthOffset;
                #endif
        
                // TODO: We should generate distortion / distortionBlur for non distortion pass
                #if (SHADERPASS == SHADERPASS_DISTORTION)
                builtinData.distortion = surfaceDescription.Distortion;
                builtinData.distortionBlur = surfaceDescription.DistortionBlur;
                #endif
        
                #ifndef SHADER_UNLIT
                // PostInitBuiltinData call ApplyDebugToBuiltinData
                PostInitBuiltinData(V, posInput, surfaceData, builtinData);
                #else
                ApplyDebugToBuiltinData(builtinData);
                #endif
        
                RAY_TRACING_OPTIONAL_ALPHA_TEST_PASS
            }
        
            // --------------------------------------------------
            // Main
        
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/ShaderPass/ShaderPassFullScreenDebug.hlsl"
        
            // --------------------------------------------------
            // Visual Effect Vertex Invocations
        
        	#ifdef HAVE_VFX_MODIFICATION
        	#include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/VisualEffectVertex.hlsl"
        	#endif
        
            ENDHLSL
        }
    }
    SubShader
    {
        Tags
        {
            "RenderPipeline"="HDRenderPipeline"
            "RenderType"="HDUnlitShader"
            "Queue"="Transparent+0"
            "ShaderGraphShader"="true"
            "ShaderGraphTargetId"="HDUnlitSubTarget"
        }
        Pass
        {
            Name "IndirectDXR"
            Tags
            {
                "LightMode" = "IndirectDXR"
            }
        
            // Render State
            // RenderState: <None>
        
            // Debug
            // <None>
        
            // --------------------------------------------------
            // Pass
        
            HLSLPROGRAM
        
            // Pragmas
            #pragma target 5.0
        #pragma raytracing surface_shader
        #pragma only_renderers d3d11 ps5
        
            // Keywords
            #pragma shader_feature _ _SURFACE_TYPE_TRANSPARENT
        #pragma shader_feature_local _BLENDMODE_OFF _BLENDMODE_ALPHA _BLENDMODE_ADD _BLENDMODE_PRE_MULTIPLY
        #pragma shader_feature_local _ _ADD_PRECOMPUTED_VELOCITY
        #pragma shader_feature_local _ _TRANSPARENT_WRITES_MOTION_VEC
        #pragma shader_feature_local_fragment _ _ENABLE_FOG_ON_TRANSPARENT
        #pragma multi_compile _ DEBUG_DISPLAY
            // GraphKeywords: <None>
        
            // Early Instancing Defines
            // DotsInstancingOptions: <None>
        
            // Injected Instanced Properties (must be included before UnityInstancing.hlsl)
            // HybridV1InjectedBuiltinProperties: <None>
        
            // For custom interpolators to inject a substruct definition before FragInputs definition,
            // allowing for FragInputs to capture CI's intended for ShaderGraph's SDI.
            /* WARNING: $splice Could not find named fragment 'CustomInterpolatorPreInclude' */
        
        
            // TODO: Merge FragInputsVFX substruct with CustomInterpolators.
        	#ifdef HAVE_VFX_MODIFICATION
        	struct FragInputsVFX
            {
                /* WARNING: $splice Could not find named fragment 'FragInputsVFX' */
            };
            #endif
        
            #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Common.hlsl"
        	#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/GeometricTools.hlsl" // Required by Tessellation.hlsl
        	#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Tessellation.hlsl"
            #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Texture.hlsl"
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderVariables.hlsl"
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/ShaderPass/ShaderPass.cs.hlsl"
            #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/TextureStack.hlsl" // Required to be include before we include properties as it define DECLARE_STACK_CB
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderGraphHeader.hlsl" // Need to be here for Gradient struct definition
        
            // --------------------------------------------------
            // Defines
        
            // Attribute
            #define ATTRIBUTES_NEED_NORMAL
            #define ATTRIBUTES_NEED_TANGENT
            #define VARYINGS_NEED_POSITION_WS
            #define VARYINGS_NEED_TANGENT_TO_WORLD
        
        
            //Strip down the FragInputs.hlsl (on graphics), so we can only optimize the interpolators we use.
            //if by accident something requests contents of FragInputs.hlsl, it will be caught as a compiler error
            //Frag inputs stripping is only enabled when FRAG_INPUTS_ENABLE_STRIPPING is set
            #if !defined(SHADER_STAGE_RAY_TRACING) && SHADERPASS != SHADERPASS_RAYTRACING_GBUFFER && SHADERPASS != SHADERPASS_FULL_SCREEN_DEBUG
            #define FRAG_INPUTS_ENABLE_STRIPPING
            #endif
        
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/ShaderPass/FragInputs.hlsl"
        
        
        
            #define SHADERPASS SHADERPASS_RAYTRACING_INDIRECT
        #define SHADOW_LOW
        #define RAYTRACING_SHADER_GRAPH_RAYTRACED
        #define REQUIRE_DEPTH_TEXTURE
        
        
            // Following two define are a workaround introduce in 10.1.x for RaytracingQualityNode
            // The ShaderGraph don't support correctly migration of this node as it serialize all the node data
            // in the json file making it impossible to uprgrade. Until we get a fix, we do a workaround here
            // to still allow us to rename the field and keyword of this node without breaking existing code.
            #ifdef RAYTRACING_SHADER_GRAPH_DEFAULT
            #define RAYTRACING_SHADER_GRAPH_HIGH
            #endif
        
            #ifdef RAYTRACING_SHADER_GRAPH_RAYTRACED
            #define RAYTRACING_SHADER_GRAPH_LOW
            #endif
            // end
        
            #ifndef SHADER_UNLIT
            // We need isFrontFace when using double sided - it is not required for unlit as in case of unlit double sided only drive the cullmode
            // VARYINGS_NEED_CULLFACE can be define by VaryingsMeshToPS.FaceSign input if a IsFrontFace Node is included in the shader graph.
            #if defined(_DOUBLESIDED_ON) && !defined(VARYINGS_NEED_CULLFACE)
                #define VARYINGS_NEED_CULLFACE
            #endif
            #endif
        
            // Specific Material Define
        // Setup a define to say we are an unlit shader
        #define SHADER_UNLIT
        
        // Following Macro are only used by Unlit material
        #if defined(_ENABLE_SHADOW_MATTE) && (SHADERPASS == SHADERPASS_FORWARD_UNLIT || SHADERPASS == SHADERPASS_PATH_TRACING)
        #define LIGHTLOOP_DISABLE_TILE_AND_CLUSTER
        #define HAS_LIGHTLOOP
        #endif
            // Caution: we can use the define SHADER_UNLIT onlit after the above Material include as it is the Unlit template who define it
        
            // To handle SSR on transparent correctly with a possibility to enable/disable it per framesettings
            // we should have a code like this:
            // if !defined(_DISABLE_SSR_TRANSPARENT)
            // pragma multi_compile _ WRITE_NORMAL_BUFFER
            // endif
            // i.e we enable the multicompile only if we can receive SSR or not, and then C# code drive
            // it based on if SSR transparent in frame settings and not (and stripper can strip it).
            // this is currently not possible with our current preprocessor as _DISABLE_SSR_TRANSPARENT is a keyword not a define
            // so instead we used this and chose to pay the extra cost of normal write even if SSR transaprent is disabled.
            // Ideally the shader graph generator should handle it but condition below can't be handle correctly for now.
            #if SHADERPASS == SHADERPASS_TRANSPARENT_DEPTH_PREPASS
            #if !defined(_DISABLE_SSR_TRANSPARENT) && !defined(SHADER_UNLIT)
                #define WRITE_NORMAL_BUFFER
            #endif
            #endif
        
            #ifndef DEBUG_DISPLAY
                // In case of opaque we don't want to perform the alpha test, it is done in depth prepass and we use depth equal for ztest (setup from UI)
                // Don't do it with debug display mode as it is possible there is no depth prepass in this case
                #if !defined(_SURFACE_TYPE_TRANSPARENT)
                    #if SHADERPASS == SHADERPASS_FORWARD
                    #define SHADERPASS_FORWARD_BYPASS_ALPHA_TEST
                    #elif SHADERPASS == SHADERPASS_GBUFFER
                    #define SHADERPASS_GBUFFER_BYPASS_ALPHA_TEST
                    #endif
                #endif
            #endif
        
            // Define _DEFERRED_CAPABLE_MATERIAL for shader capable to run in deferred pass
            #if defined(SHADER_LIT) && !defined(_SURFACE_TYPE_TRANSPARENT)
                #define _DEFERRED_CAPABLE_MATERIAL
            #endif
        
            // Translate transparent motion vector define
            #if defined(_TRANSPARENT_WRITES_MOTION_VEC) && defined(_SURFACE_TYPE_TRANSPARENT)
                #define _WRITE_TRANSPARENT_MOTION_VECTOR
            #endif
        
            // -- Graph Properties
            CBUFFER_START(UnityPerMaterial)
        float4 _Rotate_Projection;
        float _Noise_Scale;
        float _Speed;
        float _Vertexoffset;
        float4 _Remap_xy_zw;
        float4 _Color_Peak;
        float4 _Color_Valley;
        float _SmoothEdge1;
        float _SmoothEdge2;
        float _Cloud_Pow;
        float _Base_Scale;
        float _Base_Speed;
        float _BaseStrength;
        float _Emission_Strength;
        float _Curvate_Radius;
        float _Fresnel_Power;
        float _Fresnel_Opacity;
        float _Depth_Fade;
        float4 _EmissionColor;
        float _UseShadowThreshold;
        float4 _DoubleSidedConstants;
        float _BlendMode;
        float _EnableBlendModePreserveSpecularLighting;
        CBUFFER_END
        
        // Object and Global properties
        
            // -- Property used by ScenePickingPass
            #ifdef SCENEPICKINGPASS
            float4 _SelectionID;
            #endif
        
            // -- Properties used by SceneSelectionPass
            #ifdef SCENESELECTIONPASS
            int _ObjectId;
            int _PassValue;
            #endif
        
            // Includes
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/Raytracing/Shaders/RaytracingMacros.hlsl"
        #include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/Raytracing/Shaders/ShaderVariablesRaytracing.hlsl"
        #include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Material.hlsl"
        #include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/Raytracing/Shaders/ShaderVariablesRaytracingLightLoop.hlsl"
        #include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/Raytracing/Shaders/RaytracingIntersection.hlsl"
        #include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Unlit/Unlit.hlsl"
        #include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Unlit/UnlitRaytracing.hlsl"
        #include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/BuiltinUtilities.hlsl"
        #include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/MaterialUtilities.hlsl"
        #include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/Raytracing/Shaders/RayTracingCommon.hlsl"
        #include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderGraphFunctions.hlsl"
        	// GraphIncludes: <None>
        
            // --------------------------------------------------
            // Structs and Packing
        
            struct SurfaceDescriptionInputs
        {
             float3 WorldSpaceNormal;
             float3 WorldSpaceViewDirection;
             float3 ObjectSpacePosition;
             float3 WorldSpacePosition;
             float4 ScreenPosition;
             float3 TimeParameters;
        };
        
            //Interpolator Packs: <None>
        
            // --------------------------------------------------
            // Graph
        
        
            // Graph Functions
            
        void Unity_Rotate_About_Axis_Radians_float(float3 In, float3 Axis, float Rotation, out float3 Out)
        {
            float s = sin(Rotation);
            float c = cos(Rotation);
            float one_minus_c = 1.0 - c;
        
            Axis = normalize(Axis);
        
            float3x3 rot_mat = { one_minus_c * Axis.x * Axis.x + c,            one_minus_c * Axis.x * Axis.y - Axis.z * s,     one_minus_c * Axis.z * Axis.x + Axis.y * s,
                                      one_minus_c * Axis.x * Axis.y + Axis.z * s,   one_minus_c * Axis.y * Axis.y + c,              one_minus_c * Axis.y * Axis.z - Axis.x * s,
                                      one_minus_c * Axis.z * Axis.x - Axis.y * s,   one_minus_c * Axis.y * Axis.z + Axis.x * s,     one_minus_c * Axis.z * Axis.z + c
                                    };
        
            Out = mul(rot_mat,  In);
        }
        
        void Unity_Multiply_float_float(float A, float B, out float Out)
        {
            Out = A * B;
        }
        
        void Unity_TilingAndOffset_float(float2 UV, float2 Tiling, float2 Offset, out float2 Out)
        {
            Out = UV * Tiling + Offset;
        }
        
        
        float2 Unity_GradientNoise_Dir_float(float2 p)
        {
            // Permutation and hashing used in webgl-nosie goo.gl/pX7HtC
            p = p % 289;
            // need full precision, otherwise half overflows when p > 1
            float x = float(34 * p.x + 1) * p.x % 289 + p.y;
            x = (34 * x + 1) * x % 289;
            x = frac(x / 41) * 2 - 1;
            return normalize(float2(x - floor(x + 0.5), abs(x) - 0.5));
        }
        
        void Unity_GradientNoise_float(float2 UV, float Scale, out float Out)
        {
            float2 p = UV * Scale;
            float2 ip = floor(p);
            float2 fp = frac(p);
            float d00 = dot(Unity_GradientNoise_Dir_float(ip), fp);
            float d01 = dot(Unity_GradientNoise_Dir_float(ip + float2(0, 1)), fp - float2(0, 1));
            float d10 = dot(Unity_GradientNoise_Dir_float(ip + float2(1, 0)), fp - float2(1, 0));
            float d11 = dot(Unity_GradientNoise_Dir_float(ip + float2(1, 1)), fp - float2(1, 1));
            fp = fp * fp * fp * (fp * (fp * 6 - 15) + 10);
            Out = lerp(lerp(d00, d01, fp.y), lerp(d10, d11, fp.y), fp.x) + 0.5;
        }
        
        void Unity_Add_float(float A, float B, out float Out)
        {
            Out = A + B;
        }
        
        void Unity_Divide_float(float A, float B, out float Out)
        {
            Out = A / B;
        }
        
        void Unity_Saturate_float(float In, out float Out)
        {
            Out = saturate(In);
        }
        
        void Unity_Power_float(float A, float B, out float Out)
        {
            Out = pow(A, B);
        }
        
        void Unity_Combine_float(float R, float G, float B, float A, out float4 RGBA, out float3 RGB, out float2 RG)
        {
            RGBA = float4(R, G, B, A);
            RGB = float3(R, G, B);
            RG = float2(R, G);
        }
        
        void Unity_Remap_float(float In, float2 InMinMax, float2 OutMinMax, out float Out)
        {
            Out = OutMinMax.x + (In - InMinMax.x) * (OutMinMax.y - OutMinMax.x) / (InMinMax.y - InMinMax.x);
        }
        
        void Unity_Absolute_float(float In, out float Out)
        {
            Out = abs(In);
        }
        
        void Unity_Smoothstep_float(float Edge1, float Edge2, float In, out float Out)
        {
            Out = smoothstep(Edge1, Edge2, In);
        }
        
        void Unity_FresnelEffect_float(float3 Normal, float3 ViewDir, float Power, out float Out)
        {
            Out = pow((1.0 - saturate(dot(normalize(Normal), normalize(ViewDir)))), Power);
        }
        
        void Unity_Lerp_float4(float4 A, float4 B, float4 T, out float4 Out)
        {
            Out = lerp(A, B, T);
        }
        
        void Unity_Add_float4(float4 A, float4 B, out float4 Out)
        {
            Out = A + B;
        }
        
        void Unity_Multiply_float4_float4(float4 A, float4 B, out float4 Out)
        {
            Out = A * B;
        }
        
        void Unity_SceneDepth_Eye_float(float4 UV, out float Out)
        {
            if (unity_OrthoParams.w == 1.0)
            {
                Out = LinearEyeDepth(ComputeWorldSpacePosition(UV.xy, SHADERGRAPH_SAMPLE_SCENE_DEPTH(UV.xy), UNITY_MATRIX_I_VP), UNITY_MATRIX_V);
            }
            else
            {
                Out = LinearEyeDepth(SHADERGRAPH_SAMPLE_SCENE_DEPTH(UV.xy), _ZBufferParams);
            }
        }
        
        void Unity_Subtract_float(float A, float B, out float Out)
        {
            Out = A - B;
        }
        
            // Graph Vertex
            // GraphVertex: <None>
        
            // Graph Pixel
            struct SurfaceDescription
        {
            float3 BaseColor;
            float3 Emission;
            float Alpha;
        };
        
        SurfaceDescription SurfaceDescriptionFunction(SurfaceDescriptionInputs IN)
        {
            SurfaceDescription surface = (SurfaceDescription)0;
            float _Property_7d8e49b5efe94dea8210c34a6319b1ef_Out_0 = _SmoothEdge1;
            float _Property_09307b889e8945078bacabda50cca5c6_Out_0 = _SmoothEdge2;
            float4 _Property_a8d53d7ea07349e0979b956475bdd7cc_Out_0 = _Rotate_Projection;
            float _Split_7d12b2bb5feb46d685603473d0cf5818_R_1 = _Property_a8d53d7ea07349e0979b956475bdd7cc_Out_0[0];
            float _Split_7d12b2bb5feb46d685603473d0cf5818_G_2 = _Property_a8d53d7ea07349e0979b956475bdd7cc_Out_0[1];
            float _Split_7d12b2bb5feb46d685603473d0cf5818_B_3 = _Property_a8d53d7ea07349e0979b956475bdd7cc_Out_0[2];
            float _Split_7d12b2bb5feb46d685603473d0cf5818_A_4 = _Property_a8d53d7ea07349e0979b956475bdd7cc_Out_0[3];
            float3 _RotateAboutAxis_1b91481bceed4e9a82a13975af123b02_Out_3;
            Unity_Rotate_About_Axis_Radians_float(IN.ObjectSpacePosition, (_Property_a8d53d7ea07349e0979b956475bdd7cc_Out_0.xyz), _Split_7d12b2bb5feb46d685603473d0cf5818_A_4, _RotateAboutAxis_1b91481bceed4e9a82a13975af123b02_Out_3);
            float _Property_258f4645340c46f69274c9f077f1a73c_Out_0 = _Speed;
            float _Multiply_94f6d857831c4e69b53b9bfc92dd852f_Out_2;
            Unity_Multiply_float_float(IN.TimeParameters.x, _Property_258f4645340c46f69274c9f077f1a73c_Out_0, _Multiply_94f6d857831c4e69b53b9bfc92dd852f_Out_2);
            float2 _TilingAndOffset_6cb9fd57231c4a429c9c0fe5aeb7cc58_Out_3;
            Unity_TilingAndOffset_float((_RotateAboutAxis_1b91481bceed4e9a82a13975af123b02_Out_3.xy), float2 (1, 1), (_Multiply_94f6d857831c4e69b53b9bfc92dd852f_Out_2.xx), _TilingAndOffset_6cb9fd57231c4a429c9c0fe5aeb7cc58_Out_3);
            float _Property_2b9001a870d04f8eb60f5d7e1ce909c5_Out_0 = _Noise_Scale;
            float _GradientNoise_061679506b214bb8b4792ec4dfe82ec6_Out_2;
            Unity_GradientNoise_float(_TilingAndOffset_6cb9fd57231c4a429c9c0fe5aeb7cc58_Out_3, _Property_2b9001a870d04f8eb60f5d7e1ce909c5_Out_0, _GradientNoise_061679506b214bb8b4792ec4dfe82ec6_Out_2);
            float2 _TilingAndOffset_1d2491b5855e49d3b2e6b5dbe5db07d4_Out_3;
            Unity_TilingAndOffset_float((_RotateAboutAxis_1b91481bceed4e9a82a13975af123b02_Out_3.xy), float2 (1, 1), float2 (0, 0), _TilingAndOffset_1d2491b5855e49d3b2e6b5dbe5db07d4_Out_3);
            float _GradientNoise_8a27c3fb323f4db1b38f287380605198_Out_2;
            Unity_GradientNoise_float(_TilingAndOffset_1d2491b5855e49d3b2e6b5dbe5db07d4_Out_3, _Property_2b9001a870d04f8eb60f5d7e1ce909c5_Out_0, _GradientNoise_8a27c3fb323f4db1b38f287380605198_Out_2);
            float _Add_a6dd2d6e3f564decbca34ec03a419130_Out_2;
            Unity_Add_float(_GradientNoise_061679506b214bb8b4792ec4dfe82ec6_Out_2, _GradientNoise_8a27c3fb323f4db1b38f287380605198_Out_2, _Add_a6dd2d6e3f564decbca34ec03a419130_Out_2);
            float _Divide_a757ea7167f343ecaec30e69b58c9bae_Out_2;
            Unity_Divide_float(_Add_a6dd2d6e3f564decbca34ec03a419130_Out_2, 2, _Divide_a757ea7167f343ecaec30e69b58c9bae_Out_2);
            float _Saturate_f355ba5a467f4488b7ec89e8a08484a3_Out_1;
            Unity_Saturate_float(_Divide_a757ea7167f343ecaec30e69b58c9bae_Out_2, _Saturate_f355ba5a467f4488b7ec89e8a08484a3_Out_1);
            float _Property_96da655cc17e4594836aa02d74efe33c_Out_0 = _Cloud_Pow;
            float _Power_318bede735044ec6811f2a5c345b7d73_Out_2;
            Unity_Power_float(_Saturate_f355ba5a467f4488b7ec89e8a08484a3_Out_1, _Property_96da655cc17e4594836aa02d74efe33c_Out_0, _Power_318bede735044ec6811f2a5c345b7d73_Out_2);
            float4 _Property_317e8becc0724841a13cbcf8d4c4efbc_Out_0 = _Remap_xy_zw;
            float _Split_3dee68ff9a374966b7612da59c6ac20a_R_1 = _Property_317e8becc0724841a13cbcf8d4c4efbc_Out_0[0];
            float _Split_3dee68ff9a374966b7612da59c6ac20a_G_2 = _Property_317e8becc0724841a13cbcf8d4c4efbc_Out_0[1];
            float _Split_3dee68ff9a374966b7612da59c6ac20a_B_3 = _Property_317e8becc0724841a13cbcf8d4c4efbc_Out_0[2];
            float _Split_3dee68ff9a374966b7612da59c6ac20a_A_4 = _Property_317e8becc0724841a13cbcf8d4c4efbc_Out_0[3];
            float4 _Combine_4e3ec9a6e4064091bba919631e732b7a_RGBA_4;
            float3 _Combine_4e3ec9a6e4064091bba919631e732b7a_RGB_5;
            float2 _Combine_4e3ec9a6e4064091bba919631e732b7a_RG_6;
            Unity_Combine_float(_Split_3dee68ff9a374966b7612da59c6ac20a_R_1, _Split_3dee68ff9a374966b7612da59c6ac20a_G_2, 0, 0, _Combine_4e3ec9a6e4064091bba919631e732b7a_RGBA_4, _Combine_4e3ec9a6e4064091bba919631e732b7a_RGB_5, _Combine_4e3ec9a6e4064091bba919631e732b7a_RG_6);
            float4 _Combine_6f976751f1234c77908b163e59da18bb_RGBA_4;
            float3 _Combine_6f976751f1234c77908b163e59da18bb_RGB_5;
            float2 _Combine_6f976751f1234c77908b163e59da18bb_RG_6;
            Unity_Combine_float(_Split_3dee68ff9a374966b7612da59c6ac20a_B_3, _Split_3dee68ff9a374966b7612da59c6ac20a_A_4, 0, 0, _Combine_6f976751f1234c77908b163e59da18bb_RGBA_4, _Combine_6f976751f1234c77908b163e59da18bb_RGB_5, _Combine_6f976751f1234c77908b163e59da18bb_RG_6);
            float _Remap_a11bf825d8d54f198c2355e6d3cc1fba_Out_3;
            Unity_Remap_float(_Power_318bede735044ec6811f2a5c345b7d73_Out_2, _Combine_4e3ec9a6e4064091bba919631e732b7a_RG_6, _Combine_6f976751f1234c77908b163e59da18bb_RG_6, _Remap_a11bf825d8d54f198c2355e6d3cc1fba_Out_3);
            float _Absolute_553a57701af34a45a18ca7b2af677c8a_Out_1;
            Unity_Absolute_float(_Remap_a11bf825d8d54f198c2355e6d3cc1fba_Out_3, _Absolute_553a57701af34a45a18ca7b2af677c8a_Out_1);
            float _Smoothstep_6babd4aa745b40db842b941b96adf7e9_Out_3;
            Unity_Smoothstep_float(_Property_7d8e49b5efe94dea8210c34a6319b1ef_Out_0, _Property_09307b889e8945078bacabda50cca5c6_Out_0, _Absolute_553a57701af34a45a18ca7b2af677c8a_Out_1, _Smoothstep_6babd4aa745b40db842b941b96adf7e9_Out_3);
            float _Property_17631cb6b51c44b593b4fb1f0ac8fa75_Out_0 = _Base_Speed;
            float _Multiply_2e98faddc46143bea8e48ab17d0e1c15_Out_2;
            Unity_Multiply_float_float(IN.TimeParameters.x, _Property_17631cb6b51c44b593b4fb1f0ac8fa75_Out_0, _Multiply_2e98faddc46143bea8e48ab17d0e1c15_Out_2);
            float2 _TilingAndOffset_d8c83d87b12649f7b6a3902973c4457a_Out_3;
            Unity_TilingAndOffset_float((_RotateAboutAxis_1b91481bceed4e9a82a13975af123b02_Out_3.xy), float2 (1, 1), (_Multiply_2e98faddc46143bea8e48ab17d0e1c15_Out_2.xx), _TilingAndOffset_d8c83d87b12649f7b6a3902973c4457a_Out_3);
            float _Property_2792df33a4d44e20b2f71fe244d5f369_Out_0 = _Base_Scale;
            float _GradientNoise_702d412fe90e4c64b91e9defbe1ffff2_Out_2;
            Unity_GradientNoise_float(_TilingAndOffset_d8c83d87b12649f7b6a3902973c4457a_Out_3, _Property_2792df33a4d44e20b2f71fe244d5f369_Out_0, _GradientNoise_702d412fe90e4c64b91e9defbe1ffff2_Out_2);
            float _Property_a965b78b3be84255ae4ff1617bd2df01_Out_0 = _BaseStrength;
            float _Multiply_9880df30952a454781c1f0c8356100dd_Out_2;
            Unity_Multiply_float_float(_GradientNoise_702d412fe90e4c64b91e9defbe1ffff2_Out_2, _Property_a965b78b3be84255ae4ff1617bd2df01_Out_0, _Multiply_9880df30952a454781c1f0c8356100dd_Out_2);
            float _Add_98d9cdbb65e44e0282692d35bd9d237b_Out_2;
            Unity_Add_float(_Smoothstep_6babd4aa745b40db842b941b96adf7e9_Out_3, _Multiply_9880df30952a454781c1f0c8356100dd_Out_2, _Add_98d9cdbb65e44e0282692d35bd9d237b_Out_2);
            float _Add_d305fd085a9b459da3d4bd5108430b3f_Out_2;
            Unity_Add_float(1, _Property_a965b78b3be84255ae4ff1617bd2df01_Out_0, _Add_d305fd085a9b459da3d4bd5108430b3f_Out_2);
            float _Divide_55db7b7a0b8b481d83fb512a13a2dba6_Out_2;
            Unity_Divide_float(_Add_98d9cdbb65e44e0282692d35bd9d237b_Out_2, _Add_d305fd085a9b459da3d4bd5108430b3f_Out_2, _Divide_55db7b7a0b8b481d83fb512a13a2dba6_Out_2);
            float _Property_5a371e38a60143fcae81da7313c1bf15_Out_0 = _Fresnel_Power;
            float _FresnelEffect_4c470240dea248acb0092676d71437cb_Out_3;
            Unity_FresnelEffect_float(IN.WorldSpaceNormal, IN.WorldSpaceViewDirection, _Property_5a371e38a60143fcae81da7313c1bf15_Out_0, _FresnelEffect_4c470240dea248acb0092676d71437cb_Out_3);
            float _Multiply_384d15a2ef094b7e8b1ec6d69dada246_Out_2;
            Unity_Multiply_float_float(_Divide_55db7b7a0b8b481d83fb512a13a2dba6_Out_2, _FresnelEffect_4c470240dea248acb0092676d71437cb_Out_3, _Multiply_384d15a2ef094b7e8b1ec6d69dada246_Out_2);
            float _Property_3c23366c651c4949b03cb10c14ae0a27_Out_0 = _Fresnel_Opacity;
            float _Multiply_9380e32f6e4644e1b42e398229c18d31_Out_2;
            Unity_Multiply_float_float(_Multiply_384d15a2ef094b7e8b1ec6d69dada246_Out_2, _Property_3c23366c651c4949b03cb10c14ae0a27_Out_0, _Multiply_9380e32f6e4644e1b42e398229c18d31_Out_2);
            float4 _Property_dff39e3157cb4a09aac968677ade995d_Out_0 = _Color_Valley;
            float4 _Property_1b300af9e23e428fa893e55f9390600d_Out_0 = _Color_Peak;
            float4 _Lerp_6d0a20bb25554e1fa8697f473485e856_Out_3;
            Unity_Lerp_float4(_Property_dff39e3157cb4a09aac968677ade995d_Out_0, _Property_1b300af9e23e428fa893e55f9390600d_Out_0, (_Add_98d9cdbb65e44e0282692d35bd9d237b_Out_2.xxxx), _Lerp_6d0a20bb25554e1fa8697f473485e856_Out_3);
            float4 _Add_6507a6920d9c478888f235ad9d0bb542_Out_2;
            Unity_Add_float4((_Multiply_9380e32f6e4644e1b42e398229c18d31_Out_2.xxxx), _Lerp_6d0a20bb25554e1fa8697f473485e856_Out_3, _Add_6507a6920d9c478888f235ad9d0bb542_Out_2);
            float _Property_9cf7107417e042afb41766bb37be827b_Out_0 = _Emission_Strength;
            float4 _Multiply_31ae534c0cc640be9fda8de7cc705bbf_Out_2;
            Unity_Multiply_float4_float4(_Add_6507a6920d9c478888f235ad9d0bb542_Out_2, (_Property_9cf7107417e042afb41766bb37be827b_Out_0.xxxx), _Multiply_31ae534c0cc640be9fda8de7cc705bbf_Out_2);
            float _SceneDepth_619a7e0097894c29ba4557fde6cbb174_Out_1;
            Unity_SceneDepth_Eye_float(float4(IN.ScreenPosition.xy / IN.ScreenPosition.w, 0, 0), _SceneDepth_619a7e0097894c29ba4557fde6cbb174_Out_1);
            float4 _ScreenPosition_ee728e739f744068b0d15c1205d618a0_Out_0 = IN.ScreenPosition;
            float _Split_d5d8a30c527c46a19ab94602c057016e_R_1 = _ScreenPosition_ee728e739f744068b0d15c1205d618a0_Out_0[0];
            float _Split_d5d8a30c527c46a19ab94602c057016e_G_2 = _ScreenPosition_ee728e739f744068b0d15c1205d618a0_Out_0[1];
            float _Split_d5d8a30c527c46a19ab94602c057016e_B_3 = _ScreenPosition_ee728e739f744068b0d15c1205d618a0_Out_0[2];
            float _Split_d5d8a30c527c46a19ab94602c057016e_A_4 = _ScreenPosition_ee728e739f744068b0d15c1205d618a0_Out_0[3];
            float _Subtract_07eb78fa00d74ade84172a64a4a4616c_Out_2;
            Unity_Subtract_float(_Split_d5d8a30c527c46a19ab94602c057016e_A_4, 1, _Subtract_07eb78fa00d74ade84172a64a4a4616c_Out_2);
            float _Subtract_3ef0962257844c2c87b9ff8d165099f3_Out_2;
            Unity_Subtract_float(_SceneDepth_619a7e0097894c29ba4557fde6cbb174_Out_1, _Subtract_07eb78fa00d74ade84172a64a4a4616c_Out_2, _Subtract_3ef0962257844c2c87b9ff8d165099f3_Out_2);
            float _Property_9167e3d66076450baeb620b8f8b66552_Out_0 = _Depth_Fade;
            float _Divide_9a1ae8922923443883cbd9e71941de32_Out_2;
            Unity_Divide_float(_Subtract_3ef0962257844c2c87b9ff8d165099f3_Out_2, _Property_9167e3d66076450baeb620b8f8b66552_Out_0, _Divide_9a1ae8922923443883cbd9e71941de32_Out_2);
            float _Saturate_791ce4d2963e420ba68a97fca0bef8f9_Out_1;
            Unity_Saturate_float(_Divide_9a1ae8922923443883cbd9e71941de32_Out_2, _Saturate_791ce4d2963e420ba68a97fca0bef8f9_Out_1);
            surface.BaseColor = (_Add_6507a6920d9c478888f235ad9d0bb542_Out_2.xyz);
            surface.Emission = (_Multiply_31ae534c0cc640be9fda8de7cc705bbf_Out_2.xyz);
            surface.Alpha = _Saturate_791ce4d2963e420ba68a97fca0bef8f9_Out_1;
            return surface;
        }
        
            // --------------------------------------------------
            // Build Graph Inputs
            #ifdef HAVE_VFX_MODIFICATION
            #define VFX_SRP_ATTRIBUTES AttributesMesh
            #define VaryingsMeshType VaryingsMeshToPS
            #define VFX_SRP_VARYINGS VaryingsMeshType
            #define VFX_SRP_SURFACE_INPUTS FragInputs
            #endif
            SurfaceDescriptionInputs FragInputsToSurfaceDescriptionInputs(FragInputs input, float3 viewWS)
        {
            SurfaceDescriptionInputs output;
            ZERO_INITIALIZE(SurfaceDescriptionInputs, output);
        
            output.WorldSpaceNormal =                           normalize(input.tangentToWorld[2].xyz);
            #if defined(SHADER_STAGE_RAY_TRACING)
            #else
            #endif
            output.WorldSpaceViewDirection =                    normalize(viewWS);
            output.WorldSpacePosition =                         input.positionRWS;
            output.ObjectSpacePosition =                        TransformWorldToObject(input.positionRWS);
            output.ScreenPosition =                             ComputeScreenPos(TransformWorldToHClip(input.positionRWS), _ProjectionParams.x);
            output.TimeParameters =                             _TimeParameters.xyz; // This is mainly for LW as HD overwrite this value
        
            // splice point to copy frag inputs custom interpolator pack into the SDI
            /* WARNING: $splice Could not find named fragment 'CustomInterpolatorCopyToSDI' */
        
            return output;
        }
        
            // --------------------------------------------------
            // Build Surface Data (Specific Material)
        
        void BuildSurfaceData(FragInputs fragInputs, inout SurfaceDescription surfaceDescription, float3 V, PositionInputs posInput, out SurfaceData surfaceData)
        {
            // setup defaults -- these are used if the graph doesn't output a value
            ZERO_INITIALIZE(SurfaceData, surfaceData);
        
            // copy across graph values, if defined
            surfaceData.color = surfaceDescription.BaseColor;
        
            #ifdef WRITE_NORMAL_BUFFER
            // When we need to export the normal (in the depth prepass, we write the geometry one)
            surfaceData.normalWS = fragInputs.tangentToWorld[2];
            #endif
        
            #if defined(DEBUG_DISPLAY)
            if (_DebugMipMapMode != DEBUGMIPMAPMODE_NONE)
            {
                // TODO
            }
            #endif
        
            #ifdef _ENABLE_SHADOW_MATTE
        
                #if (SHADERPASS == SHADERPASS_FORWARD_UNLIT) || (SHADERPASS == SHADERPASS_RAYTRACING_GBUFFER) || (SHADERPASS == SHADERPASS_RAYTRACING_INDIRECT) || (SHADERPASS == SHADERPASS_RAYTRACING_FORWARD)
        
                    HDShadowContext shadowContext = InitShadowContext();
        
                    // Evaluate the shadow, the normal is guaranteed if shadow matte is enabled on this shader.
                    float3 shadow3;
                    ShadowLoopMin(shadowContext, posInput, normalize(fragInputs.tangentToWorld[2]), asuint(_ShadowMatteFilter), GetMeshRenderingLightLayer(), shadow3);
        
                    // Compute the average value in the fourth channel
                    float4 shadow = float4(shadow3, dot(shadow3, float3(1.0/3.0, 1.0/3.0, 1.0/3.0)));
        
                    float4 shadowColor = (1.0 - shadow) * surfaceDescription.ShadowTint.rgba;
                    float  localAlpha  = saturate(shadowColor.a + surfaceDescription.Alpha);
        
                    // Keep the nested lerp
                    // With no Color (bsdfData.color.rgb, bsdfData.color.a == 0.0f), just use ShadowColor*Color to avoid a ring of "white" around the shadow
                    // And mix color to consider the Color & ShadowColor alpha (from texture or/and color picker)
                    #ifdef _SURFACE_TYPE_TRANSPARENT
                        surfaceData.color = lerp(shadowColor.rgb * surfaceData.color, lerp(lerp(shadowColor.rgb, surfaceData.color, 1.0 - surfaceDescription.ShadowTint.a), surfaceData.color, shadow.rgb), surfaceDescription.Alpha);
                    #else
                        surfaceData.color = lerp(lerp(shadowColor.rgb, surfaceData.color, 1.0 - surfaceDescription.ShadowTint.a), surfaceData.color, shadow.rgb);
                    #endif
                    localAlpha = ApplyBlendMode(surfaceData.color, localAlpha).a;
        
                    surfaceDescription.Alpha = localAlpha;
        
                #elif SHADERPASS == SHADERPASS_PATH_TRACING
        
                    surfaceData.normalWS = fragInputs.tangentToWorld[2];
                    surfaceData.shadowTint = surfaceDescription.ShadowTint.rgba;
        
                #endif
        
            #endif // _ENABLE_SHADOW_MATTE
        }
        
            // --------------------------------------------------
            // Get Surface And BuiltinData
        
            void GetSurfaceAndBuiltinData(FragInputs fragInputs, float3 V, inout PositionInputs posInput, out SurfaceData surfaceData, out BuiltinData builtinData RAY_TRACING_OPTIONAL_PARAMETERS)
            {
                // Don't dither if displaced tessellation (we're fading out the displacement instead to match the next LOD)
                #if !defined(SHADER_STAGE_RAY_TRACING) && !defined(_TESSELLATION_DISPLACEMENT)
                #ifdef LOD_FADE_CROSSFADE // enable dithering LOD transition if user select CrossFade transition in LOD group
                LODDitheringTransition(ComputeFadeMaskSeed(V, posInput.positionSS), unity_LODFade.x);
                #endif
                #endif
        
                #ifndef SHADER_UNLIT
                #ifdef _DOUBLESIDED_ON
                    float3 doubleSidedConstants = _DoubleSidedConstants.xyz;
                #else
                    float3 doubleSidedConstants = float3(1.0, 1.0, 1.0);
                #endif
        
                ApplyDoubleSidedFlipOrMirror(fragInputs, doubleSidedConstants); // Apply double sided flip on the vertex normal
                #endif // SHADER_UNLIT
        
                SurfaceDescriptionInputs surfaceDescriptionInputs = FragInputsToSurfaceDescriptionInputs(fragInputs, V);
        
                #if defined(HAVE_VFX_MODIFICATION)
                GraphProperties properties;
                ZERO_INITIALIZE(GraphProperties, properties);
        
                GetElementPixelProperties(fragInputs, properties);
        
                SurfaceDescription surfaceDescription = SurfaceDescriptionFunction(surfaceDescriptionInputs, properties);
                #else
                SurfaceDescription surfaceDescription = SurfaceDescriptionFunction(surfaceDescriptionInputs);
                #endif
        
                // Perform alpha test very early to save performance (a killed pixel will not sample textures)
                // TODO: split graph evaluation to grab just alpha dependencies first? tricky..
                #ifdef _ALPHATEST_ON
                    float alphaCutoff = surfaceDescription.AlphaClipThreshold;
                    #if SHADERPASS == SHADERPASS_TRANSPARENT_DEPTH_PREPASS
                    // The TransparentDepthPrepass is also used with SSR transparent.
                    // If an artists enable transaprent SSR but not the TransparentDepthPrepass itself, then we use AlphaClipThreshold
                    // otherwise if TransparentDepthPrepass is enabled we use AlphaClipThresholdDepthPrepass
                    #elif SHADERPASS == SHADERPASS_TRANSPARENT_DEPTH_POSTPASS
                    // DepthPostpass always use its own alpha threshold
                    alphaCutoff = surfaceDescription.AlphaClipThresholdDepthPostpass;
                    #elif (SHADERPASS == SHADERPASS_SHADOWS) || (SHADERPASS == SHADERPASS_RAYTRACING_VISIBILITY)
                    // If use shadow threshold isn't enable we don't allow any test
                    #endif
        
                    GENERIC_ALPHA_TEST(surfaceDescription.Alpha, alphaCutoff);
                #endif
        
                #if !defined(SHADER_STAGE_RAY_TRACING) && _DEPTHOFFSET_ON
                ApplyDepthOffsetPositionInput(V, surfaceDescription.DepthOffset, GetViewForwardDir(), GetWorldToHClipMatrix(), posInput);
                #endif
        
                #ifndef SHADER_UNLIT
                float3 bentNormalWS;
                BuildSurfaceData(fragInputs, surfaceDescription, V, posInput, surfaceData, bentNormalWS);
        
                #ifdef FRAG_INPUTS_USE_TEXCOORD1
                    float4 lightmapTexCoord1 = fragInputs.texCoord1;
                #else
                    float4 lightmapTexCoord1 = float4(0,0,0,0);
                #endif
        
                #ifdef FRAG_INPUTS_USE_TEXCOORD2
                    float4 lightmapTexCoord2 = fragInputs.texCoord2;
                #else
                    float4 lightmapTexCoord2 = float4(0,0,0,0);
                #endif
        
                // Builtin Data
                // For back lighting we use the oposite vertex normal
                InitBuiltinData(posInput, surfaceDescription.Alpha, bentNormalWS, -fragInputs.tangentToWorld[2], lightmapTexCoord1, lightmapTexCoord2, builtinData);
        
                #else
                BuildSurfaceData(fragInputs, surfaceDescription, V, posInput, surfaceData);
        
                ZERO_BUILTIN_INITIALIZE(builtinData); // No call to InitBuiltinData as we don't have any lighting
                builtinData.opacity = surfaceDescription.Alpha;
        
                #if defined(DEBUG_DISPLAY)
                    // Light Layers are currently not used for the Unlit shader (because it is not lit)
                    // But Unlit objects do cast shadows according to their rendering layer mask, which is what we want to
                    // display in the light layers visualization mode, therefore we need the renderingLayers
                    builtinData.renderingLayers = GetMeshRenderingLightLayer();
                #endif
        
                #endif // SHADER_UNLIT
        
                #ifdef _ALPHATEST_ON
                    // Used for sharpening by alpha to mask - Alpha to covertage is only used with depth only and forward pass (no shadow pass, no transparent pass)
                    builtinData.alphaClipTreshold = alphaCutoff;
                #endif
        
                // override sampleBakedGI - not used by Unlit
        
                builtinData.emissiveColor = surfaceDescription.Emission;
        
                // Note this will not fully work on transparent surfaces (can check with _SURFACE_TYPE_TRANSPARENT define)
                // We will always overwrite vt feeback with the nearest. So behind transparent surfaces vt will not be resolved
                // This is a limitation of the current MRT approach.
                #ifdef UNITY_VIRTUAL_TEXTURING
                #endif
        
                #if _DEPTHOFFSET_ON
                builtinData.depthOffset = surfaceDescription.DepthOffset;
                #endif
        
                // TODO: We should generate distortion / distortionBlur for non distortion pass
                #if (SHADERPASS == SHADERPASS_DISTORTION)
                builtinData.distortion = surfaceDescription.Distortion;
                builtinData.distortionBlur = surfaceDescription.DistortionBlur;
                #endif
        
                #ifndef SHADER_UNLIT
                // PostInitBuiltinData call ApplyDebugToBuiltinData
                PostInitBuiltinData(V, posInput, surfaceData, builtinData);
                #else
                ApplyDebugToBuiltinData(builtinData);
                #endif
        
                RAY_TRACING_OPTIONAL_ALPHA_TEST_PASS
            }
        
            // --------------------------------------------------
            // Main
        
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/ShaderPass/ShaderPassRaytracingIndirect.hlsl"
        
            // --------------------------------------------------
            // Visual Effect Vertex Invocations
        
        	#ifdef HAVE_VFX_MODIFICATION
        	#include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/VisualEffectVertex.hlsl"
        	#endif
        
            ENDHLSL
        }
        Pass
        {
            Name "VisibilityDXR"
            Tags
            {
                "LightMode" = "VisibilityDXR"
            }
        
            // Render State
            // RenderState: <None>
        
            // Debug
            // <None>
        
            // --------------------------------------------------
            // Pass
        
            HLSLPROGRAM
        
            // Pragmas
            #pragma target 5.0
        #pragma raytracing surface_shader
        #pragma only_renderers d3d11 ps5
        
            // Keywords
            #pragma multi_compile _ TRANSPARENT_COLOR_SHADOW
        #pragma shader_feature _ _SURFACE_TYPE_TRANSPARENT
        #pragma shader_feature_local _BLENDMODE_OFF _BLENDMODE_ALPHA _BLENDMODE_ADD _BLENDMODE_PRE_MULTIPLY
        #pragma shader_feature_local _ _ADD_PRECOMPUTED_VELOCITY
        #pragma shader_feature_local _ _TRANSPARENT_WRITES_MOTION_VEC
        #pragma shader_feature_local_fragment _ _ENABLE_FOG_ON_TRANSPARENT
            // GraphKeywords: <None>
        
            // Early Instancing Defines
            // DotsInstancingOptions: <None>
        
            // Injected Instanced Properties (must be included before UnityInstancing.hlsl)
            // HybridV1InjectedBuiltinProperties: <None>
        
            // For custom interpolators to inject a substruct definition before FragInputs definition,
            // allowing for FragInputs to capture CI's intended for ShaderGraph's SDI.
            /* WARNING: $splice Could not find named fragment 'CustomInterpolatorPreInclude' */
        
        
            // TODO: Merge FragInputsVFX substruct with CustomInterpolators.
        	#ifdef HAVE_VFX_MODIFICATION
        	struct FragInputsVFX
            {
                /* WARNING: $splice Could not find named fragment 'FragInputsVFX' */
            };
            #endif
        
            #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Common.hlsl"
        	#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/GeometricTools.hlsl" // Required by Tessellation.hlsl
        	#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Tessellation.hlsl"
            #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Texture.hlsl"
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderVariables.hlsl"
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/ShaderPass/ShaderPass.cs.hlsl"
            #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/TextureStack.hlsl" // Required to be include before we include properties as it define DECLARE_STACK_CB
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderGraphHeader.hlsl" // Need to be here for Gradient struct definition
        
            // --------------------------------------------------
            // Defines
        
            // Attribute
            #define ATTRIBUTES_NEED_NORMAL
            #define ATTRIBUTES_NEED_TANGENT
            #define VARYINGS_NEED_POSITION_WS
            #define VARYINGS_NEED_TANGENT_TO_WORLD
        
        
            //Strip down the FragInputs.hlsl (on graphics), so we can only optimize the interpolators we use.
            //if by accident something requests contents of FragInputs.hlsl, it will be caught as a compiler error
            //Frag inputs stripping is only enabled when FRAG_INPUTS_ENABLE_STRIPPING is set
            #if !defined(SHADER_STAGE_RAY_TRACING) && SHADERPASS != SHADERPASS_RAYTRACING_GBUFFER && SHADERPASS != SHADERPASS_FULL_SCREEN_DEBUG
            #define FRAG_INPUTS_ENABLE_STRIPPING
            #endif
        
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/ShaderPass/FragInputs.hlsl"
        
        
        
            #define SHADERPASS SHADERPASS_RAYTRACING_VISIBILITY
        #define REQUIRE_DEPTH_TEXTURE
        
        
            // Following two define are a workaround introduce in 10.1.x for RaytracingQualityNode
            // The ShaderGraph don't support correctly migration of this node as it serialize all the node data
            // in the json file making it impossible to uprgrade. Until we get a fix, we do a workaround here
            // to still allow us to rename the field and keyword of this node without breaking existing code.
            #ifdef RAYTRACING_SHADER_GRAPH_DEFAULT
            #define RAYTRACING_SHADER_GRAPH_HIGH
            #endif
        
            #ifdef RAYTRACING_SHADER_GRAPH_RAYTRACED
            #define RAYTRACING_SHADER_GRAPH_LOW
            #endif
            // end
        
            #ifndef SHADER_UNLIT
            // We need isFrontFace when using double sided - it is not required for unlit as in case of unlit double sided only drive the cullmode
            // VARYINGS_NEED_CULLFACE can be define by VaryingsMeshToPS.FaceSign input if a IsFrontFace Node is included in the shader graph.
            #if defined(_DOUBLESIDED_ON) && !defined(VARYINGS_NEED_CULLFACE)
                #define VARYINGS_NEED_CULLFACE
            #endif
            #endif
        
            // Specific Material Define
        // Setup a define to say we are an unlit shader
        #define SHADER_UNLIT
        
        // Following Macro are only used by Unlit material
        #if defined(_ENABLE_SHADOW_MATTE) && (SHADERPASS == SHADERPASS_FORWARD_UNLIT || SHADERPASS == SHADERPASS_PATH_TRACING)
        #define LIGHTLOOP_DISABLE_TILE_AND_CLUSTER
        #define HAS_LIGHTLOOP
        #endif
            // Caution: we can use the define SHADER_UNLIT onlit after the above Material include as it is the Unlit template who define it
        
            // To handle SSR on transparent correctly with a possibility to enable/disable it per framesettings
            // we should have a code like this:
            // if !defined(_DISABLE_SSR_TRANSPARENT)
            // pragma multi_compile _ WRITE_NORMAL_BUFFER
            // endif
            // i.e we enable the multicompile only if we can receive SSR or not, and then C# code drive
            // it based on if SSR transparent in frame settings and not (and stripper can strip it).
            // this is currently not possible with our current preprocessor as _DISABLE_SSR_TRANSPARENT is a keyword not a define
            // so instead we used this and chose to pay the extra cost of normal write even if SSR transaprent is disabled.
            // Ideally the shader graph generator should handle it but condition below can't be handle correctly for now.
            #if SHADERPASS == SHADERPASS_TRANSPARENT_DEPTH_PREPASS
            #if !defined(_DISABLE_SSR_TRANSPARENT) && !defined(SHADER_UNLIT)
                #define WRITE_NORMAL_BUFFER
            #endif
            #endif
        
            #ifndef DEBUG_DISPLAY
                // In case of opaque we don't want to perform the alpha test, it is done in depth prepass and we use depth equal for ztest (setup from UI)
                // Don't do it with debug display mode as it is possible there is no depth prepass in this case
                #if !defined(_SURFACE_TYPE_TRANSPARENT)
                    #if SHADERPASS == SHADERPASS_FORWARD
                    #define SHADERPASS_FORWARD_BYPASS_ALPHA_TEST
                    #elif SHADERPASS == SHADERPASS_GBUFFER
                    #define SHADERPASS_GBUFFER_BYPASS_ALPHA_TEST
                    #endif
                #endif
            #endif
        
            // Define _DEFERRED_CAPABLE_MATERIAL for shader capable to run in deferred pass
            #if defined(SHADER_LIT) && !defined(_SURFACE_TYPE_TRANSPARENT)
                #define _DEFERRED_CAPABLE_MATERIAL
            #endif
        
            // Translate transparent motion vector define
            #if defined(_TRANSPARENT_WRITES_MOTION_VEC) && defined(_SURFACE_TYPE_TRANSPARENT)
                #define _WRITE_TRANSPARENT_MOTION_VECTOR
            #endif
        
            // -- Graph Properties
            CBUFFER_START(UnityPerMaterial)
        float4 _Rotate_Projection;
        float _Noise_Scale;
        float _Speed;
        float _Vertexoffset;
        float4 _Remap_xy_zw;
        float4 _Color_Peak;
        float4 _Color_Valley;
        float _SmoothEdge1;
        float _SmoothEdge2;
        float _Cloud_Pow;
        float _Base_Scale;
        float _Base_Speed;
        float _BaseStrength;
        float _Emission_Strength;
        float _Curvate_Radius;
        float _Fresnel_Power;
        float _Fresnel_Opacity;
        float _Depth_Fade;
        float4 _EmissionColor;
        float _UseShadowThreshold;
        float4 _DoubleSidedConstants;
        float _BlendMode;
        float _EnableBlendModePreserveSpecularLighting;
        CBUFFER_END
        
        // Object and Global properties
        
            // -- Property used by ScenePickingPass
            #ifdef SCENEPICKINGPASS
            float4 _SelectionID;
            #endif
        
            // -- Properties used by SceneSelectionPass
            #ifdef SCENESELECTIONPASS
            int _ObjectId;
            int _PassValue;
            #endif
        
            // Includes
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/Raytracing/Shaders/RaytracingMacros.hlsl"
        #include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/Raytracing/Shaders/ShaderVariablesRaytracing.hlsl"
        #include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Material.hlsl"
        #include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/Raytracing/Shaders/ShaderVariablesRaytracingLightLoop.hlsl"
        #include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/Raytracing/Shaders/RaytracingIntersection.hlsl"
        #include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Unlit/Unlit.hlsl"
        #include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Unlit/UnlitRaytracing.hlsl"
        #include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/BuiltinUtilities.hlsl"
        #include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/MaterialUtilities.hlsl"
        #include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/Raytracing/Shaders/RayTracingCommon.hlsl"
        #include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderGraphFunctions.hlsl"
        	// GraphIncludes: <None>
        
            // --------------------------------------------------
            // Structs and Packing
        
            struct SurfaceDescriptionInputs
        {
             float3 WorldSpaceNormal;
             float3 WorldSpaceViewDirection;
             float3 ObjectSpacePosition;
             float3 WorldSpacePosition;
             float4 ScreenPosition;
             float3 TimeParameters;
        };
        
            //Interpolator Packs: <None>
        
            // --------------------------------------------------
            // Graph
        
        
            // Graph Functions
            
        void Unity_Rotate_About_Axis_Radians_float(float3 In, float3 Axis, float Rotation, out float3 Out)
        {
            float s = sin(Rotation);
            float c = cos(Rotation);
            float one_minus_c = 1.0 - c;
        
            Axis = normalize(Axis);
        
            float3x3 rot_mat = { one_minus_c * Axis.x * Axis.x + c,            one_minus_c * Axis.x * Axis.y - Axis.z * s,     one_minus_c * Axis.z * Axis.x + Axis.y * s,
                                      one_minus_c * Axis.x * Axis.y + Axis.z * s,   one_minus_c * Axis.y * Axis.y + c,              one_minus_c * Axis.y * Axis.z - Axis.x * s,
                                      one_minus_c * Axis.z * Axis.x - Axis.y * s,   one_minus_c * Axis.y * Axis.z + Axis.x * s,     one_minus_c * Axis.z * Axis.z + c
                                    };
        
            Out = mul(rot_mat,  In);
        }
        
        void Unity_Multiply_float_float(float A, float B, out float Out)
        {
            Out = A * B;
        }
        
        void Unity_TilingAndOffset_float(float2 UV, float2 Tiling, float2 Offset, out float2 Out)
        {
            Out = UV * Tiling + Offset;
        }
        
        
        float2 Unity_GradientNoise_Dir_float(float2 p)
        {
            // Permutation and hashing used in webgl-nosie goo.gl/pX7HtC
            p = p % 289;
            // need full precision, otherwise half overflows when p > 1
            float x = float(34 * p.x + 1) * p.x % 289 + p.y;
            x = (34 * x + 1) * x % 289;
            x = frac(x / 41) * 2 - 1;
            return normalize(float2(x - floor(x + 0.5), abs(x) - 0.5));
        }
        
        void Unity_GradientNoise_float(float2 UV, float Scale, out float Out)
        {
            float2 p = UV * Scale;
            float2 ip = floor(p);
            float2 fp = frac(p);
            float d00 = dot(Unity_GradientNoise_Dir_float(ip), fp);
            float d01 = dot(Unity_GradientNoise_Dir_float(ip + float2(0, 1)), fp - float2(0, 1));
            float d10 = dot(Unity_GradientNoise_Dir_float(ip + float2(1, 0)), fp - float2(1, 0));
            float d11 = dot(Unity_GradientNoise_Dir_float(ip + float2(1, 1)), fp - float2(1, 1));
            fp = fp * fp * fp * (fp * (fp * 6 - 15) + 10);
            Out = lerp(lerp(d00, d01, fp.y), lerp(d10, d11, fp.y), fp.x) + 0.5;
        }
        
        void Unity_Add_float(float A, float B, out float Out)
        {
            Out = A + B;
        }
        
        void Unity_Divide_float(float A, float B, out float Out)
        {
            Out = A / B;
        }
        
        void Unity_Saturate_float(float In, out float Out)
        {
            Out = saturate(In);
        }
        
        void Unity_Power_float(float A, float B, out float Out)
        {
            Out = pow(A, B);
        }
        
        void Unity_Combine_float(float R, float G, float B, float A, out float4 RGBA, out float3 RGB, out float2 RG)
        {
            RGBA = float4(R, G, B, A);
            RGB = float3(R, G, B);
            RG = float2(R, G);
        }
        
        void Unity_Remap_float(float In, float2 InMinMax, float2 OutMinMax, out float Out)
        {
            Out = OutMinMax.x + (In - InMinMax.x) * (OutMinMax.y - OutMinMax.x) / (InMinMax.y - InMinMax.x);
        }
        
        void Unity_Absolute_float(float In, out float Out)
        {
            Out = abs(In);
        }
        
        void Unity_Smoothstep_float(float Edge1, float Edge2, float In, out float Out)
        {
            Out = smoothstep(Edge1, Edge2, In);
        }
        
        void Unity_FresnelEffect_float(float3 Normal, float3 ViewDir, float Power, out float Out)
        {
            Out = pow((1.0 - saturate(dot(normalize(Normal), normalize(ViewDir)))), Power);
        }
        
        void Unity_Lerp_float4(float4 A, float4 B, float4 T, out float4 Out)
        {
            Out = lerp(A, B, T);
        }
        
        void Unity_Add_float4(float4 A, float4 B, out float4 Out)
        {
            Out = A + B;
        }
        
        void Unity_Multiply_float4_float4(float4 A, float4 B, out float4 Out)
        {
            Out = A * B;
        }
        
        void Unity_SceneDepth_Eye_float(float4 UV, out float Out)
        {
            if (unity_OrthoParams.w == 1.0)
            {
                Out = LinearEyeDepth(ComputeWorldSpacePosition(UV.xy, SHADERGRAPH_SAMPLE_SCENE_DEPTH(UV.xy), UNITY_MATRIX_I_VP), UNITY_MATRIX_V);
            }
            else
            {
                Out = LinearEyeDepth(SHADERGRAPH_SAMPLE_SCENE_DEPTH(UV.xy), _ZBufferParams);
            }
        }
        
        void Unity_Subtract_float(float A, float B, out float Out)
        {
            Out = A - B;
        }
        
            // Graph Vertex
            // GraphVertex: <None>
        
            // Graph Pixel
            struct SurfaceDescription
        {
            float3 BaseColor;
            float3 Emission;
            float Alpha;
        };
        
        SurfaceDescription SurfaceDescriptionFunction(SurfaceDescriptionInputs IN)
        {
            SurfaceDescription surface = (SurfaceDescription)0;
            float _Property_7d8e49b5efe94dea8210c34a6319b1ef_Out_0 = _SmoothEdge1;
            float _Property_09307b889e8945078bacabda50cca5c6_Out_0 = _SmoothEdge2;
            float4 _Property_a8d53d7ea07349e0979b956475bdd7cc_Out_0 = _Rotate_Projection;
            float _Split_7d12b2bb5feb46d685603473d0cf5818_R_1 = _Property_a8d53d7ea07349e0979b956475bdd7cc_Out_0[0];
            float _Split_7d12b2bb5feb46d685603473d0cf5818_G_2 = _Property_a8d53d7ea07349e0979b956475bdd7cc_Out_0[1];
            float _Split_7d12b2bb5feb46d685603473d0cf5818_B_3 = _Property_a8d53d7ea07349e0979b956475bdd7cc_Out_0[2];
            float _Split_7d12b2bb5feb46d685603473d0cf5818_A_4 = _Property_a8d53d7ea07349e0979b956475bdd7cc_Out_0[3];
            float3 _RotateAboutAxis_1b91481bceed4e9a82a13975af123b02_Out_3;
            Unity_Rotate_About_Axis_Radians_float(IN.ObjectSpacePosition, (_Property_a8d53d7ea07349e0979b956475bdd7cc_Out_0.xyz), _Split_7d12b2bb5feb46d685603473d0cf5818_A_4, _RotateAboutAxis_1b91481bceed4e9a82a13975af123b02_Out_3);
            float _Property_258f4645340c46f69274c9f077f1a73c_Out_0 = _Speed;
            float _Multiply_94f6d857831c4e69b53b9bfc92dd852f_Out_2;
            Unity_Multiply_float_float(IN.TimeParameters.x, _Property_258f4645340c46f69274c9f077f1a73c_Out_0, _Multiply_94f6d857831c4e69b53b9bfc92dd852f_Out_2);
            float2 _TilingAndOffset_6cb9fd57231c4a429c9c0fe5aeb7cc58_Out_3;
            Unity_TilingAndOffset_float((_RotateAboutAxis_1b91481bceed4e9a82a13975af123b02_Out_3.xy), float2 (1, 1), (_Multiply_94f6d857831c4e69b53b9bfc92dd852f_Out_2.xx), _TilingAndOffset_6cb9fd57231c4a429c9c0fe5aeb7cc58_Out_3);
            float _Property_2b9001a870d04f8eb60f5d7e1ce909c5_Out_0 = _Noise_Scale;
            float _GradientNoise_061679506b214bb8b4792ec4dfe82ec6_Out_2;
            Unity_GradientNoise_float(_TilingAndOffset_6cb9fd57231c4a429c9c0fe5aeb7cc58_Out_3, _Property_2b9001a870d04f8eb60f5d7e1ce909c5_Out_0, _GradientNoise_061679506b214bb8b4792ec4dfe82ec6_Out_2);
            float2 _TilingAndOffset_1d2491b5855e49d3b2e6b5dbe5db07d4_Out_3;
            Unity_TilingAndOffset_float((_RotateAboutAxis_1b91481bceed4e9a82a13975af123b02_Out_3.xy), float2 (1, 1), float2 (0, 0), _TilingAndOffset_1d2491b5855e49d3b2e6b5dbe5db07d4_Out_3);
            float _GradientNoise_8a27c3fb323f4db1b38f287380605198_Out_2;
            Unity_GradientNoise_float(_TilingAndOffset_1d2491b5855e49d3b2e6b5dbe5db07d4_Out_3, _Property_2b9001a870d04f8eb60f5d7e1ce909c5_Out_0, _GradientNoise_8a27c3fb323f4db1b38f287380605198_Out_2);
            float _Add_a6dd2d6e3f564decbca34ec03a419130_Out_2;
            Unity_Add_float(_GradientNoise_061679506b214bb8b4792ec4dfe82ec6_Out_2, _GradientNoise_8a27c3fb323f4db1b38f287380605198_Out_2, _Add_a6dd2d6e3f564decbca34ec03a419130_Out_2);
            float _Divide_a757ea7167f343ecaec30e69b58c9bae_Out_2;
            Unity_Divide_float(_Add_a6dd2d6e3f564decbca34ec03a419130_Out_2, 2, _Divide_a757ea7167f343ecaec30e69b58c9bae_Out_2);
            float _Saturate_f355ba5a467f4488b7ec89e8a08484a3_Out_1;
            Unity_Saturate_float(_Divide_a757ea7167f343ecaec30e69b58c9bae_Out_2, _Saturate_f355ba5a467f4488b7ec89e8a08484a3_Out_1);
            float _Property_96da655cc17e4594836aa02d74efe33c_Out_0 = _Cloud_Pow;
            float _Power_318bede735044ec6811f2a5c345b7d73_Out_2;
            Unity_Power_float(_Saturate_f355ba5a467f4488b7ec89e8a08484a3_Out_1, _Property_96da655cc17e4594836aa02d74efe33c_Out_0, _Power_318bede735044ec6811f2a5c345b7d73_Out_2);
            float4 _Property_317e8becc0724841a13cbcf8d4c4efbc_Out_0 = _Remap_xy_zw;
            float _Split_3dee68ff9a374966b7612da59c6ac20a_R_1 = _Property_317e8becc0724841a13cbcf8d4c4efbc_Out_0[0];
            float _Split_3dee68ff9a374966b7612da59c6ac20a_G_2 = _Property_317e8becc0724841a13cbcf8d4c4efbc_Out_0[1];
            float _Split_3dee68ff9a374966b7612da59c6ac20a_B_3 = _Property_317e8becc0724841a13cbcf8d4c4efbc_Out_0[2];
            float _Split_3dee68ff9a374966b7612da59c6ac20a_A_4 = _Property_317e8becc0724841a13cbcf8d4c4efbc_Out_0[3];
            float4 _Combine_4e3ec9a6e4064091bba919631e732b7a_RGBA_4;
            float3 _Combine_4e3ec9a6e4064091bba919631e732b7a_RGB_5;
            float2 _Combine_4e3ec9a6e4064091bba919631e732b7a_RG_6;
            Unity_Combine_float(_Split_3dee68ff9a374966b7612da59c6ac20a_R_1, _Split_3dee68ff9a374966b7612da59c6ac20a_G_2, 0, 0, _Combine_4e3ec9a6e4064091bba919631e732b7a_RGBA_4, _Combine_4e3ec9a6e4064091bba919631e732b7a_RGB_5, _Combine_4e3ec9a6e4064091bba919631e732b7a_RG_6);
            float4 _Combine_6f976751f1234c77908b163e59da18bb_RGBA_4;
            float3 _Combine_6f976751f1234c77908b163e59da18bb_RGB_5;
            float2 _Combine_6f976751f1234c77908b163e59da18bb_RG_6;
            Unity_Combine_float(_Split_3dee68ff9a374966b7612da59c6ac20a_B_3, _Split_3dee68ff9a374966b7612da59c6ac20a_A_4, 0, 0, _Combine_6f976751f1234c77908b163e59da18bb_RGBA_4, _Combine_6f976751f1234c77908b163e59da18bb_RGB_5, _Combine_6f976751f1234c77908b163e59da18bb_RG_6);
            float _Remap_a11bf825d8d54f198c2355e6d3cc1fba_Out_3;
            Unity_Remap_float(_Power_318bede735044ec6811f2a5c345b7d73_Out_2, _Combine_4e3ec9a6e4064091bba919631e732b7a_RG_6, _Combine_6f976751f1234c77908b163e59da18bb_RG_6, _Remap_a11bf825d8d54f198c2355e6d3cc1fba_Out_3);
            float _Absolute_553a57701af34a45a18ca7b2af677c8a_Out_1;
            Unity_Absolute_float(_Remap_a11bf825d8d54f198c2355e6d3cc1fba_Out_3, _Absolute_553a57701af34a45a18ca7b2af677c8a_Out_1);
            float _Smoothstep_6babd4aa745b40db842b941b96adf7e9_Out_3;
            Unity_Smoothstep_float(_Property_7d8e49b5efe94dea8210c34a6319b1ef_Out_0, _Property_09307b889e8945078bacabda50cca5c6_Out_0, _Absolute_553a57701af34a45a18ca7b2af677c8a_Out_1, _Smoothstep_6babd4aa745b40db842b941b96adf7e9_Out_3);
            float _Property_17631cb6b51c44b593b4fb1f0ac8fa75_Out_0 = _Base_Speed;
            float _Multiply_2e98faddc46143bea8e48ab17d0e1c15_Out_2;
            Unity_Multiply_float_float(IN.TimeParameters.x, _Property_17631cb6b51c44b593b4fb1f0ac8fa75_Out_0, _Multiply_2e98faddc46143bea8e48ab17d0e1c15_Out_2);
            float2 _TilingAndOffset_d8c83d87b12649f7b6a3902973c4457a_Out_3;
            Unity_TilingAndOffset_float((_RotateAboutAxis_1b91481bceed4e9a82a13975af123b02_Out_3.xy), float2 (1, 1), (_Multiply_2e98faddc46143bea8e48ab17d0e1c15_Out_2.xx), _TilingAndOffset_d8c83d87b12649f7b6a3902973c4457a_Out_3);
            float _Property_2792df33a4d44e20b2f71fe244d5f369_Out_0 = _Base_Scale;
            float _GradientNoise_702d412fe90e4c64b91e9defbe1ffff2_Out_2;
            Unity_GradientNoise_float(_TilingAndOffset_d8c83d87b12649f7b6a3902973c4457a_Out_3, _Property_2792df33a4d44e20b2f71fe244d5f369_Out_0, _GradientNoise_702d412fe90e4c64b91e9defbe1ffff2_Out_2);
            float _Property_a965b78b3be84255ae4ff1617bd2df01_Out_0 = _BaseStrength;
            float _Multiply_9880df30952a454781c1f0c8356100dd_Out_2;
            Unity_Multiply_float_float(_GradientNoise_702d412fe90e4c64b91e9defbe1ffff2_Out_2, _Property_a965b78b3be84255ae4ff1617bd2df01_Out_0, _Multiply_9880df30952a454781c1f0c8356100dd_Out_2);
            float _Add_98d9cdbb65e44e0282692d35bd9d237b_Out_2;
            Unity_Add_float(_Smoothstep_6babd4aa745b40db842b941b96adf7e9_Out_3, _Multiply_9880df30952a454781c1f0c8356100dd_Out_2, _Add_98d9cdbb65e44e0282692d35bd9d237b_Out_2);
            float _Add_d305fd085a9b459da3d4bd5108430b3f_Out_2;
            Unity_Add_float(1, _Property_a965b78b3be84255ae4ff1617bd2df01_Out_0, _Add_d305fd085a9b459da3d4bd5108430b3f_Out_2);
            float _Divide_55db7b7a0b8b481d83fb512a13a2dba6_Out_2;
            Unity_Divide_float(_Add_98d9cdbb65e44e0282692d35bd9d237b_Out_2, _Add_d305fd085a9b459da3d4bd5108430b3f_Out_2, _Divide_55db7b7a0b8b481d83fb512a13a2dba6_Out_2);
            float _Property_5a371e38a60143fcae81da7313c1bf15_Out_0 = _Fresnel_Power;
            float _FresnelEffect_4c470240dea248acb0092676d71437cb_Out_3;
            Unity_FresnelEffect_float(IN.WorldSpaceNormal, IN.WorldSpaceViewDirection, _Property_5a371e38a60143fcae81da7313c1bf15_Out_0, _FresnelEffect_4c470240dea248acb0092676d71437cb_Out_3);
            float _Multiply_384d15a2ef094b7e8b1ec6d69dada246_Out_2;
            Unity_Multiply_float_float(_Divide_55db7b7a0b8b481d83fb512a13a2dba6_Out_2, _FresnelEffect_4c470240dea248acb0092676d71437cb_Out_3, _Multiply_384d15a2ef094b7e8b1ec6d69dada246_Out_2);
            float _Property_3c23366c651c4949b03cb10c14ae0a27_Out_0 = _Fresnel_Opacity;
            float _Multiply_9380e32f6e4644e1b42e398229c18d31_Out_2;
            Unity_Multiply_float_float(_Multiply_384d15a2ef094b7e8b1ec6d69dada246_Out_2, _Property_3c23366c651c4949b03cb10c14ae0a27_Out_0, _Multiply_9380e32f6e4644e1b42e398229c18d31_Out_2);
            float4 _Property_dff39e3157cb4a09aac968677ade995d_Out_0 = _Color_Valley;
            float4 _Property_1b300af9e23e428fa893e55f9390600d_Out_0 = _Color_Peak;
            float4 _Lerp_6d0a20bb25554e1fa8697f473485e856_Out_3;
            Unity_Lerp_float4(_Property_dff39e3157cb4a09aac968677ade995d_Out_0, _Property_1b300af9e23e428fa893e55f9390600d_Out_0, (_Add_98d9cdbb65e44e0282692d35bd9d237b_Out_2.xxxx), _Lerp_6d0a20bb25554e1fa8697f473485e856_Out_3);
            float4 _Add_6507a6920d9c478888f235ad9d0bb542_Out_2;
            Unity_Add_float4((_Multiply_9380e32f6e4644e1b42e398229c18d31_Out_2.xxxx), _Lerp_6d0a20bb25554e1fa8697f473485e856_Out_3, _Add_6507a6920d9c478888f235ad9d0bb542_Out_2);
            float _Property_9cf7107417e042afb41766bb37be827b_Out_0 = _Emission_Strength;
            float4 _Multiply_31ae534c0cc640be9fda8de7cc705bbf_Out_2;
            Unity_Multiply_float4_float4(_Add_6507a6920d9c478888f235ad9d0bb542_Out_2, (_Property_9cf7107417e042afb41766bb37be827b_Out_0.xxxx), _Multiply_31ae534c0cc640be9fda8de7cc705bbf_Out_2);
            float _SceneDepth_619a7e0097894c29ba4557fde6cbb174_Out_1;
            Unity_SceneDepth_Eye_float(float4(IN.ScreenPosition.xy / IN.ScreenPosition.w, 0, 0), _SceneDepth_619a7e0097894c29ba4557fde6cbb174_Out_1);
            float4 _ScreenPosition_ee728e739f744068b0d15c1205d618a0_Out_0 = IN.ScreenPosition;
            float _Split_d5d8a30c527c46a19ab94602c057016e_R_1 = _ScreenPosition_ee728e739f744068b0d15c1205d618a0_Out_0[0];
            float _Split_d5d8a30c527c46a19ab94602c057016e_G_2 = _ScreenPosition_ee728e739f744068b0d15c1205d618a0_Out_0[1];
            float _Split_d5d8a30c527c46a19ab94602c057016e_B_3 = _ScreenPosition_ee728e739f744068b0d15c1205d618a0_Out_0[2];
            float _Split_d5d8a30c527c46a19ab94602c057016e_A_4 = _ScreenPosition_ee728e739f744068b0d15c1205d618a0_Out_0[3];
            float _Subtract_07eb78fa00d74ade84172a64a4a4616c_Out_2;
            Unity_Subtract_float(_Split_d5d8a30c527c46a19ab94602c057016e_A_4, 1, _Subtract_07eb78fa00d74ade84172a64a4a4616c_Out_2);
            float _Subtract_3ef0962257844c2c87b9ff8d165099f3_Out_2;
            Unity_Subtract_float(_SceneDepth_619a7e0097894c29ba4557fde6cbb174_Out_1, _Subtract_07eb78fa00d74ade84172a64a4a4616c_Out_2, _Subtract_3ef0962257844c2c87b9ff8d165099f3_Out_2);
            float _Property_9167e3d66076450baeb620b8f8b66552_Out_0 = _Depth_Fade;
            float _Divide_9a1ae8922923443883cbd9e71941de32_Out_2;
            Unity_Divide_float(_Subtract_3ef0962257844c2c87b9ff8d165099f3_Out_2, _Property_9167e3d66076450baeb620b8f8b66552_Out_0, _Divide_9a1ae8922923443883cbd9e71941de32_Out_2);
            float _Saturate_791ce4d2963e420ba68a97fca0bef8f9_Out_1;
            Unity_Saturate_float(_Divide_9a1ae8922923443883cbd9e71941de32_Out_2, _Saturate_791ce4d2963e420ba68a97fca0bef8f9_Out_1);
            surface.BaseColor = (_Add_6507a6920d9c478888f235ad9d0bb542_Out_2.xyz);
            surface.Emission = (_Multiply_31ae534c0cc640be9fda8de7cc705bbf_Out_2.xyz);
            surface.Alpha = _Saturate_791ce4d2963e420ba68a97fca0bef8f9_Out_1;
            return surface;
        }
        
            // --------------------------------------------------
            // Build Graph Inputs
            #ifdef HAVE_VFX_MODIFICATION
            #define VFX_SRP_ATTRIBUTES AttributesMesh
            #define VaryingsMeshType VaryingsMeshToPS
            #define VFX_SRP_VARYINGS VaryingsMeshType
            #define VFX_SRP_SURFACE_INPUTS FragInputs
            #endif
            SurfaceDescriptionInputs FragInputsToSurfaceDescriptionInputs(FragInputs input, float3 viewWS)
        {
            SurfaceDescriptionInputs output;
            ZERO_INITIALIZE(SurfaceDescriptionInputs, output);
        
            output.WorldSpaceNormal =                           normalize(input.tangentToWorld[2].xyz);
            #if defined(SHADER_STAGE_RAY_TRACING)
            #else
            #endif
            output.WorldSpaceViewDirection =                    normalize(viewWS);
            output.WorldSpacePosition =                         input.positionRWS;
            output.ObjectSpacePosition =                        TransformWorldToObject(input.positionRWS);
            output.ScreenPosition =                             ComputeScreenPos(TransformWorldToHClip(input.positionRWS), _ProjectionParams.x);
            output.TimeParameters =                             _TimeParameters.xyz; // This is mainly for LW as HD overwrite this value
        
            // splice point to copy frag inputs custom interpolator pack into the SDI
            /* WARNING: $splice Could not find named fragment 'CustomInterpolatorCopyToSDI' */
        
            return output;
        }
        
            // --------------------------------------------------
            // Build Surface Data (Specific Material)
        
        void BuildSurfaceData(FragInputs fragInputs, inout SurfaceDescription surfaceDescription, float3 V, PositionInputs posInput, out SurfaceData surfaceData)
        {
            // setup defaults -- these are used if the graph doesn't output a value
            ZERO_INITIALIZE(SurfaceData, surfaceData);
        
            // copy across graph values, if defined
            surfaceData.color = surfaceDescription.BaseColor;
        
            #ifdef WRITE_NORMAL_BUFFER
            // When we need to export the normal (in the depth prepass, we write the geometry one)
            surfaceData.normalWS = fragInputs.tangentToWorld[2];
            #endif
        
            #if defined(DEBUG_DISPLAY)
            if (_DebugMipMapMode != DEBUGMIPMAPMODE_NONE)
            {
                // TODO
            }
            #endif
        
            #ifdef _ENABLE_SHADOW_MATTE
        
                #if (SHADERPASS == SHADERPASS_FORWARD_UNLIT) || (SHADERPASS == SHADERPASS_RAYTRACING_GBUFFER) || (SHADERPASS == SHADERPASS_RAYTRACING_INDIRECT) || (SHADERPASS == SHADERPASS_RAYTRACING_FORWARD)
        
                    HDShadowContext shadowContext = InitShadowContext();
        
                    // Evaluate the shadow, the normal is guaranteed if shadow matte is enabled on this shader.
                    float3 shadow3;
                    ShadowLoopMin(shadowContext, posInput, normalize(fragInputs.tangentToWorld[2]), asuint(_ShadowMatteFilter), GetMeshRenderingLightLayer(), shadow3);
        
                    // Compute the average value in the fourth channel
                    float4 shadow = float4(shadow3, dot(shadow3, float3(1.0/3.0, 1.0/3.0, 1.0/3.0)));
        
                    float4 shadowColor = (1.0 - shadow) * surfaceDescription.ShadowTint.rgba;
                    float  localAlpha  = saturate(shadowColor.a + surfaceDescription.Alpha);
        
                    // Keep the nested lerp
                    // With no Color (bsdfData.color.rgb, bsdfData.color.a == 0.0f), just use ShadowColor*Color to avoid a ring of "white" around the shadow
                    // And mix color to consider the Color & ShadowColor alpha (from texture or/and color picker)
                    #ifdef _SURFACE_TYPE_TRANSPARENT
                        surfaceData.color = lerp(shadowColor.rgb * surfaceData.color, lerp(lerp(shadowColor.rgb, surfaceData.color, 1.0 - surfaceDescription.ShadowTint.a), surfaceData.color, shadow.rgb), surfaceDescription.Alpha);
                    #else
                        surfaceData.color = lerp(lerp(shadowColor.rgb, surfaceData.color, 1.0 - surfaceDescription.ShadowTint.a), surfaceData.color, shadow.rgb);
                    #endif
                    localAlpha = ApplyBlendMode(surfaceData.color, localAlpha).a;
        
                    surfaceDescription.Alpha = localAlpha;
        
                #elif SHADERPASS == SHADERPASS_PATH_TRACING
        
                    surfaceData.normalWS = fragInputs.tangentToWorld[2];
                    surfaceData.shadowTint = surfaceDescription.ShadowTint.rgba;
        
                #endif
        
            #endif // _ENABLE_SHADOW_MATTE
        }
        
            // --------------------------------------------------
            // Get Surface And BuiltinData
        
            void GetSurfaceAndBuiltinData(FragInputs fragInputs, float3 V, inout PositionInputs posInput, out SurfaceData surfaceData, out BuiltinData builtinData RAY_TRACING_OPTIONAL_PARAMETERS)
            {
                // Don't dither if displaced tessellation (we're fading out the displacement instead to match the next LOD)
                #if !defined(SHADER_STAGE_RAY_TRACING) && !defined(_TESSELLATION_DISPLACEMENT)
                #ifdef LOD_FADE_CROSSFADE // enable dithering LOD transition if user select CrossFade transition in LOD group
                LODDitheringTransition(ComputeFadeMaskSeed(V, posInput.positionSS), unity_LODFade.x);
                #endif
                #endif
        
                #ifndef SHADER_UNLIT
                #ifdef _DOUBLESIDED_ON
                    float3 doubleSidedConstants = _DoubleSidedConstants.xyz;
                #else
                    float3 doubleSidedConstants = float3(1.0, 1.0, 1.0);
                #endif
        
                ApplyDoubleSidedFlipOrMirror(fragInputs, doubleSidedConstants); // Apply double sided flip on the vertex normal
                #endif // SHADER_UNLIT
        
                SurfaceDescriptionInputs surfaceDescriptionInputs = FragInputsToSurfaceDescriptionInputs(fragInputs, V);
        
                #if defined(HAVE_VFX_MODIFICATION)
                GraphProperties properties;
                ZERO_INITIALIZE(GraphProperties, properties);
        
                GetElementPixelProperties(fragInputs, properties);
        
                SurfaceDescription surfaceDescription = SurfaceDescriptionFunction(surfaceDescriptionInputs, properties);
                #else
                SurfaceDescription surfaceDescription = SurfaceDescriptionFunction(surfaceDescriptionInputs);
                #endif
        
                // Perform alpha test very early to save performance (a killed pixel will not sample textures)
                // TODO: split graph evaluation to grab just alpha dependencies first? tricky..
                #ifdef _ALPHATEST_ON
                    float alphaCutoff = surfaceDescription.AlphaClipThreshold;
                    #if SHADERPASS == SHADERPASS_TRANSPARENT_DEPTH_PREPASS
                    // The TransparentDepthPrepass is also used with SSR transparent.
                    // If an artists enable transaprent SSR but not the TransparentDepthPrepass itself, then we use AlphaClipThreshold
                    // otherwise if TransparentDepthPrepass is enabled we use AlphaClipThresholdDepthPrepass
                    #elif SHADERPASS == SHADERPASS_TRANSPARENT_DEPTH_POSTPASS
                    // DepthPostpass always use its own alpha threshold
                    alphaCutoff = surfaceDescription.AlphaClipThresholdDepthPostpass;
                    #elif (SHADERPASS == SHADERPASS_SHADOWS) || (SHADERPASS == SHADERPASS_RAYTRACING_VISIBILITY)
                    // If use shadow threshold isn't enable we don't allow any test
                    #endif
        
                    GENERIC_ALPHA_TEST(surfaceDescription.Alpha, alphaCutoff);
                #endif
        
                #if !defined(SHADER_STAGE_RAY_TRACING) && _DEPTHOFFSET_ON
                ApplyDepthOffsetPositionInput(V, surfaceDescription.DepthOffset, GetViewForwardDir(), GetWorldToHClipMatrix(), posInput);
                #endif
        
                #ifndef SHADER_UNLIT
                float3 bentNormalWS;
                BuildSurfaceData(fragInputs, surfaceDescription, V, posInput, surfaceData, bentNormalWS);
        
                #ifdef FRAG_INPUTS_USE_TEXCOORD1
                    float4 lightmapTexCoord1 = fragInputs.texCoord1;
                #else
                    float4 lightmapTexCoord1 = float4(0,0,0,0);
                #endif
        
                #ifdef FRAG_INPUTS_USE_TEXCOORD2
                    float4 lightmapTexCoord2 = fragInputs.texCoord2;
                #else
                    float4 lightmapTexCoord2 = float4(0,0,0,0);
                #endif
        
                // Builtin Data
                // For back lighting we use the oposite vertex normal
                InitBuiltinData(posInput, surfaceDescription.Alpha, bentNormalWS, -fragInputs.tangentToWorld[2], lightmapTexCoord1, lightmapTexCoord2, builtinData);
        
                #else
                BuildSurfaceData(fragInputs, surfaceDescription, V, posInput, surfaceData);
        
                ZERO_BUILTIN_INITIALIZE(builtinData); // No call to InitBuiltinData as we don't have any lighting
                builtinData.opacity = surfaceDescription.Alpha;
        
                #if defined(DEBUG_DISPLAY)
                    // Light Layers are currently not used for the Unlit shader (because it is not lit)
                    // But Unlit objects do cast shadows according to their rendering layer mask, which is what we want to
                    // display in the light layers visualization mode, therefore we need the renderingLayers
                    builtinData.renderingLayers = GetMeshRenderingLightLayer();
                #endif
        
                #endif // SHADER_UNLIT
        
                #ifdef _ALPHATEST_ON
                    // Used for sharpening by alpha to mask - Alpha to covertage is only used with depth only and forward pass (no shadow pass, no transparent pass)
                    builtinData.alphaClipTreshold = alphaCutoff;
                #endif
        
                // override sampleBakedGI - not used by Unlit
        
                builtinData.emissiveColor = surfaceDescription.Emission;
        
                // Note this will not fully work on transparent surfaces (can check with _SURFACE_TYPE_TRANSPARENT define)
                // We will always overwrite vt feeback with the nearest. So behind transparent surfaces vt will not be resolved
                // This is a limitation of the current MRT approach.
                #ifdef UNITY_VIRTUAL_TEXTURING
                #endif
        
                #if _DEPTHOFFSET_ON
                builtinData.depthOffset = surfaceDescription.DepthOffset;
                #endif
        
                // TODO: We should generate distortion / distortionBlur for non distortion pass
                #if (SHADERPASS == SHADERPASS_DISTORTION)
                builtinData.distortion = surfaceDescription.Distortion;
                builtinData.distortionBlur = surfaceDescription.DistortionBlur;
                #endif
        
                #ifndef SHADER_UNLIT
                // PostInitBuiltinData call ApplyDebugToBuiltinData
                PostInitBuiltinData(V, posInput, surfaceData, builtinData);
                #else
                ApplyDebugToBuiltinData(builtinData);
                #endif
        
                RAY_TRACING_OPTIONAL_ALPHA_TEST_PASS
            }
        
            // --------------------------------------------------
            // Main
        
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/ShaderPass/ShaderPassRaytracingVisibility.hlsl"
        
            // --------------------------------------------------
            // Visual Effect Vertex Invocations
        
        	#ifdef HAVE_VFX_MODIFICATION
        	#include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/VisualEffectVertex.hlsl"
        	#endif
        
            ENDHLSL
        }
        Pass
        {
            Name "ForwardDXR"
            Tags
            {
                "LightMode" = "ForwardDXR"
            }
        
            // Render State
            // RenderState: <None>
        
            // Debug
            // <None>
        
            // --------------------------------------------------
            // Pass
        
            HLSLPROGRAM
        
            // Pragmas
            #pragma target 5.0
        #pragma raytracing surface_shader
        #pragma only_renderers d3d11 ps5
        
            // Keywords
            #pragma shader_feature _ _SURFACE_TYPE_TRANSPARENT
        #pragma shader_feature_local _BLENDMODE_OFF _BLENDMODE_ALPHA _BLENDMODE_ADD _BLENDMODE_PRE_MULTIPLY
        #pragma shader_feature_local _ _ADD_PRECOMPUTED_VELOCITY
        #pragma shader_feature_local _ _TRANSPARENT_WRITES_MOTION_VEC
        #pragma shader_feature_local_fragment _ _ENABLE_FOG_ON_TRANSPARENT
        #pragma multi_compile _ DEBUG_DISPLAY
            // GraphKeywords: <None>
        
            // Early Instancing Defines
            // DotsInstancingOptions: <None>
        
            // Injected Instanced Properties (must be included before UnityInstancing.hlsl)
            // HybridV1InjectedBuiltinProperties: <None>
        
            // For custom interpolators to inject a substruct definition before FragInputs definition,
            // allowing for FragInputs to capture CI's intended for ShaderGraph's SDI.
            /* WARNING: $splice Could not find named fragment 'CustomInterpolatorPreInclude' */
        
        
            // TODO: Merge FragInputsVFX substruct with CustomInterpolators.
        	#ifdef HAVE_VFX_MODIFICATION
        	struct FragInputsVFX
            {
                /* WARNING: $splice Could not find named fragment 'FragInputsVFX' */
            };
            #endif
        
            #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Common.hlsl"
        	#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/GeometricTools.hlsl" // Required by Tessellation.hlsl
        	#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Tessellation.hlsl"
            #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Texture.hlsl"
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderVariables.hlsl"
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/ShaderPass/ShaderPass.cs.hlsl"
            #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/TextureStack.hlsl" // Required to be include before we include properties as it define DECLARE_STACK_CB
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderGraphHeader.hlsl" // Need to be here for Gradient struct definition
        
            // --------------------------------------------------
            // Defines
        
            // Attribute
            #define ATTRIBUTES_NEED_NORMAL
            #define ATTRIBUTES_NEED_TANGENT
            #define VARYINGS_NEED_POSITION_WS
            #define VARYINGS_NEED_TANGENT_TO_WORLD
        
        
            //Strip down the FragInputs.hlsl (on graphics), so we can only optimize the interpolators we use.
            //if by accident something requests contents of FragInputs.hlsl, it will be caught as a compiler error
            //Frag inputs stripping is only enabled when FRAG_INPUTS_ENABLE_STRIPPING is set
            #if !defined(SHADER_STAGE_RAY_TRACING) && SHADERPASS != SHADERPASS_RAYTRACING_GBUFFER && SHADERPASS != SHADERPASS_FULL_SCREEN_DEBUG
            #define FRAG_INPUTS_ENABLE_STRIPPING
            #endif
        
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/ShaderPass/FragInputs.hlsl"
        
        
        
            #define SHADERPASS SHADERPASS_RAYTRACING_FORWARD
        #define SHADOW_LOW
        #define RAYTRACING_SHADER_GRAPH_RAYTRACED
        #define REQUIRE_DEPTH_TEXTURE
        
        
            // Following two define are a workaround introduce in 10.1.x for RaytracingQualityNode
            // The ShaderGraph don't support correctly migration of this node as it serialize all the node data
            // in the json file making it impossible to uprgrade. Until we get a fix, we do a workaround here
            // to still allow us to rename the field and keyword of this node without breaking existing code.
            #ifdef RAYTRACING_SHADER_GRAPH_DEFAULT
            #define RAYTRACING_SHADER_GRAPH_HIGH
            #endif
        
            #ifdef RAYTRACING_SHADER_GRAPH_RAYTRACED
            #define RAYTRACING_SHADER_GRAPH_LOW
            #endif
            // end
        
            #ifndef SHADER_UNLIT
            // We need isFrontFace when using double sided - it is not required for unlit as in case of unlit double sided only drive the cullmode
            // VARYINGS_NEED_CULLFACE can be define by VaryingsMeshToPS.FaceSign input if a IsFrontFace Node is included in the shader graph.
            #if defined(_DOUBLESIDED_ON) && !defined(VARYINGS_NEED_CULLFACE)
                #define VARYINGS_NEED_CULLFACE
            #endif
            #endif
        
            // Specific Material Define
        // Setup a define to say we are an unlit shader
        #define SHADER_UNLIT
        
        // Following Macro are only used by Unlit material
        #if defined(_ENABLE_SHADOW_MATTE) && (SHADERPASS == SHADERPASS_FORWARD_UNLIT || SHADERPASS == SHADERPASS_PATH_TRACING)
        #define LIGHTLOOP_DISABLE_TILE_AND_CLUSTER
        #define HAS_LIGHTLOOP
        #endif
            // Caution: we can use the define SHADER_UNLIT onlit after the above Material include as it is the Unlit template who define it
        
            // To handle SSR on transparent correctly with a possibility to enable/disable it per framesettings
            // we should have a code like this:
            // if !defined(_DISABLE_SSR_TRANSPARENT)
            // pragma multi_compile _ WRITE_NORMAL_BUFFER
            // endif
            // i.e we enable the multicompile only if we can receive SSR or not, and then C# code drive
            // it based on if SSR transparent in frame settings and not (and stripper can strip it).
            // this is currently not possible with our current preprocessor as _DISABLE_SSR_TRANSPARENT is a keyword not a define
            // so instead we used this and chose to pay the extra cost of normal write even if SSR transaprent is disabled.
            // Ideally the shader graph generator should handle it but condition below can't be handle correctly for now.
            #if SHADERPASS == SHADERPASS_TRANSPARENT_DEPTH_PREPASS
            #if !defined(_DISABLE_SSR_TRANSPARENT) && !defined(SHADER_UNLIT)
                #define WRITE_NORMAL_BUFFER
            #endif
            #endif
        
            #ifndef DEBUG_DISPLAY
                // In case of opaque we don't want to perform the alpha test, it is done in depth prepass and we use depth equal for ztest (setup from UI)
                // Don't do it with debug display mode as it is possible there is no depth prepass in this case
                #if !defined(_SURFACE_TYPE_TRANSPARENT)
                    #if SHADERPASS == SHADERPASS_FORWARD
                    #define SHADERPASS_FORWARD_BYPASS_ALPHA_TEST
                    #elif SHADERPASS == SHADERPASS_GBUFFER
                    #define SHADERPASS_GBUFFER_BYPASS_ALPHA_TEST
                    #endif
                #endif
            #endif
        
            // Define _DEFERRED_CAPABLE_MATERIAL for shader capable to run in deferred pass
            #if defined(SHADER_LIT) && !defined(_SURFACE_TYPE_TRANSPARENT)
                #define _DEFERRED_CAPABLE_MATERIAL
            #endif
        
            // Translate transparent motion vector define
            #if defined(_TRANSPARENT_WRITES_MOTION_VEC) && defined(_SURFACE_TYPE_TRANSPARENT)
                #define _WRITE_TRANSPARENT_MOTION_VECTOR
            #endif
        
            // -- Graph Properties
            CBUFFER_START(UnityPerMaterial)
        float4 _Rotate_Projection;
        float _Noise_Scale;
        float _Speed;
        float _Vertexoffset;
        float4 _Remap_xy_zw;
        float4 _Color_Peak;
        float4 _Color_Valley;
        float _SmoothEdge1;
        float _SmoothEdge2;
        float _Cloud_Pow;
        float _Base_Scale;
        float _Base_Speed;
        float _BaseStrength;
        float _Emission_Strength;
        float _Curvate_Radius;
        float _Fresnel_Power;
        float _Fresnel_Opacity;
        float _Depth_Fade;
        float4 _EmissionColor;
        float _UseShadowThreshold;
        float4 _DoubleSidedConstants;
        float _BlendMode;
        float _EnableBlendModePreserveSpecularLighting;
        CBUFFER_END
        
        // Object and Global properties
        
            // -- Property used by ScenePickingPass
            #ifdef SCENEPICKINGPASS
            float4 _SelectionID;
            #endif
        
            // -- Properties used by SceneSelectionPass
            #ifdef SCENESELECTIONPASS
            int _ObjectId;
            int _PassValue;
            #endif
        
            // Includes
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/Raytracing/Shaders/RaytracingMacros.hlsl"
        #include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/Raytracing/Shaders/ShaderVariablesRaytracing.hlsl"
        #include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Material.hlsl"
        #include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/Raytracing/Shaders/ShaderVariablesRaytracingLightLoop.hlsl"
        #include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/Raytracing/Shaders/RaytracingIntersection.hlsl"
        #include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Unlit/Unlit.hlsl"
        #include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Unlit/UnlitRaytracing.hlsl"
        #include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/BuiltinUtilities.hlsl"
        #include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/MaterialUtilities.hlsl"
        #include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/Raytracing/Shaders/RayTracingCommon.hlsl"
        #include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderGraphFunctions.hlsl"
        	// GraphIncludes: <None>
        
            // --------------------------------------------------
            // Structs and Packing
        
            struct SurfaceDescriptionInputs
        {
             float3 WorldSpaceNormal;
             float3 WorldSpaceViewDirection;
             float3 ObjectSpacePosition;
             float3 WorldSpacePosition;
             float4 ScreenPosition;
             float3 TimeParameters;
        };
        
            //Interpolator Packs: <None>
        
            // --------------------------------------------------
            // Graph
        
        
            // Graph Functions
            
        void Unity_Rotate_About_Axis_Radians_float(float3 In, float3 Axis, float Rotation, out float3 Out)
        {
            float s = sin(Rotation);
            float c = cos(Rotation);
            float one_minus_c = 1.0 - c;
        
            Axis = normalize(Axis);
        
            float3x3 rot_mat = { one_minus_c * Axis.x * Axis.x + c,            one_minus_c * Axis.x * Axis.y - Axis.z * s,     one_minus_c * Axis.z * Axis.x + Axis.y * s,
                                      one_minus_c * Axis.x * Axis.y + Axis.z * s,   one_minus_c * Axis.y * Axis.y + c,              one_minus_c * Axis.y * Axis.z - Axis.x * s,
                                      one_minus_c * Axis.z * Axis.x - Axis.y * s,   one_minus_c * Axis.y * Axis.z + Axis.x * s,     one_minus_c * Axis.z * Axis.z + c
                                    };
        
            Out = mul(rot_mat,  In);
        }
        
        void Unity_Multiply_float_float(float A, float B, out float Out)
        {
            Out = A * B;
        }
        
        void Unity_TilingAndOffset_float(float2 UV, float2 Tiling, float2 Offset, out float2 Out)
        {
            Out = UV * Tiling + Offset;
        }
        
        
        float2 Unity_GradientNoise_Dir_float(float2 p)
        {
            // Permutation and hashing used in webgl-nosie goo.gl/pX7HtC
            p = p % 289;
            // need full precision, otherwise half overflows when p > 1
            float x = float(34 * p.x + 1) * p.x % 289 + p.y;
            x = (34 * x + 1) * x % 289;
            x = frac(x / 41) * 2 - 1;
            return normalize(float2(x - floor(x + 0.5), abs(x) - 0.5));
        }
        
        void Unity_GradientNoise_float(float2 UV, float Scale, out float Out)
        {
            float2 p = UV * Scale;
            float2 ip = floor(p);
            float2 fp = frac(p);
            float d00 = dot(Unity_GradientNoise_Dir_float(ip), fp);
            float d01 = dot(Unity_GradientNoise_Dir_float(ip + float2(0, 1)), fp - float2(0, 1));
            float d10 = dot(Unity_GradientNoise_Dir_float(ip + float2(1, 0)), fp - float2(1, 0));
            float d11 = dot(Unity_GradientNoise_Dir_float(ip + float2(1, 1)), fp - float2(1, 1));
            fp = fp * fp * fp * (fp * (fp * 6 - 15) + 10);
            Out = lerp(lerp(d00, d01, fp.y), lerp(d10, d11, fp.y), fp.x) + 0.5;
        }
        
        void Unity_Add_float(float A, float B, out float Out)
        {
            Out = A + B;
        }
        
        void Unity_Divide_float(float A, float B, out float Out)
        {
            Out = A / B;
        }
        
        void Unity_Saturate_float(float In, out float Out)
        {
            Out = saturate(In);
        }
        
        void Unity_Power_float(float A, float B, out float Out)
        {
            Out = pow(A, B);
        }
        
        void Unity_Combine_float(float R, float G, float B, float A, out float4 RGBA, out float3 RGB, out float2 RG)
        {
            RGBA = float4(R, G, B, A);
            RGB = float3(R, G, B);
            RG = float2(R, G);
        }
        
        void Unity_Remap_float(float In, float2 InMinMax, float2 OutMinMax, out float Out)
        {
            Out = OutMinMax.x + (In - InMinMax.x) * (OutMinMax.y - OutMinMax.x) / (InMinMax.y - InMinMax.x);
        }
        
        void Unity_Absolute_float(float In, out float Out)
        {
            Out = abs(In);
        }
        
        void Unity_Smoothstep_float(float Edge1, float Edge2, float In, out float Out)
        {
            Out = smoothstep(Edge1, Edge2, In);
        }
        
        void Unity_FresnelEffect_float(float3 Normal, float3 ViewDir, float Power, out float Out)
        {
            Out = pow((1.0 - saturate(dot(normalize(Normal), normalize(ViewDir)))), Power);
        }
        
        void Unity_Lerp_float4(float4 A, float4 B, float4 T, out float4 Out)
        {
            Out = lerp(A, B, T);
        }
        
        void Unity_Add_float4(float4 A, float4 B, out float4 Out)
        {
            Out = A + B;
        }
        
        void Unity_Multiply_float4_float4(float4 A, float4 B, out float4 Out)
        {
            Out = A * B;
        }
        
        void Unity_SceneDepth_Eye_float(float4 UV, out float Out)
        {
            if (unity_OrthoParams.w == 1.0)
            {
                Out = LinearEyeDepth(ComputeWorldSpacePosition(UV.xy, SHADERGRAPH_SAMPLE_SCENE_DEPTH(UV.xy), UNITY_MATRIX_I_VP), UNITY_MATRIX_V);
            }
            else
            {
                Out = LinearEyeDepth(SHADERGRAPH_SAMPLE_SCENE_DEPTH(UV.xy), _ZBufferParams);
            }
        }
        
        void Unity_Subtract_float(float A, float B, out float Out)
        {
            Out = A - B;
        }
        
            // Graph Vertex
            // GraphVertex: <None>
        
            // Graph Pixel
            struct SurfaceDescription
        {
            float3 BaseColor;
            float3 Emission;
            float Alpha;
        };
        
        SurfaceDescription SurfaceDescriptionFunction(SurfaceDescriptionInputs IN)
        {
            SurfaceDescription surface = (SurfaceDescription)0;
            float _Property_7d8e49b5efe94dea8210c34a6319b1ef_Out_0 = _SmoothEdge1;
            float _Property_09307b889e8945078bacabda50cca5c6_Out_0 = _SmoothEdge2;
            float4 _Property_a8d53d7ea07349e0979b956475bdd7cc_Out_0 = _Rotate_Projection;
            float _Split_7d12b2bb5feb46d685603473d0cf5818_R_1 = _Property_a8d53d7ea07349e0979b956475bdd7cc_Out_0[0];
            float _Split_7d12b2bb5feb46d685603473d0cf5818_G_2 = _Property_a8d53d7ea07349e0979b956475bdd7cc_Out_0[1];
            float _Split_7d12b2bb5feb46d685603473d0cf5818_B_3 = _Property_a8d53d7ea07349e0979b956475bdd7cc_Out_0[2];
            float _Split_7d12b2bb5feb46d685603473d0cf5818_A_4 = _Property_a8d53d7ea07349e0979b956475bdd7cc_Out_0[3];
            float3 _RotateAboutAxis_1b91481bceed4e9a82a13975af123b02_Out_3;
            Unity_Rotate_About_Axis_Radians_float(IN.ObjectSpacePosition, (_Property_a8d53d7ea07349e0979b956475bdd7cc_Out_0.xyz), _Split_7d12b2bb5feb46d685603473d0cf5818_A_4, _RotateAboutAxis_1b91481bceed4e9a82a13975af123b02_Out_3);
            float _Property_258f4645340c46f69274c9f077f1a73c_Out_0 = _Speed;
            float _Multiply_94f6d857831c4e69b53b9bfc92dd852f_Out_2;
            Unity_Multiply_float_float(IN.TimeParameters.x, _Property_258f4645340c46f69274c9f077f1a73c_Out_0, _Multiply_94f6d857831c4e69b53b9bfc92dd852f_Out_2);
            float2 _TilingAndOffset_6cb9fd57231c4a429c9c0fe5aeb7cc58_Out_3;
            Unity_TilingAndOffset_float((_RotateAboutAxis_1b91481bceed4e9a82a13975af123b02_Out_3.xy), float2 (1, 1), (_Multiply_94f6d857831c4e69b53b9bfc92dd852f_Out_2.xx), _TilingAndOffset_6cb9fd57231c4a429c9c0fe5aeb7cc58_Out_3);
            float _Property_2b9001a870d04f8eb60f5d7e1ce909c5_Out_0 = _Noise_Scale;
            float _GradientNoise_061679506b214bb8b4792ec4dfe82ec6_Out_2;
            Unity_GradientNoise_float(_TilingAndOffset_6cb9fd57231c4a429c9c0fe5aeb7cc58_Out_3, _Property_2b9001a870d04f8eb60f5d7e1ce909c5_Out_0, _GradientNoise_061679506b214bb8b4792ec4dfe82ec6_Out_2);
            float2 _TilingAndOffset_1d2491b5855e49d3b2e6b5dbe5db07d4_Out_3;
            Unity_TilingAndOffset_float((_RotateAboutAxis_1b91481bceed4e9a82a13975af123b02_Out_3.xy), float2 (1, 1), float2 (0, 0), _TilingAndOffset_1d2491b5855e49d3b2e6b5dbe5db07d4_Out_3);
            float _GradientNoise_8a27c3fb323f4db1b38f287380605198_Out_2;
            Unity_GradientNoise_float(_TilingAndOffset_1d2491b5855e49d3b2e6b5dbe5db07d4_Out_3, _Property_2b9001a870d04f8eb60f5d7e1ce909c5_Out_0, _GradientNoise_8a27c3fb323f4db1b38f287380605198_Out_2);
            float _Add_a6dd2d6e3f564decbca34ec03a419130_Out_2;
            Unity_Add_float(_GradientNoise_061679506b214bb8b4792ec4dfe82ec6_Out_2, _GradientNoise_8a27c3fb323f4db1b38f287380605198_Out_2, _Add_a6dd2d6e3f564decbca34ec03a419130_Out_2);
            float _Divide_a757ea7167f343ecaec30e69b58c9bae_Out_2;
            Unity_Divide_float(_Add_a6dd2d6e3f564decbca34ec03a419130_Out_2, 2, _Divide_a757ea7167f343ecaec30e69b58c9bae_Out_2);
            float _Saturate_f355ba5a467f4488b7ec89e8a08484a3_Out_1;
            Unity_Saturate_float(_Divide_a757ea7167f343ecaec30e69b58c9bae_Out_2, _Saturate_f355ba5a467f4488b7ec89e8a08484a3_Out_1);
            float _Property_96da655cc17e4594836aa02d74efe33c_Out_0 = _Cloud_Pow;
            float _Power_318bede735044ec6811f2a5c345b7d73_Out_2;
            Unity_Power_float(_Saturate_f355ba5a467f4488b7ec89e8a08484a3_Out_1, _Property_96da655cc17e4594836aa02d74efe33c_Out_0, _Power_318bede735044ec6811f2a5c345b7d73_Out_2);
            float4 _Property_317e8becc0724841a13cbcf8d4c4efbc_Out_0 = _Remap_xy_zw;
            float _Split_3dee68ff9a374966b7612da59c6ac20a_R_1 = _Property_317e8becc0724841a13cbcf8d4c4efbc_Out_0[0];
            float _Split_3dee68ff9a374966b7612da59c6ac20a_G_2 = _Property_317e8becc0724841a13cbcf8d4c4efbc_Out_0[1];
            float _Split_3dee68ff9a374966b7612da59c6ac20a_B_3 = _Property_317e8becc0724841a13cbcf8d4c4efbc_Out_0[2];
            float _Split_3dee68ff9a374966b7612da59c6ac20a_A_4 = _Property_317e8becc0724841a13cbcf8d4c4efbc_Out_0[3];
            float4 _Combine_4e3ec9a6e4064091bba919631e732b7a_RGBA_4;
            float3 _Combine_4e3ec9a6e4064091bba919631e732b7a_RGB_5;
            float2 _Combine_4e3ec9a6e4064091bba919631e732b7a_RG_6;
            Unity_Combine_float(_Split_3dee68ff9a374966b7612da59c6ac20a_R_1, _Split_3dee68ff9a374966b7612da59c6ac20a_G_2, 0, 0, _Combine_4e3ec9a6e4064091bba919631e732b7a_RGBA_4, _Combine_4e3ec9a6e4064091bba919631e732b7a_RGB_5, _Combine_4e3ec9a6e4064091bba919631e732b7a_RG_6);
            float4 _Combine_6f976751f1234c77908b163e59da18bb_RGBA_4;
            float3 _Combine_6f976751f1234c77908b163e59da18bb_RGB_5;
            float2 _Combine_6f976751f1234c77908b163e59da18bb_RG_6;
            Unity_Combine_float(_Split_3dee68ff9a374966b7612da59c6ac20a_B_3, _Split_3dee68ff9a374966b7612da59c6ac20a_A_4, 0, 0, _Combine_6f976751f1234c77908b163e59da18bb_RGBA_4, _Combine_6f976751f1234c77908b163e59da18bb_RGB_5, _Combine_6f976751f1234c77908b163e59da18bb_RG_6);
            float _Remap_a11bf825d8d54f198c2355e6d3cc1fba_Out_3;
            Unity_Remap_float(_Power_318bede735044ec6811f2a5c345b7d73_Out_2, _Combine_4e3ec9a6e4064091bba919631e732b7a_RG_6, _Combine_6f976751f1234c77908b163e59da18bb_RG_6, _Remap_a11bf825d8d54f198c2355e6d3cc1fba_Out_3);
            float _Absolute_553a57701af34a45a18ca7b2af677c8a_Out_1;
            Unity_Absolute_float(_Remap_a11bf825d8d54f198c2355e6d3cc1fba_Out_3, _Absolute_553a57701af34a45a18ca7b2af677c8a_Out_1);
            float _Smoothstep_6babd4aa745b40db842b941b96adf7e9_Out_3;
            Unity_Smoothstep_float(_Property_7d8e49b5efe94dea8210c34a6319b1ef_Out_0, _Property_09307b889e8945078bacabda50cca5c6_Out_0, _Absolute_553a57701af34a45a18ca7b2af677c8a_Out_1, _Smoothstep_6babd4aa745b40db842b941b96adf7e9_Out_3);
            float _Property_17631cb6b51c44b593b4fb1f0ac8fa75_Out_0 = _Base_Speed;
            float _Multiply_2e98faddc46143bea8e48ab17d0e1c15_Out_2;
            Unity_Multiply_float_float(IN.TimeParameters.x, _Property_17631cb6b51c44b593b4fb1f0ac8fa75_Out_0, _Multiply_2e98faddc46143bea8e48ab17d0e1c15_Out_2);
            float2 _TilingAndOffset_d8c83d87b12649f7b6a3902973c4457a_Out_3;
            Unity_TilingAndOffset_float((_RotateAboutAxis_1b91481bceed4e9a82a13975af123b02_Out_3.xy), float2 (1, 1), (_Multiply_2e98faddc46143bea8e48ab17d0e1c15_Out_2.xx), _TilingAndOffset_d8c83d87b12649f7b6a3902973c4457a_Out_3);
            float _Property_2792df33a4d44e20b2f71fe244d5f369_Out_0 = _Base_Scale;
            float _GradientNoise_702d412fe90e4c64b91e9defbe1ffff2_Out_2;
            Unity_GradientNoise_float(_TilingAndOffset_d8c83d87b12649f7b6a3902973c4457a_Out_3, _Property_2792df33a4d44e20b2f71fe244d5f369_Out_0, _GradientNoise_702d412fe90e4c64b91e9defbe1ffff2_Out_2);
            float _Property_a965b78b3be84255ae4ff1617bd2df01_Out_0 = _BaseStrength;
            float _Multiply_9880df30952a454781c1f0c8356100dd_Out_2;
            Unity_Multiply_float_float(_GradientNoise_702d412fe90e4c64b91e9defbe1ffff2_Out_2, _Property_a965b78b3be84255ae4ff1617bd2df01_Out_0, _Multiply_9880df30952a454781c1f0c8356100dd_Out_2);
            float _Add_98d9cdbb65e44e0282692d35bd9d237b_Out_2;
            Unity_Add_float(_Smoothstep_6babd4aa745b40db842b941b96adf7e9_Out_3, _Multiply_9880df30952a454781c1f0c8356100dd_Out_2, _Add_98d9cdbb65e44e0282692d35bd9d237b_Out_2);
            float _Add_d305fd085a9b459da3d4bd5108430b3f_Out_2;
            Unity_Add_float(1, _Property_a965b78b3be84255ae4ff1617bd2df01_Out_0, _Add_d305fd085a9b459da3d4bd5108430b3f_Out_2);
            float _Divide_55db7b7a0b8b481d83fb512a13a2dba6_Out_2;
            Unity_Divide_float(_Add_98d9cdbb65e44e0282692d35bd9d237b_Out_2, _Add_d305fd085a9b459da3d4bd5108430b3f_Out_2, _Divide_55db7b7a0b8b481d83fb512a13a2dba6_Out_2);
            float _Property_5a371e38a60143fcae81da7313c1bf15_Out_0 = _Fresnel_Power;
            float _FresnelEffect_4c470240dea248acb0092676d71437cb_Out_3;
            Unity_FresnelEffect_float(IN.WorldSpaceNormal, IN.WorldSpaceViewDirection, _Property_5a371e38a60143fcae81da7313c1bf15_Out_0, _FresnelEffect_4c470240dea248acb0092676d71437cb_Out_3);
            float _Multiply_384d15a2ef094b7e8b1ec6d69dada246_Out_2;
            Unity_Multiply_float_float(_Divide_55db7b7a0b8b481d83fb512a13a2dba6_Out_2, _FresnelEffect_4c470240dea248acb0092676d71437cb_Out_3, _Multiply_384d15a2ef094b7e8b1ec6d69dada246_Out_2);
            float _Property_3c23366c651c4949b03cb10c14ae0a27_Out_0 = _Fresnel_Opacity;
            float _Multiply_9380e32f6e4644e1b42e398229c18d31_Out_2;
            Unity_Multiply_float_float(_Multiply_384d15a2ef094b7e8b1ec6d69dada246_Out_2, _Property_3c23366c651c4949b03cb10c14ae0a27_Out_0, _Multiply_9380e32f6e4644e1b42e398229c18d31_Out_2);
            float4 _Property_dff39e3157cb4a09aac968677ade995d_Out_0 = _Color_Valley;
            float4 _Property_1b300af9e23e428fa893e55f9390600d_Out_0 = _Color_Peak;
            float4 _Lerp_6d0a20bb25554e1fa8697f473485e856_Out_3;
            Unity_Lerp_float4(_Property_dff39e3157cb4a09aac968677ade995d_Out_0, _Property_1b300af9e23e428fa893e55f9390600d_Out_0, (_Add_98d9cdbb65e44e0282692d35bd9d237b_Out_2.xxxx), _Lerp_6d0a20bb25554e1fa8697f473485e856_Out_3);
            float4 _Add_6507a6920d9c478888f235ad9d0bb542_Out_2;
            Unity_Add_float4((_Multiply_9380e32f6e4644e1b42e398229c18d31_Out_2.xxxx), _Lerp_6d0a20bb25554e1fa8697f473485e856_Out_3, _Add_6507a6920d9c478888f235ad9d0bb542_Out_2);
            float _Property_9cf7107417e042afb41766bb37be827b_Out_0 = _Emission_Strength;
            float4 _Multiply_31ae534c0cc640be9fda8de7cc705bbf_Out_2;
            Unity_Multiply_float4_float4(_Add_6507a6920d9c478888f235ad9d0bb542_Out_2, (_Property_9cf7107417e042afb41766bb37be827b_Out_0.xxxx), _Multiply_31ae534c0cc640be9fda8de7cc705bbf_Out_2);
            float _SceneDepth_619a7e0097894c29ba4557fde6cbb174_Out_1;
            Unity_SceneDepth_Eye_float(float4(IN.ScreenPosition.xy / IN.ScreenPosition.w, 0, 0), _SceneDepth_619a7e0097894c29ba4557fde6cbb174_Out_1);
            float4 _ScreenPosition_ee728e739f744068b0d15c1205d618a0_Out_0 = IN.ScreenPosition;
            float _Split_d5d8a30c527c46a19ab94602c057016e_R_1 = _ScreenPosition_ee728e739f744068b0d15c1205d618a0_Out_0[0];
            float _Split_d5d8a30c527c46a19ab94602c057016e_G_2 = _ScreenPosition_ee728e739f744068b0d15c1205d618a0_Out_0[1];
            float _Split_d5d8a30c527c46a19ab94602c057016e_B_3 = _ScreenPosition_ee728e739f744068b0d15c1205d618a0_Out_0[2];
            float _Split_d5d8a30c527c46a19ab94602c057016e_A_4 = _ScreenPosition_ee728e739f744068b0d15c1205d618a0_Out_0[3];
            float _Subtract_07eb78fa00d74ade84172a64a4a4616c_Out_2;
            Unity_Subtract_float(_Split_d5d8a30c527c46a19ab94602c057016e_A_4, 1, _Subtract_07eb78fa00d74ade84172a64a4a4616c_Out_2);
            float _Subtract_3ef0962257844c2c87b9ff8d165099f3_Out_2;
            Unity_Subtract_float(_SceneDepth_619a7e0097894c29ba4557fde6cbb174_Out_1, _Subtract_07eb78fa00d74ade84172a64a4a4616c_Out_2, _Subtract_3ef0962257844c2c87b9ff8d165099f3_Out_2);
            float _Property_9167e3d66076450baeb620b8f8b66552_Out_0 = _Depth_Fade;
            float _Divide_9a1ae8922923443883cbd9e71941de32_Out_2;
            Unity_Divide_float(_Subtract_3ef0962257844c2c87b9ff8d165099f3_Out_2, _Property_9167e3d66076450baeb620b8f8b66552_Out_0, _Divide_9a1ae8922923443883cbd9e71941de32_Out_2);
            float _Saturate_791ce4d2963e420ba68a97fca0bef8f9_Out_1;
            Unity_Saturate_float(_Divide_9a1ae8922923443883cbd9e71941de32_Out_2, _Saturate_791ce4d2963e420ba68a97fca0bef8f9_Out_1);
            surface.BaseColor = (_Add_6507a6920d9c478888f235ad9d0bb542_Out_2.xyz);
            surface.Emission = (_Multiply_31ae534c0cc640be9fda8de7cc705bbf_Out_2.xyz);
            surface.Alpha = _Saturate_791ce4d2963e420ba68a97fca0bef8f9_Out_1;
            return surface;
        }
        
            // --------------------------------------------------
            // Build Graph Inputs
            #ifdef HAVE_VFX_MODIFICATION
            #define VFX_SRP_ATTRIBUTES AttributesMesh
            #define VaryingsMeshType VaryingsMeshToPS
            #define VFX_SRP_VARYINGS VaryingsMeshType
            #define VFX_SRP_SURFACE_INPUTS FragInputs
            #endif
            SurfaceDescriptionInputs FragInputsToSurfaceDescriptionInputs(FragInputs input, float3 viewWS)
        {
            SurfaceDescriptionInputs output;
            ZERO_INITIALIZE(SurfaceDescriptionInputs, output);
        
            output.WorldSpaceNormal =                           normalize(input.tangentToWorld[2].xyz);
            #if defined(SHADER_STAGE_RAY_TRACING)
            #else
            #endif
            output.WorldSpaceViewDirection =                    normalize(viewWS);
            output.WorldSpacePosition =                         input.positionRWS;
            output.ObjectSpacePosition =                        TransformWorldToObject(input.positionRWS);
            output.ScreenPosition =                             ComputeScreenPos(TransformWorldToHClip(input.positionRWS), _ProjectionParams.x);
            output.TimeParameters =                             _TimeParameters.xyz; // This is mainly for LW as HD overwrite this value
        
            // splice point to copy frag inputs custom interpolator pack into the SDI
            /* WARNING: $splice Could not find named fragment 'CustomInterpolatorCopyToSDI' */
        
            return output;
        }
        
            // --------------------------------------------------
            // Build Surface Data (Specific Material)
        
        void BuildSurfaceData(FragInputs fragInputs, inout SurfaceDescription surfaceDescription, float3 V, PositionInputs posInput, out SurfaceData surfaceData)
        {
            // setup defaults -- these are used if the graph doesn't output a value
            ZERO_INITIALIZE(SurfaceData, surfaceData);
        
            // copy across graph values, if defined
            surfaceData.color = surfaceDescription.BaseColor;
        
            #ifdef WRITE_NORMAL_BUFFER
            // When we need to export the normal (in the depth prepass, we write the geometry one)
            surfaceData.normalWS = fragInputs.tangentToWorld[2];
            #endif
        
            #if defined(DEBUG_DISPLAY)
            if (_DebugMipMapMode != DEBUGMIPMAPMODE_NONE)
            {
                // TODO
            }
            #endif
        
            #ifdef _ENABLE_SHADOW_MATTE
        
                #if (SHADERPASS == SHADERPASS_FORWARD_UNLIT) || (SHADERPASS == SHADERPASS_RAYTRACING_GBUFFER) || (SHADERPASS == SHADERPASS_RAYTRACING_INDIRECT) || (SHADERPASS == SHADERPASS_RAYTRACING_FORWARD)
        
                    HDShadowContext shadowContext = InitShadowContext();
        
                    // Evaluate the shadow, the normal is guaranteed if shadow matte is enabled on this shader.
                    float3 shadow3;
                    ShadowLoopMin(shadowContext, posInput, normalize(fragInputs.tangentToWorld[2]), asuint(_ShadowMatteFilter), GetMeshRenderingLightLayer(), shadow3);
        
                    // Compute the average value in the fourth channel
                    float4 shadow = float4(shadow3, dot(shadow3, float3(1.0/3.0, 1.0/3.0, 1.0/3.0)));
        
                    float4 shadowColor = (1.0 - shadow) * surfaceDescription.ShadowTint.rgba;
                    float  localAlpha  = saturate(shadowColor.a + surfaceDescription.Alpha);
        
                    // Keep the nested lerp
                    // With no Color (bsdfData.color.rgb, bsdfData.color.a == 0.0f), just use ShadowColor*Color to avoid a ring of "white" around the shadow
                    // And mix color to consider the Color & ShadowColor alpha (from texture or/and color picker)
                    #ifdef _SURFACE_TYPE_TRANSPARENT
                        surfaceData.color = lerp(shadowColor.rgb * surfaceData.color, lerp(lerp(shadowColor.rgb, surfaceData.color, 1.0 - surfaceDescription.ShadowTint.a), surfaceData.color, shadow.rgb), surfaceDescription.Alpha);
                    #else
                        surfaceData.color = lerp(lerp(shadowColor.rgb, surfaceData.color, 1.0 - surfaceDescription.ShadowTint.a), surfaceData.color, shadow.rgb);
                    #endif
                    localAlpha = ApplyBlendMode(surfaceData.color, localAlpha).a;
        
                    surfaceDescription.Alpha = localAlpha;
        
                #elif SHADERPASS == SHADERPASS_PATH_TRACING
        
                    surfaceData.normalWS = fragInputs.tangentToWorld[2];
                    surfaceData.shadowTint = surfaceDescription.ShadowTint.rgba;
        
                #endif
        
            #endif // _ENABLE_SHADOW_MATTE
        }
        
            // --------------------------------------------------
            // Get Surface And BuiltinData
        
            void GetSurfaceAndBuiltinData(FragInputs fragInputs, float3 V, inout PositionInputs posInput, out SurfaceData surfaceData, out BuiltinData builtinData RAY_TRACING_OPTIONAL_PARAMETERS)
            {
                // Don't dither if displaced tessellation (we're fading out the displacement instead to match the next LOD)
                #if !defined(SHADER_STAGE_RAY_TRACING) && !defined(_TESSELLATION_DISPLACEMENT)
                #ifdef LOD_FADE_CROSSFADE // enable dithering LOD transition if user select CrossFade transition in LOD group
                LODDitheringTransition(ComputeFadeMaskSeed(V, posInput.positionSS), unity_LODFade.x);
                #endif
                #endif
        
                #ifndef SHADER_UNLIT
                #ifdef _DOUBLESIDED_ON
                    float3 doubleSidedConstants = _DoubleSidedConstants.xyz;
                #else
                    float3 doubleSidedConstants = float3(1.0, 1.0, 1.0);
                #endif
        
                ApplyDoubleSidedFlipOrMirror(fragInputs, doubleSidedConstants); // Apply double sided flip on the vertex normal
                #endif // SHADER_UNLIT
        
                SurfaceDescriptionInputs surfaceDescriptionInputs = FragInputsToSurfaceDescriptionInputs(fragInputs, V);
        
                #if defined(HAVE_VFX_MODIFICATION)
                GraphProperties properties;
                ZERO_INITIALIZE(GraphProperties, properties);
        
                GetElementPixelProperties(fragInputs, properties);
        
                SurfaceDescription surfaceDescription = SurfaceDescriptionFunction(surfaceDescriptionInputs, properties);
                #else
                SurfaceDescription surfaceDescription = SurfaceDescriptionFunction(surfaceDescriptionInputs);
                #endif
        
                // Perform alpha test very early to save performance (a killed pixel will not sample textures)
                // TODO: split graph evaluation to grab just alpha dependencies first? tricky..
                #ifdef _ALPHATEST_ON
                    float alphaCutoff = surfaceDescription.AlphaClipThreshold;
                    #if SHADERPASS == SHADERPASS_TRANSPARENT_DEPTH_PREPASS
                    // The TransparentDepthPrepass is also used with SSR transparent.
                    // If an artists enable transaprent SSR but not the TransparentDepthPrepass itself, then we use AlphaClipThreshold
                    // otherwise if TransparentDepthPrepass is enabled we use AlphaClipThresholdDepthPrepass
                    #elif SHADERPASS == SHADERPASS_TRANSPARENT_DEPTH_POSTPASS
                    // DepthPostpass always use its own alpha threshold
                    alphaCutoff = surfaceDescription.AlphaClipThresholdDepthPostpass;
                    #elif (SHADERPASS == SHADERPASS_SHADOWS) || (SHADERPASS == SHADERPASS_RAYTRACING_VISIBILITY)
                    // If use shadow threshold isn't enable we don't allow any test
                    #endif
        
                    GENERIC_ALPHA_TEST(surfaceDescription.Alpha, alphaCutoff);
                #endif
        
                #if !defined(SHADER_STAGE_RAY_TRACING) && _DEPTHOFFSET_ON
                ApplyDepthOffsetPositionInput(V, surfaceDescription.DepthOffset, GetViewForwardDir(), GetWorldToHClipMatrix(), posInput);
                #endif
        
                #ifndef SHADER_UNLIT
                float3 bentNormalWS;
                BuildSurfaceData(fragInputs, surfaceDescription, V, posInput, surfaceData, bentNormalWS);
        
                #ifdef FRAG_INPUTS_USE_TEXCOORD1
                    float4 lightmapTexCoord1 = fragInputs.texCoord1;
                #else
                    float4 lightmapTexCoord1 = float4(0,0,0,0);
                #endif
        
                #ifdef FRAG_INPUTS_USE_TEXCOORD2
                    float4 lightmapTexCoord2 = fragInputs.texCoord2;
                #else
                    float4 lightmapTexCoord2 = float4(0,0,0,0);
                #endif
        
                // Builtin Data
                // For back lighting we use the oposite vertex normal
                InitBuiltinData(posInput, surfaceDescription.Alpha, bentNormalWS, -fragInputs.tangentToWorld[2], lightmapTexCoord1, lightmapTexCoord2, builtinData);
        
                #else
                BuildSurfaceData(fragInputs, surfaceDescription, V, posInput, surfaceData);
        
                ZERO_BUILTIN_INITIALIZE(builtinData); // No call to InitBuiltinData as we don't have any lighting
                builtinData.opacity = surfaceDescription.Alpha;
        
                #if defined(DEBUG_DISPLAY)
                    // Light Layers are currently not used for the Unlit shader (because it is not lit)
                    // But Unlit objects do cast shadows according to their rendering layer mask, which is what we want to
                    // display in the light layers visualization mode, therefore we need the renderingLayers
                    builtinData.renderingLayers = GetMeshRenderingLightLayer();
                #endif
        
                #endif // SHADER_UNLIT
        
                #ifdef _ALPHATEST_ON
                    // Used for sharpening by alpha to mask - Alpha to covertage is only used with depth only and forward pass (no shadow pass, no transparent pass)
                    builtinData.alphaClipTreshold = alphaCutoff;
                #endif
        
                // override sampleBakedGI - not used by Unlit
        
                builtinData.emissiveColor = surfaceDescription.Emission;
        
                // Note this will not fully work on transparent surfaces (can check with _SURFACE_TYPE_TRANSPARENT define)
                // We will always overwrite vt feeback with the nearest. So behind transparent surfaces vt will not be resolved
                // This is a limitation of the current MRT approach.
                #ifdef UNITY_VIRTUAL_TEXTURING
                #endif
        
                #if _DEPTHOFFSET_ON
                builtinData.depthOffset = surfaceDescription.DepthOffset;
                #endif
        
                // TODO: We should generate distortion / distortionBlur for non distortion pass
                #if (SHADERPASS == SHADERPASS_DISTORTION)
                builtinData.distortion = surfaceDescription.Distortion;
                builtinData.distortionBlur = surfaceDescription.DistortionBlur;
                #endif
        
                #ifndef SHADER_UNLIT
                // PostInitBuiltinData call ApplyDebugToBuiltinData
                PostInitBuiltinData(V, posInput, surfaceData, builtinData);
                #else
                ApplyDebugToBuiltinData(builtinData);
                #endif
        
                RAY_TRACING_OPTIONAL_ALPHA_TEST_PASS
            }
        
            // --------------------------------------------------
            // Main
        
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/ShaderPass/ShaderPassRaytracingForward.hlsl"
        
            // --------------------------------------------------
            // Visual Effect Vertex Invocations
        
        	#ifdef HAVE_VFX_MODIFICATION
        	#include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/VisualEffectVertex.hlsl"
        	#endif
        
            ENDHLSL
        }
        Pass
        {
            Name "GBufferDXR"
            Tags
            {
                "LightMode" = "GBufferDXR"
            }
        
            // Render State
            // RenderState: <None>
        
            // Debug
            // <None>
        
            // --------------------------------------------------
            // Pass
        
            HLSLPROGRAM
        
            // Pragmas
            #pragma target 5.0
        #pragma raytracing surface_shader
        #pragma only_renderers d3d11 ps5
        
            // Keywords
            #pragma shader_feature _ _SURFACE_TYPE_TRANSPARENT
        #pragma shader_feature_local _BLENDMODE_OFF _BLENDMODE_ALPHA _BLENDMODE_ADD _BLENDMODE_PRE_MULTIPLY
        #pragma shader_feature_local _ _ADD_PRECOMPUTED_VELOCITY
        #pragma shader_feature_local _ _TRANSPARENT_WRITES_MOTION_VEC
        #pragma shader_feature_local_fragment _ _ENABLE_FOG_ON_TRANSPARENT
        #pragma multi_compile _ DEBUG_DISPLAY
            // GraphKeywords: <None>
        
            // Early Instancing Defines
            // DotsInstancingOptions: <None>
        
            // Injected Instanced Properties (must be included before UnityInstancing.hlsl)
            // HybridV1InjectedBuiltinProperties: <None>
        
            // For custom interpolators to inject a substruct definition before FragInputs definition,
            // allowing for FragInputs to capture CI's intended for ShaderGraph's SDI.
            /* WARNING: $splice Could not find named fragment 'CustomInterpolatorPreInclude' */
        
        
            // TODO: Merge FragInputsVFX substruct with CustomInterpolators.
        	#ifdef HAVE_VFX_MODIFICATION
        	struct FragInputsVFX
            {
                /* WARNING: $splice Could not find named fragment 'FragInputsVFX' */
            };
            #endif
        
            #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Common.hlsl"
        	#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/GeometricTools.hlsl" // Required by Tessellation.hlsl
        	#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Tessellation.hlsl"
            #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Texture.hlsl"
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderVariables.hlsl"
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/ShaderPass/ShaderPass.cs.hlsl"
            #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/TextureStack.hlsl" // Required to be include before we include properties as it define DECLARE_STACK_CB
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderGraphHeader.hlsl" // Need to be here for Gradient struct definition
        
            // --------------------------------------------------
            // Defines
        
            // Attribute
            #define ATTRIBUTES_NEED_NORMAL
            #define ATTRIBUTES_NEED_TANGENT
            #define VARYINGS_NEED_POSITION_WS
            #define VARYINGS_NEED_TANGENT_TO_WORLD
        
        
            //Strip down the FragInputs.hlsl (on graphics), so we can only optimize the interpolators we use.
            //if by accident something requests contents of FragInputs.hlsl, it will be caught as a compiler error
            //Frag inputs stripping is only enabled when FRAG_INPUTS_ENABLE_STRIPPING is set
            #if !defined(SHADER_STAGE_RAY_TRACING) && SHADERPASS != SHADERPASS_RAYTRACING_GBUFFER && SHADERPASS != SHADERPASS_FULL_SCREEN_DEBUG
            #define FRAG_INPUTS_ENABLE_STRIPPING
            #endif
        
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/ShaderPass/FragInputs.hlsl"
        
        
        
            #define SHADERPASS SHADERPASS_RAYTRACING_GBUFFER
        #define SHADOW_LOW
        #define RAYTRACING_SHADER_GRAPH_RAYTRACED
        #define REQUIRE_DEPTH_TEXTURE
        
        
            // Following two define are a workaround introduce in 10.1.x for RaytracingQualityNode
            // The ShaderGraph don't support correctly migration of this node as it serialize all the node data
            // in the json file making it impossible to uprgrade. Until we get a fix, we do a workaround here
            // to still allow us to rename the field and keyword of this node without breaking existing code.
            #ifdef RAYTRACING_SHADER_GRAPH_DEFAULT
            #define RAYTRACING_SHADER_GRAPH_HIGH
            #endif
        
            #ifdef RAYTRACING_SHADER_GRAPH_RAYTRACED
            #define RAYTRACING_SHADER_GRAPH_LOW
            #endif
            // end
        
            #ifndef SHADER_UNLIT
            // We need isFrontFace when using double sided - it is not required for unlit as in case of unlit double sided only drive the cullmode
            // VARYINGS_NEED_CULLFACE can be define by VaryingsMeshToPS.FaceSign input if a IsFrontFace Node is included in the shader graph.
            #if defined(_DOUBLESIDED_ON) && !defined(VARYINGS_NEED_CULLFACE)
                #define VARYINGS_NEED_CULLFACE
            #endif
            #endif
        
            // Specific Material Define
        // Setup a define to say we are an unlit shader
        #define SHADER_UNLIT
        
        // Following Macro are only used by Unlit material
        #if defined(_ENABLE_SHADOW_MATTE) && (SHADERPASS == SHADERPASS_FORWARD_UNLIT || SHADERPASS == SHADERPASS_PATH_TRACING)
        #define LIGHTLOOP_DISABLE_TILE_AND_CLUSTER
        #define HAS_LIGHTLOOP
        #endif
            // Caution: we can use the define SHADER_UNLIT onlit after the above Material include as it is the Unlit template who define it
        
            // To handle SSR on transparent correctly with a possibility to enable/disable it per framesettings
            // we should have a code like this:
            // if !defined(_DISABLE_SSR_TRANSPARENT)
            // pragma multi_compile _ WRITE_NORMAL_BUFFER
            // endif
            // i.e we enable the multicompile only if we can receive SSR or not, and then C# code drive
            // it based on if SSR transparent in frame settings and not (and stripper can strip it).
            // this is currently not possible with our current preprocessor as _DISABLE_SSR_TRANSPARENT is a keyword not a define
            // so instead we used this and chose to pay the extra cost of normal write even if SSR transaprent is disabled.
            // Ideally the shader graph generator should handle it but condition below can't be handle correctly for now.
            #if SHADERPASS == SHADERPASS_TRANSPARENT_DEPTH_PREPASS
            #if !defined(_DISABLE_SSR_TRANSPARENT) && !defined(SHADER_UNLIT)
                #define WRITE_NORMAL_BUFFER
            #endif
            #endif
        
            #ifndef DEBUG_DISPLAY
                // In case of opaque we don't want to perform the alpha test, it is done in depth prepass and we use depth equal for ztest (setup from UI)
                // Don't do it with debug display mode as it is possible there is no depth prepass in this case
                #if !defined(_SURFACE_TYPE_TRANSPARENT)
                    #if SHADERPASS == SHADERPASS_FORWARD
                    #define SHADERPASS_FORWARD_BYPASS_ALPHA_TEST
                    #elif SHADERPASS == SHADERPASS_GBUFFER
                    #define SHADERPASS_GBUFFER_BYPASS_ALPHA_TEST
                    #endif
                #endif
            #endif
        
            // Define _DEFERRED_CAPABLE_MATERIAL for shader capable to run in deferred pass
            #if defined(SHADER_LIT) && !defined(_SURFACE_TYPE_TRANSPARENT)
                #define _DEFERRED_CAPABLE_MATERIAL
            #endif
        
            // Translate transparent motion vector define
            #if defined(_TRANSPARENT_WRITES_MOTION_VEC) && defined(_SURFACE_TYPE_TRANSPARENT)
                #define _WRITE_TRANSPARENT_MOTION_VECTOR
            #endif
        
            // -- Graph Properties
            CBUFFER_START(UnityPerMaterial)
        float4 _Rotate_Projection;
        float _Noise_Scale;
        float _Speed;
        float _Vertexoffset;
        float4 _Remap_xy_zw;
        float4 _Color_Peak;
        float4 _Color_Valley;
        float _SmoothEdge1;
        float _SmoothEdge2;
        float _Cloud_Pow;
        float _Base_Scale;
        float _Base_Speed;
        float _BaseStrength;
        float _Emission_Strength;
        float _Curvate_Radius;
        float _Fresnel_Power;
        float _Fresnel_Opacity;
        float _Depth_Fade;
        float4 _EmissionColor;
        float _UseShadowThreshold;
        float4 _DoubleSidedConstants;
        float _BlendMode;
        float _EnableBlendModePreserveSpecularLighting;
        CBUFFER_END
        
        // Object and Global properties
        
            // -- Property used by ScenePickingPass
            #ifdef SCENEPICKINGPASS
            float4 _SelectionID;
            #endif
        
            // -- Properties used by SceneSelectionPass
            #ifdef SCENESELECTIONPASS
            int _ObjectId;
            int _PassValue;
            #endif
        
            // Includes
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/Raytracing/Shaders/RaytracingMacros.hlsl"
        #include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/Raytracing/Shaders/ShaderVariablesRaytracing.hlsl"
        #include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Material.hlsl"
        #include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/Raytracing/Shaders/ShaderVariablesRaytracingLightLoop.hlsl"
        #include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/Raytracing/Shaders/Deferred/RaytracingIntersectonGBuffer.hlsl"
        #include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Unlit/Unlit.hlsl"
        #include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/NormalBuffer.hlsl"
        #include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/StandardLit/StandardLit.hlsl"
        #include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Unlit/UnlitRaytracing.hlsl"
        #include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/BuiltinUtilities.hlsl"
        #include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/MaterialUtilities.hlsl"
        #include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/Raytracing/Shaders/RayTracingCommon.hlsl"
        #include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderGraphFunctions.hlsl"
        	// GraphIncludes: <None>
        
            // --------------------------------------------------
            // Structs and Packing
        
            struct SurfaceDescriptionInputs
        {
             float3 WorldSpaceNormal;
             float3 WorldSpaceViewDirection;
             float3 ObjectSpacePosition;
             float3 WorldSpacePosition;
             float4 ScreenPosition;
             float3 TimeParameters;
        };
        
            //Interpolator Packs: <None>
        
            // --------------------------------------------------
            // Graph
        
        
            // Graph Functions
            
        void Unity_Rotate_About_Axis_Radians_float(float3 In, float3 Axis, float Rotation, out float3 Out)
        {
            float s = sin(Rotation);
            float c = cos(Rotation);
            float one_minus_c = 1.0 - c;
        
            Axis = normalize(Axis);
        
            float3x3 rot_mat = { one_minus_c * Axis.x * Axis.x + c,            one_minus_c * Axis.x * Axis.y - Axis.z * s,     one_minus_c * Axis.z * Axis.x + Axis.y * s,
                                      one_minus_c * Axis.x * Axis.y + Axis.z * s,   one_minus_c * Axis.y * Axis.y + c,              one_minus_c * Axis.y * Axis.z - Axis.x * s,
                                      one_minus_c * Axis.z * Axis.x - Axis.y * s,   one_minus_c * Axis.y * Axis.z + Axis.x * s,     one_minus_c * Axis.z * Axis.z + c
                                    };
        
            Out = mul(rot_mat,  In);
        }
        
        void Unity_Multiply_float_float(float A, float B, out float Out)
        {
            Out = A * B;
        }
        
        void Unity_TilingAndOffset_float(float2 UV, float2 Tiling, float2 Offset, out float2 Out)
        {
            Out = UV * Tiling + Offset;
        }
        
        
        float2 Unity_GradientNoise_Dir_float(float2 p)
        {
            // Permutation and hashing used in webgl-nosie goo.gl/pX7HtC
            p = p % 289;
            // need full precision, otherwise half overflows when p > 1
            float x = float(34 * p.x + 1) * p.x % 289 + p.y;
            x = (34 * x + 1) * x % 289;
            x = frac(x / 41) * 2 - 1;
            return normalize(float2(x - floor(x + 0.5), abs(x) - 0.5));
        }
        
        void Unity_GradientNoise_float(float2 UV, float Scale, out float Out)
        {
            float2 p = UV * Scale;
            float2 ip = floor(p);
            float2 fp = frac(p);
            float d00 = dot(Unity_GradientNoise_Dir_float(ip), fp);
            float d01 = dot(Unity_GradientNoise_Dir_float(ip + float2(0, 1)), fp - float2(0, 1));
            float d10 = dot(Unity_GradientNoise_Dir_float(ip + float2(1, 0)), fp - float2(1, 0));
            float d11 = dot(Unity_GradientNoise_Dir_float(ip + float2(1, 1)), fp - float2(1, 1));
            fp = fp * fp * fp * (fp * (fp * 6 - 15) + 10);
            Out = lerp(lerp(d00, d01, fp.y), lerp(d10, d11, fp.y), fp.x) + 0.5;
        }
        
        void Unity_Add_float(float A, float B, out float Out)
        {
            Out = A + B;
        }
        
        void Unity_Divide_float(float A, float B, out float Out)
        {
            Out = A / B;
        }
        
        void Unity_Saturate_float(float In, out float Out)
        {
            Out = saturate(In);
        }
        
        void Unity_Power_float(float A, float B, out float Out)
        {
            Out = pow(A, B);
        }
        
        void Unity_Combine_float(float R, float G, float B, float A, out float4 RGBA, out float3 RGB, out float2 RG)
        {
            RGBA = float4(R, G, B, A);
            RGB = float3(R, G, B);
            RG = float2(R, G);
        }
        
        void Unity_Remap_float(float In, float2 InMinMax, float2 OutMinMax, out float Out)
        {
            Out = OutMinMax.x + (In - InMinMax.x) * (OutMinMax.y - OutMinMax.x) / (InMinMax.y - InMinMax.x);
        }
        
        void Unity_Absolute_float(float In, out float Out)
        {
            Out = abs(In);
        }
        
        void Unity_Smoothstep_float(float Edge1, float Edge2, float In, out float Out)
        {
            Out = smoothstep(Edge1, Edge2, In);
        }
        
        void Unity_FresnelEffect_float(float3 Normal, float3 ViewDir, float Power, out float Out)
        {
            Out = pow((1.0 - saturate(dot(normalize(Normal), normalize(ViewDir)))), Power);
        }
        
        void Unity_Lerp_float4(float4 A, float4 B, float4 T, out float4 Out)
        {
            Out = lerp(A, B, T);
        }
        
        void Unity_Add_float4(float4 A, float4 B, out float4 Out)
        {
            Out = A + B;
        }
        
        void Unity_Multiply_float4_float4(float4 A, float4 B, out float4 Out)
        {
            Out = A * B;
        }
        
        void Unity_SceneDepth_Eye_float(float4 UV, out float Out)
        {
            if (unity_OrthoParams.w == 1.0)
            {
                Out = LinearEyeDepth(ComputeWorldSpacePosition(UV.xy, SHADERGRAPH_SAMPLE_SCENE_DEPTH(UV.xy), UNITY_MATRIX_I_VP), UNITY_MATRIX_V);
            }
            else
            {
                Out = LinearEyeDepth(SHADERGRAPH_SAMPLE_SCENE_DEPTH(UV.xy), _ZBufferParams);
            }
        }
        
        void Unity_Subtract_float(float A, float B, out float Out)
        {
            Out = A - B;
        }
        
            // Graph Vertex
            // GraphVertex: <None>
        
            // Graph Pixel
            struct SurfaceDescription
        {
            float3 BaseColor;
            float3 Emission;
            float Alpha;
        };
        
        SurfaceDescription SurfaceDescriptionFunction(SurfaceDescriptionInputs IN)
        {
            SurfaceDescription surface = (SurfaceDescription)0;
            float _Property_7d8e49b5efe94dea8210c34a6319b1ef_Out_0 = _SmoothEdge1;
            float _Property_09307b889e8945078bacabda50cca5c6_Out_0 = _SmoothEdge2;
            float4 _Property_a8d53d7ea07349e0979b956475bdd7cc_Out_0 = _Rotate_Projection;
            float _Split_7d12b2bb5feb46d685603473d0cf5818_R_1 = _Property_a8d53d7ea07349e0979b956475bdd7cc_Out_0[0];
            float _Split_7d12b2bb5feb46d685603473d0cf5818_G_2 = _Property_a8d53d7ea07349e0979b956475bdd7cc_Out_0[1];
            float _Split_7d12b2bb5feb46d685603473d0cf5818_B_3 = _Property_a8d53d7ea07349e0979b956475bdd7cc_Out_0[2];
            float _Split_7d12b2bb5feb46d685603473d0cf5818_A_4 = _Property_a8d53d7ea07349e0979b956475bdd7cc_Out_0[3];
            float3 _RotateAboutAxis_1b91481bceed4e9a82a13975af123b02_Out_3;
            Unity_Rotate_About_Axis_Radians_float(IN.ObjectSpacePosition, (_Property_a8d53d7ea07349e0979b956475bdd7cc_Out_0.xyz), _Split_7d12b2bb5feb46d685603473d0cf5818_A_4, _RotateAboutAxis_1b91481bceed4e9a82a13975af123b02_Out_3);
            float _Property_258f4645340c46f69274c9f077f1a73c_Out_0 = _Speed;
            float _Multiply_94f6d857831c4e69b53b9bfc92dd852f_Out_2;
            Unity_Multiply_float_float(IN.TimeParameters.x, _Property_258f4645340c46f69274c9f077f1a73c_Out_0, _Multiply_94f6d857831c4e69b53b9bfc92dd852f_Out_2);
            float2 _TilingAndOffset_6cb9fd57231c4a429c9c0fe5aeb7cc58_Out_3;
            Unity_TilingAndOffset_float((_RotateAboutAxis_1b91481bceed4e9a82a13975af123b02_Out_3.xy), float2 (1, 1), (_Multiply_94f6d857831c4e69b53b9bfc92dd852f_Out_2.xx), _TilingAndOffset_6cb9fd57231c4a429c9c0fe5aeb7cc58_Out_3);
            float _Property_2b9001a870d04f8eb60f5d7e1ce909c5_Out_0 = _Noise_Scale;
            float _GradientNoise_061679506b214bb8b4792ec4dfe82ec6_Out_2;
            Unity_GradientNoise_float(_TilingAndOffset_6cb9fd57231c4a429c9c0fe5aeb7cc58_Out_3, _Property_2b9001a870d04f8eb60f5d7e1ce909c5_Out_0, _GradientNoise_061679506b214bb8b4792ec4dfe82ec6_Out_2);
            float2 _TilingAndOffset_1d2491b5855e49d3b2e6b5dbe5db07d4_Out_3;
            Unity_TilingAndOffset_float((_RotateAboutAxis_1b91481bceed4e9a82a13975af123b02_Out_3.xy), float2 (1, 1), float2 (0, 0), _TilingAndOffset_1d2491b5855e49d3b2e6b5dbe5db07d4_Out_3);
            float _GradientNoise_8a27c3fb323f4db1b38f287380605198_Out_2;
            Unity_GradientNoise_float(_TilingAndOffset_1d2491b5855e49d3b2e6b5dbe5db07d4_Out_3, _Property_2b9001a870d04f8eb60f5d7e1ce909c5_Out_0, _GradientNoise_8a27c3fb323f4db1b38f287380605198_Out_2);
            float _Add_a6dd2d6e3f564decbca34ec03a419130_Out_2;
            Unity_Add_float(_GradientNoise_061679506b214bb8b4792ec4dfe82ec6_Out_2, _GradientNoise_8a27c3fb323f4db1b38f287380605198_Out_2, _Add_a6dd2d6e3f564decbca34ec03a419130_Out_2);
            float _Divide_a757ea7167f343ecaec30e69b58c9bae_Out_2;
            Unity_Divide_float(_Add_a6dd2d6e3f564decbca34ec03a419130_Out_2, 2, _Divide_a757ea7167f343ecaec30e69b58c9bae_Out_2);
            float _Saturate_f355ba5a467f4488b7ec89e8a08484a3_Out_1;
            Unity_Saturate_float(_Divide_a757ea7167f343ecaec30e69b58c9bae_Out_2, _Saturate_f355ba5a467f4488b7ec89e8a08484a3_Out_1);
            float _Property_96da655cc17e4594836aa02d74efe33c_Out_0 = _Cloud_Pow;
            float _Power_318bede735044ec6811f2a5c345b7d73_Out_2;
            Unity_Power_float(_Saturate_f355ba5a467f4488b7ec89e8a08484a3_Out_1, _Property_96da655cc17e4594836aa02d74efe33c_Out_0, _Power_318bede735044ec6811f2a5c345b7d73_Out_2);
            float4 _Property_317e8becc0724841a13cbcf8d4c4efbc_Out_0 = _Remap_xy_zw;
            float _Split_3dee68ff9a374966b7612da59c6ac20a_R_1 = _Property_317e8becc0724841a13cbcf8d4c4efbc_Out_0[0];
            float _Split_3dee68ff9a374966b7612da59c6ac20a_G_2 = _Property_317e8becc0724841a13cbcf8d4c4efbc_Out_0[1];
            float _Split_3dee68ff9a374966b7612da59c6ac20a_B_3 = _Property_317e8becc0724841a13cbcf8d4c4efbc_Out_0[2];
            float _Split_3dee68ff9a374966b7612da59c6ac20a_A_4 = _Property_317e8becc0724841a13cbcf8d4c4efbc_Out_0[3];
            float4 _Combine_4e3ec9a6e4064091bba919631e732b7a_RGBA_4;
            float3 _Combine_4e3ec9a6e4064091bba919631e732b7a_RGB_5;
            float2 _Combine_4e3ec9a6e4064091bba919631e732b7a_RG_6;
            Unity_Combine_float(_Split_3dee68ff9a374966b7612da59c6ac20a_R_1, _Split_3dee68ff9a374966b7612da59c6ac20a_G_2, 0, 0, _Combine_4e3ec9a6e4064091bba919631e732b7a_RGBA_4, _Combine_4e3ec9a6e4064091bba919631e732b7a_RGB_5, _Combine_4e3ec9a6e4064091bba919631e732b7a_RG_6);
            float4 _Combine_6f976751f1234c77908b163e59da18bb_RGBA_4;
            float3 _Combine_6f976751f1234c77908b163e59da18bb_RGB_5;
            float2 _Combine_6f976751f1234c77908b163e59da18bb_RG_6;
            Unity_Combine_float(_Split_3dee68ff9a374966b7612da59c6ac20a_B_3, _Split_3dee68ff9a374966b7612da59c6ac20a_A_4, 0, 0, _Combine_6f976751f1234c77908b163e59da18bb_RGBA_4, _Combine_6f976751f1234c77908b163e59da18bb_RGB_5, _Combine_6f976751f1234c77908b163e59da18bb_RG_6);
            float _Remap_a11bf825d8d54f198c2355e6d3cc1fba_Out_3;
            Unity_Remap_float(_Power_318bede735044ec6811f2a5c345b7d73_Out_2, _Combine_4e3ec9a6e4064091bba919631e732b7a_RG_6, _Combine_6f976751f1234c77908b163e59da18bb_RG_6, _Remap_a11bf825d8d54f198c2355e6d3cc1fba_Out_3);
            float _Absolute_553a57701af34a45a18ca7b2af677c8a_Out_1;
            Unity_Absolute_float(_Remap_a11bf825d8d54f198c2355e6d3cc1fba_Out_3, _Absolute_553a57701af34a45a18ca7b2af677c8a_Out_1);
            float _Smoothstep_6babd4aa745b40db842b941b96adf7e9_Out_3;
            Unity_Smoothstep_float(_Property_7d8e49b5efe94dea8210c34a6319b1ef_Out_0, _Property_09307b889e8945078bacabda50cca5c6_Out_0, _Absolute_553a57701af34a45a18ca7b2af677c8a_Out_1, _Smoothstep_6babd4aa745b40db842b941b96adf7e9_Out_3);
            float _Property_17631cb6b51c44b593b4fb1f0ac8fa75_Out_0 = _Base_Speed;
            float _Multiply_2e98faddc46143bea8e48ab17d0e1c15_Out_2;
            Unity_Multiply_float_float(IN.TimeParameters.x, _Property_17631cb6b51c44b593b4fb1f0ac8fa75_Out_0, _Multiply_2e98faddc46143bea8e48ab17d0e1c15_Out_2);
            float2 _TilingAndOffset_d8c83d87b12649f7b6a3902973c4457a_Out_3;
            Unity_TilingAndOffset_float((_RotateAboutAxis_1b91481bceed4e9a82a13975af123b02_Out_3.xy), float2 (1, 1), (_Multiply_2e98faddc46143bea8e48ab17d0e1c15_Out_2.xx), _TilingAndOffset_d8c83d87b12649f7b6a3902973c4457a_Out_3);
            float _Property_2792df33a4d44e20b2f71fe244d5f369_Out_0 = _Base_Scale;
            float _GradientNoise_702d412fe90e4c64b91e9defbe1ffff2_Out_2;
            Unity_GradientNoise_float(_TilingAndOffset_d8c83d87b12649f7b6a3902973c4457a_Out_3, _Property_2792df33a4d44e20b2f71fe244d5f369_Out_0, _GradientNoise_702d412fe90e4c64b91e9defbe1ffff2_Out_2);
            float _Property_a965b78b3be84255ae4ff1617bd2df01_Out_0 = _BaseStrength;
            float _Multiply_9880df30952a454781c1f0c8356100dd_Out_2;
            Unity_Multiply_float_float(_GradientNoise_702d412fe90e4c64b91e9defbe1ffff2_Out_2, _Property_a965b78b3be84255ae4ff1617bd2df01_Out_0, _Multiply_9880df30952a454781c1f0c8356100dd_Out_2);
            float _Add_98d9cdbb65e44e0282692d35bd9d237b_Out_2;
            Unity_Add_float(_Smoothstep_6babd4aa745b40db842b941b96adf7e9_Out_3, _Multiply_9880df30952a454781c1f0c8356100dd_Out_2, _Add_98d9cdbb65e44e0282692d35bd9d237b_Out_2);
            float _Add_d305fd085a9b459da3d4bd5108430b3f_Out_2;
            Unity_Add_float(1, _Property_a965b78b3be84255ae4ff1617bd2df01_Out_0, _Add_d305fd085a9b459da3d4bd5108430b3f_Out_2);
            float _Divide_55db7b7a0b8b481d83fb512a13a2dba6_Out_2;
            Unity_Divide_float(_Add_98d9cdbb65e44e0282692d35bd9d237b_Out_2, _Add_d305fd085a9b459da3d4bd5108430b3f_Out_2, _Divide_55db7b7a0b8b481d83fb512a13a2dba6_Out_2);
            float _Property_5a371e38a60143fcae81da7313c1bf15_Out_0 = _Fresnel_Power;
            float _FresnelEffect_4c470240dea248acb0092676d71437cb_Out_3;
            Unity_FresnelEffect_float(IN.WorldSpaceNormal, IN.WorldSpaceViewDirection, _Property_5a371e38a60143fcae81da7313c1bf15_Out_0, _FresnelEffect_4c470240dea248acb0092676d71437cb_Out_3);
            float _Multiply_384d15a2ef094b7e8b1ec6d69dada246_Out_2;
            Unity_Multiply_float_float(_Divide_55db7b7a0b8b481d83fb512a13a2dba6_Out_2, _FresnelEffect_4c470240dea248acb0092676d71437cb_Out_3, _Multiply_384d15a2ef094b7e8b1ec6d69dada246_Out_2);
            float _Property_3c23366c651c4949b03cb10c14ae0a27_Out_0 = _Fresnel_Opacity;
            float _Multiply_9380e32f6e4644e1b42e398229c18d31_Out_2;
            Unity_Multiply_float_float(_Multiply_384d15a2ef094b7e8b1ec6d69dada246_Out_2, _Property_3c23366c651c4949b03cb10c14ae0a27_Out_0, _Multiply_9380e32f6e4644e1b42e398229c18d31_Out_2);
            float4 _Property_dff39e3157cb4a09aac968677ade995d_Out_0 = _Color_Valley;
            float4 _Property_1b300af9e23e428fa893e55f9390600d_Out_0 = _Color_Peak;
            float4 _Lerp_6d0a20bb25554e1fa8697f473485e856_Out_3;
            Unity_Lerp_float4(_Property_dff39e3157cb4a09aac968677ade995d_Out_0, _Property_1b300af9e23e428fa893e55f9390600d_Out_0, (_Add_98d9cdbb65e44e0282692d35bd9d237b_Out_2.xxxx), _Lerp_6d0a20bb25554e1fa8697f473485e856_Out_3);
            float4 _Add_6507a6920d9c478888f235ad9d0bb542_Out_2;
            Unity_Add_float4((_Multiply_9380e32f6e4644e1b42e398229c18d31_Out_2.xxxx), _Lerp_6d0a20bb25554e1fa8697f473485e856_Out_3, _Add_6507a6920d9c478888f235ad9d0bb542_Out_2);
            float _Property_9cf7107417e042afb41766bb37be827b_Out_0 = _Emission_Strength;
            float4 _Multiply_31ae534c0cc640be9fda8de7cc705bbf_Out_2;
            Unity_Multiply_float4_float4(_Add_6507a6920d9c478888f235ad9d0bb542_Out_2, (_Property_9cf7107417e042afb41766bb37be827b_Out_0.xxxx), _Multiply_31ae534c0cc640be9fda8de7cc705bbf_Out_2);
            float _SceneDepth_619a7e0097894c29ba4557fde6cbb174_Out_1;
            Unity_SceneDepth_Eye_float(float4(IN.ScreenPosition.xy / IN.ScreenPosition.w, 0, 0), _SceneDepth_619a7e0097894c29ba4557fde6cbb174_Out_1);
            float4 _ScreenPosition_ee728e739f744068b0d15c1205d618a0_Out_0 = IN.ScreenPosition;
            float _Split_d5d8a30c527c46a19ab94602c057016e_R_1 = _ScreenPosition_ee728e739f744068b0d15c1205d618a0_Out_0[0];
            float _Split_d5d8a30c527c46a19ab94602c057016e_G_2 = _ScreenPosition_ee728e739f744068b0d15c1205d618a0_Out_0[1];
            float _Split_d5d8a30c527c46a19ab94602c057016e_B_3 = _ScreenPosition_ee728e739f744068b0d15c1205d618a0_Out_0[2];
            float _Split_d5d8a30c527c46a19ab94602c057016e_A_4 = _ScreenPosition_ee728e739f744068b0d15c1205d618a0_Out_0[3];
            float _Subtract_07eb78fa00d74ade84172a64a4a4616c_Out_2;
            Unity_Subtract_float(_Split_d5d8a30c527c46a19ab94602c057016e_A_4, 1, _Subtract_07eb78fa00d74ade84172a64a4a4616c_Out_2);
            float _Subtract_3ef0962257844c2c87b9ff8d165099f3_Out_2;
            Unity_Subtract_float(_SceneDepth_619a7e0097894c29ba4557fde6cbb174_Out_1, _Subtract_07eb78fa00d74ade84172a64a4a4616c_Out_2, _Subtract_3ef0962257844c2c87b9ff8d165099f3_Out_2);
            float _Property_9167e3d66076450baeb620b8f8b66552_Out_0 = _Depth_Fade;
            float _Divide_9a1ae8922923443883cbd9e71941de32_Out_2;
            Unity_Divide_float(_Subtract_3ef0962257844c2c87b9ff8d165099f3_Out_2, _Property_9167e3d66076450baeb620b8f8b66552_Out_0, _Divide_9a1ae8922923443883cbd9e71941de32_Out_2);
            float _Saturate_791ce4d2963e420ba68a97fca0bef8f9_Out_1;
            Unity_Saturate_float(_Divide_9a1ae8922923443883cbd9e71941de32_Out_2, _Saturate_791ce4d2963e420ba68a97fca0bef8f9_Out_1);
            surface.BaseColor = (_Add_6507a6920d9c478888f235ad9d0bb542_Out_2.xyz);
            surface.Emission = (_Multiply_31ae534c0cc640be9fda8de7cc705bbf_Out_2.xyz);
            surface.Alpha = _Saturate_791ce4d2963e420ba68a97fca0bef8f9_Out_1;
            return surface;
        }
        
            // --------------------------------------------------
            // Build Graph Inputs
            #ifdef HAVE_VFX_MODIFICATION
            #define VFX_SRP_ATTRIBUTES AttributesMesh
            #define VaryingsMeshType VaryingsMeshToPS
            #define VFX_SRP_VARYINGS VaryingsMeshType
            #define VFX_SRP_SURFACE_INPUTS FragInputs
            #endif
            SurfaceDescriptionInputs FragInputsToSurfaceDescriptionInputs(FragInputs input, float3 viewWS)
        {
            SurfaceDescriptionInputs output;
            ZERO_INITIALIZE(SurfaceDescriptionInputs, output);
        
            output.WorldSpaceNormal =                           normalize(input.tangentToWorld[2].xyz);
            #if defined(SHADER_STAGE_RAY_TRACING)
            #else
            #endif
            output.WorldSpaceViewDirection =                    normalize(viewWS);
            output.WorldSpacePosition =                         input.positionRWS;
            output.ObjectSpacePosition =                        TransformWorldToObject(input.positionRWS);
            output.ScreenPosition =                             ComputeScreenPos(TransformWorldToHClip(input.positionRWS), _ProjectionParams.x);
            output.TimeParameters =                             _TimeParameters.xyz; // This is mainly for LW as HD overwrite this value
        
            // splice point to copy frag inputs custom interpolator pack into the SDI
            /* WARNING: $splice Could not find named fragment 'CustomInterpolatorCopyToSDI' */
        
            return output;
        }
        
            // --------------------------------------------------
            // Build Surface Data (Specific Material)
        
        void BuildSurfaceData(FragInputs fragInputs, inout SurfaceDescription surfaceDescription, float3 V, PositionInputs posInput, out SurfaceData surfaceData)
        {
            // setup defaults -- these are used if the graph doesn't output a value
            ZERO_INITIALIZE(SurfaceData, surfaceData);
        
            // copy across graph values, if defined
            surfaceData.color = surfaceDescription.BaseColor;
        
            #ifdef WRITE_NORMAL_BUFFER
            // When we need to export the normal (in the depth prepass, we write the geometry one)
            surfaceData.normalWS = fragInputs.tangentToWorld[2];
            #endif
        
            #if defined(DEBUG_DISPLAY)
            if (_DebugMipMapMode != DEBUGMIPMAPMODE_NONE)
            {
                // TODO
            }
            #endif
        
            #ifdef _ENABLE_SHADOW_MATTE
        
                #if (SHADERPASS == SHADERPASS_FORWARD_UNLIT) || (SHADERPASS == SHADERPASS_RAYTRACING_GBUFFER) || (SHADERPASS == SHADERPASS_RAYTRACING_INDIRECT) || (SHADERPASS == SHADERPASS_RAYTRACING_FORWARD)
        
                    HDShadowContext shadowContext = InitShadowContext();
        
                    // Evaluate the shadow, the normal is guaranteed if shadow matte is enabled on this shader.
                    float3 shadow3;
                    ShadowLoopMin(shadowContext, posInput, normalize(fragInputs.tangentToWorld[2]), asuint(_ShadowMatteFilter), GetMeshRenderingLightLayer(), shadow3);
        
                    // Compute the average value in the fourth channel
                    float4 shadow = float4(shadow3, dot(shadow3, float3(1.0/3.0, 1.0/3.0, 1.0/3.0)));
        
                    float4 shadowColor = (1.0 - shadow) * surfaceDescription.ShadowTint.rgba;
                    float  localAlpha  = saturate(shadowColor.a + surfaceDescription.Alpha);
        
                    // Keep the nested lerp
                    // With no Color (bsdfData.color.rgb, bsdfData.color.a == 0.0f), just use ShadowColor*Color to avoid a ring of "white" around the shadow
                    // And mix color to consider the Color & ShadowColor alpha (from texture or/and color picker)
                    #ifdef _SURFACE_TYPE_TRANSPARENT
                        surfaceData.color = lerp(shadowColor.rgb * surfaceData.color, lerp(lerp(shadowColor.rgb, surfaceData.color, 1.0 - surfaceDescription.ShadowTint.a), surfaceData.color, shadow.rgb), surfaceDescription.Alpha);
                    #else
                        surfaceData.color = lerp(lerp(shadowColor.rgb, surfaceData.color, 1.0 - surfaceDescription.ShadowTint.a), surfaceData.color, shadow.rgb);
                    #endif
                    localAlpha = ApplyBlendMode(surfaceData.color, localAlpha).a;
        
                    surfaceDescription.Alpha = localAlpha;
        
                #elif SHADERPASS == SHADERPASS_PATH_TRACING
        
                    surfaceData.normalWS = fragInputs.tangentToWorld[2];
                    surfaceData.shadowTint = surfaceDescription.ShadowTint.rgba;
        
                #endif
        
            #endif // _ENABLE_SHADOW_MATTE
        }
        
            // --------------------------------------------------
            // Get Surface And BuiltinData
        
            void GetSurfaceAndBuiltinData(FragInputs fragInputs, float3 V, inout PositionInputs posInput, out SurfaceData surfaceData, out BuiltinData builtinData RAY_TRACING_OPTIONAL_PARAMETERS)
            {
                // Don't dither if displaced tessellation (we're fading out the displacement instead to match the next LOD)
                #if !defined(SHADER_STAGE_RAY_TRACING) && !defined(_TESSELLATION_DISPLACEMENT)
                #ifdef LOD_FADE_CROSSFADE // enable dithering LOD transition if user select CrossFade transition in LOD group
                LODDitheringTransition(ComputeFadeMaskSeed(V, posInput.positionSS), unity_LODFade.x);
                #endif
                #endif
        
                #ifndef SHADER_UNLIT
                #ifdef _DOUBLESIDED_ON
                    float3 doubleSidedConstants = _DoubleSidedConstants.xyz;
                #else
                    float3 doubleSidedConstants = float3(1.0, 1.0, 1.0);
                #endif
        
                ApplyDoubleSidedFlipOrMirror(fragInputs, doubleSidedConstants); // Apply double sided flip on the vertex normal
                #endif // SHADER_UNLIT
        
                SurfaceDescriptionInputs surfaceDescriptionInputs = FragInputsToSurfaceDescriptionInputs(fragInputs, V);
        
                #if defined(HAVE_VFX_MODIFICATION)
                GraphProperties properties;
                ZERO_INITIALIZE(GraphProperties, properties);
        
                GetElementPixelProperties(fragInputs, properties);
        
                SurfaceDescription surfaceDescription = SurfaceDescriptionFunction(surfaceDescriptionInputs, properties);
                #else
                SurfaceDescription surfaceDescription = SurfaceDescriptionFunction(surfaceDescriptionInputs);
                #endif
        
                // Perform alpha test very early to save performance (a killed pixel will not sample textures)
                // TODO: split graph evaluation to grab just alpha dependencies first? tricky..
                #ifdef _ALPHATEST_ON
                    float alphaCutoff = surfaceDescription.AlphaClipThreshold;
                    #if SHADERPASS == SHADERPASS_TRANSPARENT_DEPTH_PREPASS
                    // The TransparentDepthPrepass is also used with SSR transparent.
                    // If an artists enable transaprent SSR but not the TransparentDepthPrepass itself, then we use AlphaClipThreshold
                    // otherwise if TransparentDepthPrepass is enabled we use AlphaClipThresholdDepthPrepass
                    #elif SHADERPASS == SHADERPASS_TRANSPARENT_DEPTH_POSTPASS
                    // DepthPostpass always use its own alpha threshold
                    alphaCutoff = surfaceDescription.AlphaClipThresholdDepthPostpass;
                    #elif (SHADERPASS == SHADERPASS_SHADOWS) || (SHADERPASS == SHADERPASS_RAYTRACING_VISIBILITY)
                    // If use shadow threshold isn't enable we don't allow any test
                    #endif
        
                    GENERIC_ALPHA_TEST(surfaceDescription.Alpha, alphaCutoff);
                #endif
        
                #if !defined(SHADER_STAGE_RAY_TRACING) && _DEPTHOFFSET_ON
                ApplyDepthOffsetPositionInput(V, surfaceDescription.DepthOffset, GetViewForwardDir(), GetWorldToHClipMatrix(), posInput);
                #endif
        
                #ifndef SHADER_UNLIT
                float3 bentNormalWS;
                BuildSurfaceData(fragInputs, surfaceDescription, V, posInput, surfaceData, bentNormalWS);
        
                #ifdef FRAG_INPUTS_USE_TEXCOORD1
                    float4 lightmapTexCoord1 = fragInputs.texCoord1;
                #else
                    float4 lightmapTexCoord1 = float4(0,0,0,0);
                #endif
        
                #ifdef FRAG_INPUTS_USE_TEXCOORD2
                    float4 lightmapTexCoord2 = fragInputs.texCoord2;
                #else
                    float4 lightmapTexCoord2 = float4(0,0,0,0);
                #endif
        
                // Builtin Data
                // For back lighting we use the oposite vertex normal
                InitBuiltinData(posInput, surfaceDescription.Alpha, bentNormalWS, -fragInputs.tangentToWorld[2], lightmapTexCoord1, lightmapTexCoord2, builtinData);
        
                #else
                BuildSurfaceData(fragInputs, surfaceDescription, V, posInput, surfaceData);
        
                ZERO_BUILTIN_INITIALIZE(builtinData); // No call to InitBuiltinData as we don't have any lighting
                builtinData.opacity = surfaceDescription.Alpha;
        
                #if defined(DEBUG_DISPLAY)
                    // Light Layers are currently not used for the Unlit shader (because it is not lit)
                    // But Unlit objects do cast shadows according to their rendering layer mask, which is what we want to
                    // display in the light layers visualization mode, therefore we need the renderingLayers
                    builtinData.renderingLayers = GetMeshRenderingLightLayer();
                #endif
        
                #endif // SHADER_UNLIT
        
                #ifdef _ALPHATEST_ON
                    // Used for sharpening by alpha to mask - Alpha to covertage is only used with depth only and forward pass (no shadow pass, no transparent pass)
                    builtinData.alphaClipTreshold = alphaCutoff;
                #endif
        
                // override sampleBakedGI - not used by Unlit
        
                builtinData.emissiveColor = surfaceDescription.Emission;
        
                // Note this will not fully work on transparent surfaces (can check with _SURFACE_TYPE_TRANSPARENT define)
                // We will always overwrite vt feeback with the nearest. So behind transparent surfaces vt will not be resolved
                // This is a limitation of the current MRT approach.
                #ifdef UNITY_VIRTUAL_TEXTURING
                #endif
        
                #if _DEPTHOFFSET_ON
                builtinData.depthOffset = surfaceDescription.DepthOffset;
                #endif
        
                // TODO: We should generate distortion / distortionBlur for non distortion pass
                #if (SHADERPASS == SHADERPASS_DISTORTION)
                builtinData.distortion = surfaceDescription.Distortion;
                builtinData.distortionBlur = surfaceDescription.DistortionBlur;
                #endif
        
                #ifndef SHADER_UNLIT
                // PostInitBuiltinData call ApplyDebugToBuiltinData
                PostInitBuiltinData(V, posInput, surfaceData, builtinData);
                #else
                ApplyDebugToBuiltinData(builtinData);
                #endif
        
                RAY_TRACING_OPTIONAL_ALPHA_TEST_PASS
            }
        
            // --------------------------------------------------
            // Main
        
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/ShaderPass/ShaderPassRaytracingGBuffer.hlsl"
        
            // --------------------------------------------------
            // Visual Effect Vertex Invocations
        
        	#ifdef HAVE_VFX_MODIFICATION
        	#include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/VisualEffectVertex.hlsl"
        	#endif
        
            ENDHLSL
        }
        Pass
        {
            Name "PathTracingDXR"
            Tags
            {
                "LightMode" = "PathTracingDXR"
            }
        
            // Render State
            // RenderState: <None>
        
            // Debug
            // <None>
        
            // --------------------------------------------------
            // Pass
        
            HLSLPROGRAM
        
            // Pragmas
            #pragma target 5.0
        #pragma raytracing surface_shader
        #pragma only_renderers d3d11 ps5
        
            // Keywords
            #pragma shader_feature _ _SURFACE_TYPE_TRANSPARENT
        #pragma shader_feature_local _BLENDMODE_OFF _BLENDMODE_ALPHA _BLENDMODE_ADD _BLENDMODE_PRE_MULTIPLY
        #pragma shader_feature_local _ _ADD_PRECOMPUTED_VELOCITY
        #pragma shader_feature_local _ _TRANSPARENT_WRITES_MOTION_VEC
        #pragma shader_feature_local_fragment _ _ENABLE_FOG_ON_TRANSPARENT
            // GraphKeywords: <None>
        
            // Early Instancing Defines
            // DotsInstancingOptions: <None>
        
            // Injected Instanced Properties (must be included before UnityInstancing.hlsl)
            // HybridV1InjectedBuiltinProperties: <None>
        
            // For custom interpolators to inject a substruct definition before FragInputs definition,
            // allowing for FragInputs to capture CI's intended for ShaderGraph's SDI.
            /* WARNING: $splice Could not find named fragment 'CustomInterpolatorPreInclude' */
        
        
            // TODO: Merge FragInputsVFX substruct with CustomInterpolators.
        	#ifdef HAVE_VFX_MODIFICATION
        	struct FragInputsVFX
            {
                /* WARNING: $splice Could not find named fragment 'FragInputsVFX' */
            };
            #endif
        
            #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Common.hlsl"
        	#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/GeometricTools.hlsl" // Required by Tessellation.hlsl
        	#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Tessellation.hlsl"
            #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Texture.hlsl"
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderVariables.hlsl"
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/ShaderPass/ShaderPass.cs.hlsl"
            #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/TextureStack.hlsl" // Required to be include before we include properties as it define DECLARE_STACK_CB
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderGraphHeader.hlsl" // Need to be here for Gradient struct definition
        
            // --------------------------------------------------
            // Defines
        
            // Attribute
            #define ATTRIBUTES_NEED_NORMAL
            #define ATTRIBUTES_NEED_TANGENT
            #define VARYINGS_NEED_POSITION_WS
            #define VARYINGS_NEED_TANGENT_TO_WORLD
        
        
            //Strip down the FragInputs.hlsl (on graphics), so we can only optimize the interpolators we use.
            //if by accident something requests contents of FragInputs.hlsl, it will be caught as a compiler error
            //Frag inputs stripping is only enabled when FRAG_INPUTS_ENABLE_STRIPPING is set
            #if !defined(SHADER_STAGE_RAY_TRACING) && SHADERPASS != SHADERPASS_RAYTRACING_GBUFFER && SHADERPASS != SHADERPASS_FULL_SCREEN_DEBUG
            #define FRAG_INPUTS_ENABLE_STRIPPING
            #endif
        
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/ShaderPass/FragInputs.hlsl"
        
        
        
            #define SHADERPASS SHADERPASS_PATH_TRACING
        #define REQUIRE_DEPTH_TEXTURE
        
        
            // Following two define are a workaround introduce in 10.1.x for RaytracingQualityNode
            // The ShaderGraph don't support correctly migration of this node as it serialize all the node data
            // in the json file making it impossible to uprgrade. Until we get a fix, we do a workaround here
            // to still allow us to rename the field and keyword of this node without breaking existing code.
            #ifdef RAYTRACING_SHADER_GRAPH_DEFAULT
            #define RAYTRACING_SHADER_GRAPH_HIGH
            #endif
        
            #ifdef RAYTRACING_SHADER_GRAPH_RAYTRACED
            #define RAYTRACING_SHADER_GRAPH_LOW
            #endif
            // end
        
            #ifndef SHADER_UNLIT
            // We need isFrontFace when using double sided - it is not required for unlit as in case of unlit double sided only drive the cullmode
            // VARYINGS_NEED_CULLFACE can be define by VaryingsMeshToPS.FaceSign input if a IsFrontFace Node is included in the shader graph.
            #if defined(_DOUBLESIDED_ON) && !defined(VARYINGS_NEED_CULLFACE)
                #define VARYINGS_NEED_CULLFACE
            #endif
            #endif
        
            // Specific Material Define
        // Setup a define to say we are an unlit shader
        #define SHADER_UNLIT
        
        // Following Macro are only used by Unlit material
        #if defined(_ENABLE_SHADOW_MATTE) && (SHADERPASS == SHADERPASS_FORWARD_UNLIT || SHADERPASS == SHADERPASS_PATH_TRACING)
        #define LIGHTLOOP_DISABLE_TILE_AND_CLUSTER
        #define HAS_LIGHTLOOP
        #endif
            // Caution: we can use the define SHADER_UNLIT onlit after the above Material include as it is the Unlit template who define it
        
            // To handle SSR on transparent correctly with a possibility to enable/disable it per framesettings
            // we should have a code like this:
            // if !defined(_DISABLE_SSR_TRANSPARENT)
            // pragma multi_compile _ WRITE_NORMAL_BUFFER
            // endif
            // i.e we enable the multicompile only if we can receive SSR or not, and then C# code drive
            // it based on if SSR transparent in frame settings and not (and stripper can strip it).
            // this is currently not possible with our current preprocessor as _DISABLE_SSR_TRANSPARENT is a keyword not a define
            // so instead we used this and chose to pay the extra cost of normal write even if SSR transaprent is disabled.
            // Ideally the shader graph generator should handle it but condition below can't be handle correctly for now.
            #if SHADERPASS == SHADERPASS_TRANSPARENT_DEPTH_PREPASS
            #if !defined(_DISABLE_SSR_TRANSPARENT) && !defined(SHADER_UNLIT)
                #define WRITE_NORMAL_BUFFER
            #endif
            #endif
        
            #ifndef DEBUG_DISPLAY
                // In case of opaque we don't want to perform the alpha test, it is done in depth prepass and we use depth equal for ztest (setup from UI)
                // Don't do it with debug display mode as it is possible there is no depth prepass in this case
                #if !defined(_SURFACE_TYPE_TRANSPARENT)
                    #if SHADERPASS == SHADERPASS_FORWARD
                    #define SHADERPASS_FORWARD_BYPASS_ALPHA_TEST
                    #elif SHADERPASS == SHADERPASS_GBUFFER
                    #define SHADERPASS_GBUFFER_BYPASS_ALPHA_TEST
                    #endif
                #endif
            #endif
        
            // Define _DEFERRED_CAPABLE_MATERIAL for shader capable to run in deferred pass
            #if defined(SHADER_LIT) && !defined(_SURFACE_TYPE_TRANSPARENT)
                #define _DEFERRED_CAPABLE_MATERIAL
            #endif
        
            // Translate transparent motion vector define
            #if defined(_TRANSPARENT_WRITES_MOTION_VEC) && defined(_SURFACE_TYPE_TRANSPARENT)
                #define _WRITE_TRANSPARENT_MOTION_VECTOR
            #endif
        
            // -- Graph Properties
            CBUFFER_START(UnityPerMaterial)
        float4 _Rotate_Projection;
        float _Noise_Scale;
        float _Speed;
        float _Vertexoffset;
        float4 _Remap_xy_zw;
        float4 _Color_Peak;
        float4 _Color_Valley;
        float _SmoothEdge1;
        float _SmoothEdge2;
        float _Cloud_Pow;
        float _Base_Scale;
        float _Base_Speed;
        float _BaseStrength;
        float _Emission_Strength;
        float _Curvate_Radius;
        float _Fresnel_Power;
        float _Fresnel_Opacity;
        float _Depth_Fade;
        float4 _EmissionColor;
        float _UseShadowThreshold;
        float4 _DoubleSidedConstants;
        float _BlendMode;
        float _EnableBlendModePreserveSpecularLighting;
        CBUFFER_END
        
        // Object and Global properties
        
            // -- Property used by ScenePickingPass
            #ifdef SCENEPICKINGPASS
            float4 _SelectionID;
            #endif
        
            // -- Properties used by SceneSelectionPass
            #ifdef SCENESELECTIONPASS
            int _ObjectId;
            int _PassValue;
            #endif
        
            // Includes
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/Raytracing/Shaders/RaytracingMacros.hlsl"
        #include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/Raytracing/Shaders/ShaderVariablesRaytracing.hlsl"
        #include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Material.hlsl"
        #include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/Raytracing/Shaders/ShaderVariablesRaytracingLightLoop.hlsl"
        #include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/Raytracing/Shaders/RaytracingIntersection.hlsl"
        #include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Unlit/Unlit.hlsl"
        #include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/BuiltinUtilities.hlsl"
        #include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/MaterialUtilities.hlsl"
        #include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/Raytracing/Shaders/RayTracingCommon.hlsl"
        #include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderGraphFunctions.hlsl"
        	// GraphIncludes: <None>
        
            // --------------------------------------------------
            // Structs and Packing
        
            struct SurfaceDescriptionInputs
        {
             float3 WorldSpaceNormal;
             float3 WorldSpaceViewDirection;
             float3 ObjectSpacePosition;
             float3 WorldSpacePosition;
             float4 ScreenPosition;
             float3 TimeParameters;
        };
        
            //Interpolator Packs: <None>
        
            // --------------------------------------------------
            // Graph
        
        
            // Graph Functions
            
        void Unity_Rotate_About_Axis_Radians_float(float3 In, float3 Axis, float Rotation, out float3 Out)
        {
            float s = sin(Rotation);
            float c = cos(Rotation);
            float one_minus_c = 1.0 - c;
        
            Axis = normalize(Axis);
        
            float3x3 rot_mat = { one_minus_c * Axis.x * Axis.x + c,            one_minus_c * Axis.x * Axis.y - Axis.z * s,     one_minus_c * Axis.z * Axis.x + Axis.y * s,
                                      one_minus_c * Axis.x * Axis.y + Axis.z * s,   one_minus_c * Axis.y * Axis.y + c,              one_minus_c * Axis.y * Axis.z - Axis.x * s,
                                      one_minus_c * Axis.z * Axis.x - Axis.y * s,   one_minus_c * Axis.y * Axis.z + Axis.x * s,     one_minus_c * Axis.z * Axis.z + c
                                    };
        
            Out = mul(rot_mat,  In);
        }
        
        void Unity_Multiply_float_float(float A, float B, out float Out)
        {
            Out = A * B;
        }
        
        void Unity_TilingAndOffset_float(float2 UV, float2 Tiling, float2 Offset, out float2 Out)
        {
            Out = UV * Tiling + Offset;
        }
        
        
        float2 Unity_GradientNoise_Dir_float(float2 p)
        {
            // Permutation and hashing used in webgl-nosie goo.gl/pX7HtC
            p = p % 289;
            // need full precision, otherwise half overflows when p > 1
            float x = float(34 * p.x + 1) * p.x % 289 + p.y;
            x = (34 * x + 1) * x % 289;
            x = frac(x / 41) * 2 - 1;
            return normalize(float2(x - floor(x + 0.5), abs(x) - 0.5));
        }
        
        void Unity_GradientNoise_float(float2 UV, float Scale, out float Out)
        {
            float2 p = UV * Scale;
            float2 ip = floor(p);
            float2 fp = frac(p);
            float d00 = dot(Unity_GradientNoise_Dir_float(ip), fp);
            float d01 = dot(Unity_GradientNoise_Dir_float(ip + float2(0, 1)), fp - float2(0, 1));
            float d10 = dot(Unity_GradientNoise_Dir_float(ip + float2(1, 0)), fp - float2(1, 0));
            float d11 = dot(Unity_GradientNoise_Dir_float(ip + float2(1, 1)), fp - float2(1, 1));
            fp = fp * fp * fp * (fp * (fp * 6 - 15) + 10);
            Out = lerp(lerp(d00, d01, fp.y), lerp(d10, d11, fp.y), fp.x) + 0.5;
        }
        
        void Unity_Add_float(float A, float B, out float Out)
        {
            Out = A + B;
        }
        
        void Unity_Divide_float(float A, float B, out float Out)
        {
            Out = A / B;
        }
        
        void Unity_Saturate_float(float In, out float Out)
        {
            Out = saturate(In);
        }
        
        void Unity_Power_float(float A, float B, out float Out)
        {
            Out = pow(A, B);
        }
        
        void Unity_Combine_float(float R, float G, float B, float A, out float4 RGBA, out float3 RGB, out float2 RG)
        {
            RGBA = float4(R, G, B, A);
            RGB = float3(R, G, B);
            RG = float2(R, G);
        }
        
        void Unity_Remap_float(float In, float2 InMinMax, float2 OutMinMax, out float Out)
        {
            Out = OutMinMax.x + (In - InMinMax.x) * (OutMinMax.y - OutMinMax.x) / (InMinMax.y - InMinMax.x);
        }
        
        void Unity_Absolute_float(float In, out float Out)
        {
            Out = abs(In);
        }
        
        void Unity_Smoothstep_float(float Edge1, float Edge2, float In, out float Out)
        {
            Out = smoothstep(Edge1, Edge2, In);
        }
        
        void Unity_FresnelEffect_float(float3 Normal, float3 ViewDir, float Power, out float Out)
        {
            Out = pow((1.0 - saturate(dot(normalize(Normal), normalize(ViewDir)))), Power);
        }
        
        void Unity_Lerp_float4(float4 A, float4 B, float4 T, out float4 Out)
        {
            Out = lerp(A, B, T);
        }
        
        void Unity_Add_float4(float4 A, float4 B, out float4 Out)
        {
            Out = A + B;
        }
        
        void Unity_Multiply_float4_float4(float4 A, float4 B, out float4 Out)
        {
            Out = A * B;
        }
        
        void Unity_SceneDepth_Eye_float(float4 UV, out float Out)
        {
            if (unity_OrthoParams.w == 1.0)
            {
                Out = LinearEyeDepth(ComputeWorldSpacePosition(UV.xy, SHADERGRAPH_SAMPLE_SCENE_DEPTH(UV.xy), UNITY_MATRIX_I_VP), UNITY_MATRIX_V);
            }
            else
            {
                Out = LinearEyeDepth(SHADERGRAPH_SAMPLE_SCENE_DEPTH(UV.xy), _ZBufferParams);
            }
        }
        
        void Unity_Subtract_float(float A, float B, out float Out)
        {
            Out = A - B;
        }
        
            // Graph Vertex
            // GraphVertex: <None>
        
            // Graph Pixel
            struct SurfaceDescription
        {
            float3 BaseColor;
            float3 Emission;
            float Alpha;
        };
        
        SurfaceDescription SurfaceDescriptionFunction(SurfaceDescriptionInputs IN)
        {
            SurfaceDescription surface = (SurfaceDescription)0;
            float _Property_7d8e49b5efe94dea8210c34a6319b1ef_Out_0 = _SmoothEdge1;
            float _Property_09307b889e8945078bacabda50cca5c6_Out_0 = _SmoothEdge2;
            float4 _Property_a8d53d7ea07349e0979b956475bdd7cc_Out_0 = _Rotate_Projection;
            float _Split_7d12b2bb5feb46d685603473d0cf5818_R_1 = _Property_a8d53d7ea07349e0979b956475bdd7cc_Out_0[0];
            float _Split_7d12b2bb5feb46d685603473d0cf5818_G_2 = _Property_a8d53d7ea07349e0979b956475bdd7cc_Out_0[1];
            float _Split_7d12b2bb5feb46d685603473d0cf5818_B_3 = _Property_a8d53d7ea07349e0979b956475bdd7cc_Out_0[2];
            float _Split_7d12b2bb5feb46d685603473d0cf5818_A_4 = _Property_a8d53d7ea07349e0979b956475bdd7cc_Out_0[3];
            float3 _RotateAboutAxis_1b91481bceed4e9a82a13975af123b02_Out_3;
            Unity_Rotate_About_Axis_Radians_float(IN.ObjectSpacePosition, (_Property_a8d53d7ea07349e0979b956475bdd7cc_Out_0.xyz), _Split_7d12b2bb5feb46d685603473d0cf5818_A_4, _RotateAboutAxis_1b91481bceed4e9a82a13975af123b02_Out_3);
            float _Property_258f4645340c46f69274c9f077f1a73c_Out_0 = _Speed;
            float _Multiply_94f6d857831c4e69b53b9bfc92dd852f_Out_2;
            Unity_Multiply_float_float(IN.TimeParameters.x, _Property_258f4645340c46f69274c9f077f1a73c_Out_0, _Multiply_94f6d857831c4e69b53b9bfc92dd852f_Out_2);
            float2 _TilingAndOffset_6cb9fd57231c4a429c9c0fe5aeb7cc58_Out_3;
            Unity_TilingAndOffset_float((_RotateAboutAxis_1b91481bceed4e9a82a13975af123b02_Out_3.xy), float2 (1, 1), (_Multiply_94f6d857831c4e69b53b9bfc92dd852f_Out_2.xx), _TilingAndOffset_6cb9fd57231c4a429c9c0fe5aeb7cc58_Out_3);
            float _Property_2b9001a870d04f8eb60f5d7e1ce909c5_Out_0 = _Noise_Scale;
            float _GradientNoise_061679506b214bb8b4792ec4dfe82ec6_Out_2;
            Unity_GradientNoise_float(_TilingAndOffset_6cb9fd57231c4a429c9c0fe5aeb7cc58_Out_3, _Property_2b9001a870d04f8eb60f5d7e1ce909c5_Out_0, _GradientNoise_061679506b214bb8b4792ec4dfe82ec6_Out_2);
            float2 _TilingAndOffset_1d2491b5855e49d3b2e6b5dbe5db07d4_Out_3;
            Unity_TilingAndOffset_float((_RotateAboutAxis_1b91481bceed4e9a82a13975af123b02_Out_3.xy), float2 (1, 1), float2 (0, 0), _TilingAndOffset_1d2491b5855e49d3b2e6b5dbe5db07d4_Out_3);
            float _GradientNoise_8a27c3fb323f4db1b38f287380605198_Out_2;
            Unity_GradientNoise_float(_TilingAndOffset_1d2491b5855e49d3b2e6b5dbe5db07d4_Out_3, _Property_2b9001a870d04f8eb60f5d7e1ce909c5_Out_0, _GradientNoise_8a27c3fb323f4db1b38f287380605198_Out_2);
            float _Add_a6dd2d6e3f564decbca34ec03a419130_Out_2;
            Unity_Add_float(_GradientNoise_061679506b214bb8b4792ec4dfe82ec6_Out_2, _GradientNoise_8a27c3fb323f4db1b38f287380605198_Out_2, _Add_a6dd2d6e3f564decbca34ec03a419130_Out_2);
            float _Divide_a757ea7167f343ecaec30e69b58c9bae_Out_2;
            Unity_Divide_float(_Add_a6dd2d6e3f564decbca34ec03a419130_Out_2, 2, _Divide_a757ea7167f343ecaec30e69b58c9bae_Out_2);
            float _Saturate_f355ba5a467f4488b7ec89e8a08484a3_Out_1;
            Unity_Saturate_float(_Divide_a757ea7167f343ecaec30e69b58c9bae_Out_2, _Saturate_f355ba5a467f4488b7ec89e8a08484a3_Out_1);
            float _Property_96da655cc17e4594836aa02d74efe33c_Out_0 = _Cloud_Pow;
            float _Power_318bede735044ec6811f2a5c345b7d73_Out_2;
            Unity_Power_float(_Saturate_f355ba5a467f4488b7ec89e8a08484a3_Out_1, _Property_96da655cc17e4594836aa02d74efe33c_Out_0, _Power_318bede735044ec6811f2a5c345b7d73_Out_2);
            float4 _Property_317e8becc0724841a13cbcf8d4c4efbc_Out_0 = _Remap_xy_zw;
            float _Split_3dee68ff9a374966b7612da59c6ac20a_R_1 = _Property_317e8becc0724841a13cbcf8d4c4efbc_Out_0[0];
            float _Split_3dee68ff9a374966b7612da59c6ac20a_G_2 = _Property_317e8becc0724841a13cbcf8d4c4efbc_Out_0[1];
            float _Split_3dee68ff9a374966b7612da59c6ac20a_B_3 = _Property_317e8becc0724841a13cbcf8d4c4efbc_Out_0[2];
            float _Split_3dee68ff9a374966b7612da59c6ac20a_A_4 = _Property_317e8becc0724841a13cbcf8d4c4efbc_Out_0[3];
            float4 _Combine_4e3ec9a6e4064091bba919631e732b7a_RGBA_4;
            float3 _Combine_4e3ec9a6e4064091bba919631e732b7a_RGB_5;
            float2 _Combine_4e3ec9a6e4064091bba919631e732b7a_RG_6;
            Unity_Combine_float(_Split_3dee68ff9a374966b7612da59c6ac20a_R_1, _Split_3dee68ff9a374966b7612da59c6ac20a_G_2, 0, 0, _Combine_4e3ec9a6e4064091bba919631e732b7a_RGBA_4, _Combine_4e3ec9a6e4064091bba919631e732b7a_RGB_5, _Combine_4e3ec9a6e4064091bba919631e732b7a_RG_6);
            float4 _Combine_6f976751f1234c77908b163e59da18bb_RGBA_4;
            float3 _Combine_6f976751f1234c77908b163e59da18bb_RGB_5;
            float2 _Combine_6f976751f1234c77908b163e59da18bb_RG_6;
            Unity_Combine_float(_Split_3dee68ff9a374966b7612da59c6ac20a_B_3, _Split_3dee68ff9a374966b7612da59c6ac20a_A_4, 0, 0, _Combine_6f976751f1234c77908b163e59da18bb_RGBA_4, _Combine_6f976751f1234c77908b163e59da18bb_RGB_5, _Combine_6f976751f1234c77908b163e59da18bb_RG_6);
            float _Remap_a11bf825d8d54f198c2355e6d3cc1fba_Out_3;
            Unity_Remap_float(_Power_318bede735044ec6811f2a5c345b7d73_Out_2, _Combine_4e3ec9a6e4064091bba919631e732b7a_RG_6, _Combine_6f976751f1234c77908b163e59da18bb_RG_6, _Remap_a11bf825d8d54f198c2355e6d3cc1fba_Out_3);
            float _Absolute_553a57701af34a45a18ca7b2af677c8a_Out_1;
            Unity_Absolute_float(_Remap_a11bf825d8d54f198c2355e6d3cc1fba_Out_3, _Absolute_553a57701af34a45a18ca7b2af677c8a_Out_1);
            float _Smoothstep_6babd4aa745b40db842b941b96adf7e9_Out_3;
            Unity_Smoothstep_float(_Property_7d8e49b5efe94dea8210c34a6319b1ef_Out_0, _Property_09307b889e8945078bacabda50cca5c6_Out_0, _Absolute_553a57701af34a45a18ca7b2af677c8a_Out_1, _Smoothstep_6babd4aa745b40db842b941b96adf7e9_Out_3);
            float _Property_17631cb6b51c44b593b4fb1f0ac8fa75_Out_0 = _Base_Speed;
            float _Multiply_2e98faddc46143bea8e48ab17d0e1c15_Out_2;
            Unity_Multiply_float_float(IN.TimeParameters.x, _Property_17631cb6b51c44b593b4fb1f0ac8fa75_Out_0, _Multiply_2e98faddc46143bea8e48ab17d0e1c15_Out_2);
            float2 _TilingAndOffset_d8c83d87b12649f7b6a3902973c4457a_Out_3;
            Unity_TilingAndOffset_float((_RotateAboutAxis_1b91481bceed4e9a82a13975af123b02_Out_3.xy), float2 (1, 1), (_Multiply_2e98faddc46143bea8e48ab17d0e1c15_Out_2.xx), _TilingAndOffset_d8c83d87b12649f7b6a3902973c4457a_Out_3);
            float _Property_2792df33a4d44e20b2f71fe244d5f369_Out_0 = _Base_Scale;
            float _GradientNoise_702d412fe90e4c64b91e9defbe1ffff2_Out_2;
            Unity_GradientNoise_float(_TilingAndOffset_d8c83d87b12649f7b6a3902973c4457a_Out_3, _Property_2792df33a4d44e20b2f71fe244d5f369_Out_0, _GradientNoise_702d412fe90e4c64b91e9defbe1ffff2_Out_2);
            float _Property_a965b78b3be84255ae4ff1617bd2df01_Out_0 = _BaseStrength;
            float _Multiply_9880df30952a454781c1f0c8356100dd_Out_2;
            Unity_Multiply_float_float(_GradientNoise_702d412fe90e4c64b91e9defbe1ffff2_Out_2, _Property_a965b78b3be84255ae4ff1617bd2df01_Out_0, _Multiply_9880df30952a454781c1f0c8356100dd_Out_2);
            float _Add_98d9cdbb65e44e0282692d35bd9d237b_Out_2;
            Unity_Add_float(_Smoothstep_6babd4aa745b40db842b941b96adf7e9_Out_3, _Multiply_9880df30952a454781c1f0c8356100dd_Out_2, _Add_98d9cdbb65e44e0282692d35bd9d237b_Out_2);
            float _Add_d305fd085a9b459da3d4bd5108430b3f_Out_2;
            Unity_Add_float(1, _Property_a965b78b3be84255ae4ff1617bd2df01_Out_0, _Add_d305fd085a9b459da3d4bd5108430b3f_Out_2);
            float _Divide_55db7b7a0b8b481d83fb512a13a2dba6_Out_2;
            Unity_Divide_float(_Add_98d9cdbb65e44e0282692d35bd9d237b_Out_2, _Add_d305fd085a9b459da3d4bd5108430b3f_Out_2, _Divide_55db7b7a0b8b481d83fb512a13a2dba6_Out_2);
            float _Property_5a371e38a60143fcae81da7313c1bf15_Out_0 = _Fresnel_Power;
            float _FresnelEffect_4c470240dea248acb0092676d71437cb_Out_3;
            Unity_FresnelEffect_float(IN.WorldSpaceNormal, IN.WorldSpaceViewDirection, _Property_5a371e38a60143fcae81da7313c1bf15_Out_0, _FresnelEffect_4c470240dea248acb0092676d71437cb_Out_3);
            float _Multiply_384d15a2ef094b7e8b1ec6d69dada246_Out_2;
            Unity_Multiply_float_float(_Divide_55db7b7a0b8b481d83fb512a13a2dba6_Out_2, _FresnelEffect_4c470240dea248acb0092676d71437cb_Out_3, _Multiply_384d15a2ef094b7e8b1ec6d69dada246_Out_2);
            float _Property_3c23366c651c4949b03cb10c14ae0a27_Out_0 = _Fresnel_Opacity;
            float _Multiply_9380e32f6e4644e1b42e398229c18d31_Out_2;
            Unity_Multiply_float_float(_Multiply_384d15a2ef094b7e8b1ec6d69dada246_Out_2, _Property_3c23366c651c4949b03cb10c14ae0a27_Out_0, _Multiply_9380e32f6e4644e1b42e398229c18d31_Out_2);
            float4 _Property_dff39e3157cb4a09aac968677ade995d_Out_0 = _Color_Valley;
            float4 _Property_1b300af9e23e428fa893e55f9390600d_Out_0 = _Color_Peak;
            float4 _Lerp_6d0a20bb25554e1fa8697f473485e856_Out_3;
            Unity_Lerp_float4(_Property_dff39e3157cb4a09aac968677ade995d_Out_0, _Property_1b300af9e23e428fa893e55f9390600d_Out_0, (_Add_98d9cdbb65e44e0282692d35bd9d237b_Out_2.xxxx), _Lerp_6d0a20bb25554e1fa8697f473485e856_Out_3);
            float4 _Add_6507a6920d9c478888f235ad9d0bb542_Out_2;
            Unity_Add_float4((_Multiply_9380e32f6e4644e1b42e398229c18d31_Out_2.xxxx), _Lerp_6d0a20bb25554e1fa8697f473485e856_Out_3, _Add_6507a6920d9c478888f235ad9d0bb542_Out_2);
            float _Property_9cf7107417e042afb41766bb37be827b_Out_0 = _Emission_Strength;
            float4 _Multiply_31ae534c0cc640be9fda8de7cc705bbf_Out_2;
            Unity_Multiply_float4_float4(_Add_6507a6920d9c478888f235ad9d0bb542_Out_2, (_Property_9cf7107417e042afb41766bb37be827b_Out_0.xxxx), _Multiply_31ae534c0cc640be9fda8de7cc705bbf_Out_2);
            float _SceneDepth_619a7e0097894c29ba4557fde6cbb174_Out_1;
            Unity_SceneDepth_Eye_float(float4(IN.ScreenPosition.xy / IN.ScreenPosition.w, 0, 0), _SceneDepth_619a7e0097894c29ba4557fde6cbb174_Out_1);
            float4 _ScreenPosition_ee728e739f744068b0d15c1205d618a0_Out_0 = IN.ScreenPosition;
            float _Split_d5d8a30c527c46a19ab94602c057016e_R_1 = _ScreenPosition_ee728e739f744068b0d15c1205d618a0_Out_0[0];
            float _Split_d5d8a30c527c46a19ab94602c057016e_G_2 = _ScreenPosition_ee728e739f744068b0d15c1205d618a0_Out_0[1];
            float _Split_d5d8a30c527c46a19ab94602c057016e_B_3 = _ScreenPosition_ee728e739f744068b0d15c1205d618a0_Out_0[2];
            float _Split_d5d8a30c527c46a19ab94602c057016e_A_4 = _ScreenPosition_ee728e739f744068b0d15c1205d618a0_Out_0[3];
            float _Subtract_07eb78fa00d74ade84172a64a4a4616c_Out_2;
            Unity_Subtract_float(_Split_d5d8a30c527c46a19ab94602c057016e_A_4, 1, _Subtract_07eb78fa00d74ade84172a64a4a4616c_Out_2);
            float _Subtract_3ef0962257844c2c87b9ff8d165099f3_Out_2;
            Unity_Subtract_float(_SceneDepth_619a7e0097894c29ba4557fde6cbb174_Out_1, _Subtract_07eb78fa00d74ade84172a64a4a4616c_Out_2, _Subtract_3ef0962257844c2c87b9ff8d165099f3_Out_2);
            float _Property_9167e3d66076450baeb620b8f8b66552_Out_0 = _Depth_Fade;
            float _Divide_9a1ae8922923443883cbd9e71941de32_Out_2;
            Unity_Divide_float(_Subtract_3ef0962257844c2c87b9ff8d165099f3_Out_2, _Property_9167e3d66076450baeb620b8f8b66552_Out_0, _Divide_9a1ae8922923443883cbd9e71941de32_Out_2);
            float _Saturate_791ce4d2963e420ba68a97fca0bef8f9_Out_1;
            Unity_Saturate_float(_Divide_9a1ae8922923443883cbd9e71941de32_Out_2, _Saturate_791ce4d2963e420ba68a97fca0bef8f9_Out_1);
            surface.BaseColor = (_Add_6507a6920d9c478888f235ad9d0bb542_Out_2.xyz);
            surface.Emission = (_Multiply_31ae534c0cc640be9fda8de7cc705bbf_Out_2.xyz);
            surface.Alpha = _Saturate_791ce4d2963e420ba68a97fca0bef8f9_Out_1;
            return surface;
        }
        
            // --------------------------------------------------
            // Build Graph Inputs
            #ifdef HAVE_VFX_MODIFICATION
            #define VFX_SRP_ATTRIBUTES AttributesMesh
            #define VaryingsMeshType VaryingsMeshToPS
            #define VFX_SRP_VARYINGS VaryingsMeshType
            #define VFX_SRP_SURFACE_INPUTS FragInputs
            #endif
            SurfaceDescriptionInputs FragInputsToSurfaceDescriptionInputs(FragInputs input, float3 viewWS)
        {
            SurfaceDescriptionInputs output;
            ZERO_INITIALIZE(SurfaceDescriptionInputs, output);
        
            output.WorldSpaceNormal =                           normalize(input.tangentToWorld[2].xyz);
            #if defined(SHADER_STAGE_RAY_TRACING)
            #else
            #endif
            output.WorldSpaceViewDirection =                    normalize(viewWS);
            output.WorldSpacePosition =                         input.positionRWS;
            output.ObjectSpacePosition =                        TransformWorldToObject(input.positionRWS);
            output.ScreenPosition =                             ComputeScreenPos(TransformWorldToHClip(input.positionRWS), _ProjectionParams.x);
            output.TimeParameters =                             _TimeParameters.xyz; // This is mainly for LW as HD overwrite this value
        
            // splice point to copy frag inputs custom interpolator pack into the SDI
            /* WARNING: $splice Could not find named fragment 'CustomInterpolatorCopyToSDI' */
        
            return output;
        }
        
            // --------------------------------------------------
            // Build Surface Data (Specific Material)
        
        void BuildSurfaceData(FragInputs fragInputs, inout SurfaceDescription surfaceDescription, float3 V, PositionInputs posInput, out SurfaceData surfaceData)
        {
            // setup defaults -- these are used if the graph doesn't output a value
            ZERO_INITIALIZE(SurfaceData, surfaceData);
        
            // copy across graph values, if defined
            surfaceData.color = surfaceDescription.BaseColor;
        
            #ifdef WRITE_NORMAL_BUFFER
            // When we need to export the normal (in the depth prepass, we write the geometry one)
            surfaceData.normalWS = fragInputs.tangentToWorld[2];
            #endif
        
            #if defined(DEBUG_DISPLAY)
            if (_DebugMipMapMode != DEBUGMIPMAPMODE_NONE)
            {
                // TODO
            }
            #endif
        
            #ifdef _ENABLE_SHADOW_MATTE
        
                #if (SHADERPASS == SHADERPASS_FORWARD_UNLIT) || (SHADERPASS == SHADERPASS_RAYTRACING_GBUFFER) || (SHADERPASS == SHADERPASS_RAYTRACING_INDIRECT) || (SHADERPASS == SHADERPASS_RAYTRACING_FORWARD)
        
                    HDShadowContext shadowContext = InitShadowContext();
        
                    // Evaluate the shadow, the normal is guaranteed if shadow matte is enabled on this shader.
                    float3 shadow3;
                    ShadowLoopMin(shadowContext, posInput, normalize(fragInputs.tangentToWorld[2]), asuint(_ShadowMatteFilter), GetMeshRenderingLightLayer(), shadow3);
        
                    // Compute the average value in the fourth channel
                    float4 shadow = float4(shadow3, dot(shadow3, float3(1.0/3.0, 1.0/3.0, 1.0/3.0)));
        
                    float4 shadowColor = (1.0 - shadow) * surfaceDescription.ShadowTint.rgba;
                    float  localAlpha  = saturate(shadowColor.a + surfaceDescription.Alpha);
        
                    // Keep the nested lerp
                    // With no Color (bsdfData.color.rgb, bsdfData.color.a == 0.0f), just use ShadowColor*Color to avoid a ring of "white" around the shadow
                    // And mix color to consider the Color & ShadowColor alpha (from texture or/and color picker)
                    #ifdef _SURFACE_TYPE_TRANSPARENT
                        surfaceData.color = lerp(shadowColor.rgb * surfaceData.color, lerp(lerp(shadowColor.rgb, surfaceData.color, 1.0 - surfaceDescription.ShadowTint.a), surfaceData.color, shadow.rgb), surfaceDescription.Alpha);
                    #else
                        surfaceData.color = lerp(lerp(shadowColor.rgb, surfaceData.color, 1.0 - surfaceDescription.ShadowTint.a), surfaceData.color, shadow.rgb);
                    #endif
                    localAlpha = ApplyBlendMode(surfaceData.color, localAlpha).a;
        
                    surfaceDescription.Alpha = localAlpha;
        
                #elif SHADERPASS == SHADERPASS_PATH_TRACING
        
                    surfaceData.normalWS = fragInputs.tangentToWorld[2];
                    surfaceData.shadowTint = surfaceDescription.ShadowTint.rgba;
        
                #endif
        
            #endif // _ENABLE_SHADOW_MATTE
        }
        
            // --------------------------------------------------
            // Get Surface And BuiltinData
        
            void GetSurfaceAndBuiltinData(FragInputs fragInputs, float3 V, inout PositionInputs posInput, out SurfaceData surfaceData, out BuiltinData builtinData RAY_TRACING_OPTIONAL_PARAMETERS)
            {
                // Don't dither if displaced tessellation (we're fading out the displacement instead to match the next LOD)
                #if !defined(SHADER_STAGE_RAY_TRACING) && !defined(_TESSELLATION_DISPLACEMENT)
                #ifdef LOD_FADE_CROSSFADE // enable dithering LOD transition if user select CrossFade transition in LOD group
                LODDitheringTransition(ComputeFadeMaskSeed(V, posInput.positionSS), unity_LODFade.x);
                #endif
                #endif
        
                #ifndef SHADER_UNLIT
                #ifdef _DOUBLESIDED_ON
                    float3 doubleSidedConstants = _DoubleSidedConstants.xyz;
                #else
                    float3 doubleSidedConstants = float3(1.0, 1.0, 1.0);
                #endif
        
                ApplyDoubleSidedFlipOrMirror(fragInputs, doubleSidedConstants); // Apply double sided flip on the vertex normal
                #endif // SHADER_UNLIT
        
                SurfaceDescriptionInputs surfaceDescriptionInputs = FragInputsToSurfaceDescriptionInputs(fragInputs, V);
        
                #if defined(HAVE_VFX_MODIFICATION)
                GraphProperties properties;
                ZERO_INITIALIZE(GraphProperties, properties);
        
                GetElementPixelProperties(fragInputs, properties);
        
                SurfaceDescription surfaceDescription = SurfaceDescriptionFunction(surfaceDescriptionInputs, properties);
                #else
                SurfaceDescription surfaceDescription = SurfaceDescriptionFunction(surfaceDescriptionInputs);
                #endif
        
                // Perform alpha test very early to save performance (a killed pixel will not sample textures)
                // TODO: split graph evaluation to grab just alpha dependencies first? tricky..
                #ifdef _ALPHATEST_ON
                    float alphaCutoff = surfaceDescription.AlphaClipThreshold;
                    #if SHADERPASS == SHADERPASS_TRANSPARENT_DEPTH_PREPASS
                    // The TransparentDepthPrepass is also used with SSR transparent.
                    // If an artists enable transaprent SSR but not the TransparentDepthPrepass itself, then we use AlphaClipThreshold
                    // otherwise if TransparentDepthPrepass is enabled we use AlphaClipThresholdDepthPrepass
                    #elif SHADERPASS == SHADERPASS_TRANSPARENT_DEPTH_POSTPASS
                    // DepthPostpass always use its own alpha threshold
                    alphaCutoff = surfaceDescription.AlphaClipThresholdDepthPostpass;
                    #elif (SHADERPASS == SHADERPASS_SHADOWS) || (SHADERPASS == SHADERPASS_RAYTRACING_VISIBILITY)
                    // If use shadow threshold isn't enable we don't allow any test
                    #endif
        
                    GENERIC_ALPHA_TEST(surfaceDescription.Alpha, alphaCutoff);
                #endif
        
                #if !defined(SHADER_STAGE_RAY_TRACING) && _DEPTHOFFSET_ON
                ApplyDepthOffsetPositionInput(V, surfaceDescription.DepthOffset, GetViewForwardDir(), GetWorldToHClipMatrix(), posInput);
                #endif
        
                #ifndef SHADER_UNLIT
                float3 bentNormalWS;
                BuildSurfaceData(fragInputs, surfaceDescription, V, posInput, surfaceData, bentNormalWS);
        
                #ifdef FRAG_INPUTS_USE_TEXCOORD1
                    float4 lightmapTexCoord1 = fragInputs.texCoord1;
                #else
                    float4 lightmapTexCoord1 = float4(0,0,0,0);
                #endif
        
                #ifdef FRAG_INPUTS_USE_TEXCOORD2
                    float4 lightmapTexCoord2 = fragInputs.texCoord2;
                #else
                    float4 lightmapTexCoord2 = float4(0,0,0,0);
                #endif
        
                // Builtin Data
                // For back lighting we use the oposite vertex normal
                InitBuiltinData(posInput, surfaceDescription.Alpha, bentNormalWS, -fragInputs.tangentToWorld[2], lightmapTexCoord1, lightmapTexCoord2, builtinData);
        
                #else
                BuildSurfaceData(fragInputs, surfaceDescription, V, posInput, surfaceData);
        
                ZERO_BUILTIN_INITIALIZE(builtinData); // No call to InitBuiltinData as we don't have any lighting
                builtinData.opacity = surfaceDescription.Alpha;
        
                #if defined(DEBUG_DISPLAY)
                    // Light Layers are currently not used for the Unlit shader (because it is not lit)
                    // But Unlit objects do cast shadows according to their rendering layer mask, which is what we want to
                    // display in the light layers visualization mode, therefore we need the renderingLayers
                    builtinData.renderingLayers = GetMeshRenderingLightLayer();
                #endif
        
                #endif // SHADER_UNLIT
        
                #ifdef _ALPHATEST_ON
                    // Used for sharpening by alpha to mask - Alpha to covertage is only used with depth only and forward pass (no shadow pass, no transparent pass)
                    builtinData.alphaClipTreshold = alphaCutoff;
                #endif
        
                // override sampleBakedGI - not used by Unlit
        
                builtinData.emissiveColor = surfaceDescription.Emission;
        
                // Note this will not fully work on transparent surfaces (can check with _SURFACE_TYPE_TRANSPARENT define)
                // We will always overwrite vt feeback with the nearest. So behind transparent surfaces vt will not be resolved
                // This is a limitation of the current MRT approach.
                #ifdef UNITY_VIRTUAL_TEXTURING
                #endif
        
                #if _DEPTHOFFSET_ON
                builtinData.depthOffset = surfaceDescription.DepthOffset;
                #endif
        
                // TODO: We should generate distortion / distortionBlur for non distortion pass
                #if (SHADERPASS == SHADERPASS_DISTORTION)
                builtinData.distortion = surfaceDescription.Distortion;
                builtinData.distortionBlur = surfaceDescription.DistortionBlur;
                #endif
        
                #ifndef SHADER_UNLIT
                // PostInitBuiltinData call ApplyDebugToBuiltinData
                PostInitBuiltinData(V, posInput, surfaceData, builtinData);
                #else
                ApplyDebugToBuiltinData(builtinData);
                #endif
        
                RAY_TRACING_OPTIONAL_ALPHA_TEST_PASS
            }
        
            // --------------------------------------------------
            // Main
        
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/ShaderPass/ShaderPassPathTracing.hlsl"
        
            // --------------------------------------------------
            // Visual Effect Vertex Invocations
        
        	#ifdef HAVE_VFX_MODIFICATION
        	#include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/VisualEffectVertex.hlsl"
        	#endif
        
            ENDHLSL
        }
    }
    CustomEditorForRenderPipeline "Rendering.HighDefinition.HDUnlitGUI" "UnityEngine.Rendering.HighDefinition.HDRenderPipelineAsset"
    CustomEditor "UnityEditor.ShaderGraph.GenericShaderGraphMaterialGUI"
    FallBack "Hidden/Shader Graph/FallbackError"
}