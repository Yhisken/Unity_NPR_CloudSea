using UnityEngine;

public class RotateAroundObject : MonoBehaviour
{
    // 要围绕旋转的物体
    public Transform target;
    // 旋转速度
    public float rotationSpeed = 10f;
    // 距离目标物体的距离
    public float distance = 5f;

    void Update()
    {
        if (target != null)
        {
            // 计算旋转角度
            float angle = rotationSpeed * Time.deltaTime;

            // 围绕目标物体的世界坐标Y轴旋转
            transform.RotateAround(target.position, Vector3.up, angle);

            // 保持摄像机始终朝向目标物体
            transform.LookAt(target);

            // 计算摄像机与目标物体的新的位置
            Vector3 direction = (transform.position - target.position).normalized;
            transform.position = target.position + direction * distance;
        }
    }
}