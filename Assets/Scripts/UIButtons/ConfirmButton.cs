using UnityEngine;

public class ConfirmButton : MonoBehaviour
{
    private AudioManager audioManager;
    private void Awake()
    {
        audioManager = GameObject.Find("AudioManager").GetComponent<AudioManager>();
    }
    // Start is called once before the first execution of Update after the MonoBehaviour is created
    public void Confirm()
    {
        // Mortem[] mortems = FindObjectsByType(typeof(Mortem), FindObjectsSortMode.InstanceID) as Mortem[];
        // foreach (Mortem mortem in mortems)
        // {
        //     mortem.tick();
        // }
        audioManager.Play(audioManager.select);
        Employee[] employees = FindObjectsByType(typeof(Employee), FindObjectsSortMode.InstanceID) as Employee[];
        foreach (Employee employee in employees)
        {
            employee.SetMentHealth(-5);
        }
        GameManager.Instance.YEET();
        TrainingStation[] trainings = FindObjectsByType(typeof(TrainingStation), FindObjectsSortMode.InstanceID) as TrainingStation[];
        foreach (TrainingStation station in trainings)
        {
            station.tick();
        }
        HealthStation[] healths = FindObjectsByType(typeof(HealthStation), FindObjectsSortMode.InstanceID) as HealthStation[];
        foreach (HealthStation hstation in healths)
        {
            hstation.tick();
        }
        // ContainmentUnit[] units = FindObjectsByType(typeof(ContainmentUnit), FindObjectsSortMode.InstanceID) as ContainmentUnit[];
        // foreach (ContainmentUnit unit in units)
        // {
        //     unit.Activate();
        // }
        GameObject.Find("AssignmentSceneLoader").GetComponent<AssignmentSceneLoader>().Queue();
        GameManager.Instance.QueueContainment();
    }
}
