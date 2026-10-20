using UnityEngine;

public class ResetButton : MonoBehaviour
{
    public AudioManager audioManager;
    public void Reset()
    {
        audioManager.Play(audioManager.select);
        Mortem[] mortems = FindObjectsByType(typeof(Mortem), FindObjectsSortMode.InstanceID) as Mortem[];
        foreach (Mortem mortem in mortems)
        {
            mortem.Unassign();
        }
        Employee[] employees = FindObjectsByType(typeof(Employee), FindObjectsSortMode.InstanceID) as Employee[];
        foreach (Employee employee in employees)
        {
            employee.ResetSnap();
        }
        TrainingStation[] trainings = FindObjectsByType(typeof(TrainingStation), FindObjectsSortMode.InstanceID) as TrainingStation[];
        foreach (TrainingStation station in trainings)
        {
            station.Reset();
        }
        HealthStation[] healths = FindObjectsByType(typeof(HealthStation), FindObjectsSortMode.InstanceID) as HealthStation[];
        foreach (HealthStation hstation in healths)
        {
            hstation.Reset();
        }
    }
}
