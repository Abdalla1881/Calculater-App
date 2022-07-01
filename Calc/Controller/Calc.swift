import UIKit

class Calc: UIViewController
{

    var firstNumber : Float!
    var operation : Int!

   
    
    @IBOutlet weak var resultLBL: UILabel!
    override func viewDidLoad()
    {
        super.viewDidLoad()

    }
    //MARK: - IBAction
    
    @IBAction func bottonPressed(_ sender: UIButton)
    {
        let Tag = sender.tag
        removeZero()
        switch Tag
        {
        case 0...9:
            resultLBL.text = (resultLBL.text!) +  ("\(Tag)")
        case 10 :
            if resultLBL.text!.contains(".")
            {
                break;
            }
            resultLBL.text = (resultLBL.text!) +  (".")
        case 18 :
            clearResult()
        case 12...16 :
            firstNumber = Float(resultLBL.text!)!
            operation = Tag
            clearResult()
        case 11 :
            guard let FN = firstNumber else {return}
                     getResult(FN: FN , SN: Float (resultLBL.text!)! ,  Operation: operation)
        case 17 :
            if resultLBL.text!.contains("-")
            {
                resultLBL.text?.removeFirst()
            }
            else
            {
                if resultLBL.text != "0"
                {
                    resultLBL.text = "-\(resultLBL.text!)"
                }
            }
            
        default:
            break;
        }
    }
    //MARK: - Helper Func
    
    func clearResult()
    {
        resultLBL.text = "0"
    }
    func removeZero()
    {
        if resultLBL.text == "0"
        {
            resultLBL.text = ""
        }
    }
    func getResult(FN : Float , SN : Float , Operation : Int)
    {
        switch Operation
        {
        case 12:
            resultLBL.text = "\(FN + SN)"
        case 13:
            resultLBL.text = "\(FN - SN)"
        case 14:
            resultLBL.text = "\(FN * SN)"
        case 15:
            resultLBL.text = "\(FN / SN)"
        case 16:
            resultLBL.text = "\(Int(FN) % Int(SN))"
        default:
            break;
        }
        
    }


}

