import 'package:flutter/material.dart';

class FQS extends StatelessWidget {
  const FQS({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "FAQS",
          style: TextStyle(
              fontSize: 25, color: Colors.black, fontFamily: "JF-Flat"),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 1.0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
        ),
      ),
      body: ListView(
        children: [
          Column(
            children: const [
              SizedBox(
                height: 5,
              ),
              Card(
                child: ExpansionTile(
                  iconColor: Colors.black,
                  title: Text(
                    "Q1: What is a brain tumor?",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, fontFamily: "JF-Flat"),
                  ),
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "A brain tumor is a growth of abnormal cells that have formed in the brain. Some brain tumors are malignant (cancerous), while others are not (non-malignant, non-cancerous or benign). A brain tumor can form in the brain or other parts of the central nervous system (CNS), such as the spine or cranial nerves. The brain plays a central role in the control of most bodily functions, including awareness, movements, sensations, thoughts, speech, and memory. A tumor can affect the brain’s ability to work properly and adequately perform such functions.",
                      style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.normal,
                        fontFamily: "JF-Flat",
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
              Card(
                child: ExpansionTile(
                  iconColor: Colors.black,
                  title: Text(
                    "Q2: How many times a day do you take the treatment?",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontFamily: "JF-Flat",
                    ),
                  ),
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "3 times",
                      style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.normal,
                        fontFamily: "JF-Flat",
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
              Card(
                child: ExpansionTile(
                  iconColor: Colors.black,
                  title: Text(
                    "Q3: What is the difference between malignant and non-malignant brain tumors?",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontFamily: "JF-Flat",
                    ),
                  ),
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Whether a tumor is malignant or not depends on how quickly the cells reproduce. If the tumor is made up of cells that multiply slowly, then it is usually non-malignant; however, if the cells multiply and spread quickly, then the tumor is malignant - Non-malignant (benign) brain tumors are not cancerous. These types of tumors grow relatively slowly and do not tend to spread. Even though they are not cancerous, these tumors can still cause symptoms and may need treatment. A non-malignant brain tumor can still be a serious medical condition. Malignant brain tumors are cancerous. These types of tumors generally grow faster, and are more aggressive than non-malignant tumors. They often spread and damage other areas of the brain and spinal cord. Malignant brain tumors need to be treated as soon as possible to prolong life.",
                      style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.normal,
                        fontFamily: "JF-Flat",
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
              Card(
                child: ExpansionTile(
                  iconColor: Colors.black,
                  title: Text(
                    "Q4: What is tumor grading?",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontFamily: "JF-Flat",
                    ),
                  ),
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Tumor grade has long been a way to define the aggressiveness of a tumor, particularly for malignant brain tumors such as glioma but also for non-malignant (benign) brain tumors including meningioma. Traditionally, tumors have been classified as grade 1 to 4 based on histology (cells as viewed under a microscope) and molecular markers. Grade 1 tumors occur primarily in children and represent a type separate from grade 2-4 (seen primarily in adults). Grade 2 tumors are considered low grade, but some can be aggressive. Grade 3 and 4 tumors are defined as high grade.",
                      style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.normal,
                        fontFamily: "JF-Flat",
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
              Card(
                child: ExpansionTile(
                  iconColor: Colors.black,
                  title: Text(
                    "Q5: What are molecular markers?",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontFamily: "JF-Flat",
                    ),
                  ),
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Not all brain tumors are the same. Some tumors have differences in the genetic or molecular makeup of the cells. These differences are called molecular markers, or biomarkers. Molecular markers are becoming increasingly important for brain tumor diagnosis and treatment. For example, some molecular markers help determine how aggressive a tumor may be. Others determine how responsive a tumor will be to treatment. Some common molecular markers include the following: IDH1 and IDH2 - MGMT - 1p/19q co-deletion - BRAF - EGFR -TP53 - ATRX - TERT - PTEN - NTRK -FGFR",
                      style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.normal,
                        fontFamily: "JF-Flat",
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
              Card(
                child: ExpansionTile(
                  iconColor: Colors.black,
                  title: Text(
                    "Q6: What are Brain Tumors in Children (0-14)?",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontFamily: "JF-Flat",
                    ),
                  ),
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Approximately 3.9% of all brain tumors cases diagnosed occur in children ages 0-14 years -> An estimated 3,920 new cases of primary childhood brain tumors are expected to be diagnosed in 2023 -> Brain tumors are the most commonly diagnosed solid cancer in children ages 0-14 years, as well as the leading cause of childhood cancer-related death -> 13,657 children were estimated to be living with a primary brain tumor in the U.S. in 2010 [3] -> The five-year relative survival rate for all primary childhood brain tumors is 83.1% ->For primary malignant childhood tumors, the five-year relative survival rate is 75.6% [4] -> The most common brain tumor types in children ages 0-14 years are: - Pilocytic astrocytomas (18.7%) -Other gliomas (15.3%) - Embryonal tumors (12.2%) -> Medulloblastomas make up the largest percentage of embryonal tumors (68.3%) -> Atypical teratoid/rhabdoid tumors (AT/RT) make up the second largest percentage of embryonal tumors (17.2%) -> Gliomas account for approximately 49.4% of tumors diagnosed in this age group",
                      style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.normal,
                        fontFamily: "JF-Flat",
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
              Card(
                child: ExpansionTile(
                  iconColor: Colors.black,
                  title: Text(
                    "Q7: What are Brain Tumors in All Pediatric Populations (0-19)?",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontFamily: "JF-Flat",
                    ),
                  ),
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Approximately 5.7% of all primary brain tumors occur in children and adolescents, ages 0-19 years -> Approximately 1.7% of all brain tumors occur in the adolescent (15-19) population -> Infants less than one year of age have the highest incidence of brain tumors of all children and adolescents 0-19 [3] -> An estimated 5,230 new cases of primary brain tumors in children and adolescents will be diagnosed in the U.S. in 2023 -> Brain tumors are the most common cancer in children and adolescents ages 0-19 years in the U.S. [3] -> Brain tumors are the most common cancer overall in adolescents ages 15-19 years in the U.S. [2] -> The five-year relative survival rate for all primary pediatric brain tumors (0-19) is 83.9% [4] -> For malignant tumors, the five-year relative survival rate is 75.6% -> Pediatric brain tumors are the leading cause of cancer-related death among children and adolescents ages 0-19 years [2] -> AT/RT and high-grade gliomas have the lowest relative survival after diagnosis for patients 0-19 years with a brain tumor [3] -> High-grade gliomas cause the greatest proportion of deaths (44.2%), followed by medulloblastoma and AT/RT [3] -> Pilocytic astrocytoma has the highest survival rates after diagnosis -> Relative survival rates generally improve with increasing age at diagnosis in this population group, with poorest survival in those less than a year old at diagnosis [3] -> The most common primary brain tumor types in children and adolescents ages 0-19 years are: - Pilocytic astrocytoma (15.3%) - Other gliomas (12.6%) - Embryonal tumors (9.2%) -> Medulloblastoma account for the latest percentage of embryonal tumors in this population (69.5%) -> Gliomas account for approximately 44.6% of tumors in this age group (27.9% in ages 15-19 years) -> Tumors of the pituitary are the most common in the 15-19 age group (33.5%) -> In children and adolescents, incidence is higher in females than males -> Incidence rates are highest among children and adolescents who are White compared to children and adolescents who are Black, Asian or Pacific Islander (APIA), or American Indian and Alaskan Native (AIAN) -> Incidence rates are highest among children and adolescents who are non-Hispanic compared to children and adolescents who are Hispanic -> It was estimated in 2009, that a total of 47,631.5 years of potential life were lost due to brain tumors in children and adolescents in the US [3]",
                      style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.normal,
                        fontFamily: "JF-Flat",
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
              Card(
                child: ExpansionTile(
                  iconColor: Colors.black,
                  title: Text(
                    "Q8: What are Brain Tumors in Adolescents And Young Adults (15-39)?",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontFamily: "JF-Flat",
                    ),
                  ),
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Approximately 14.3% of all primary brain tumors occur in the AYA population -> An estimated 11,660 new cases of primary brain tumors will be diagnosed in AYA patients in 2023 -> Brain tumors are the second most common cancer overall in individuals ages 15-39 and the second leading cause of cancer related death in those 15-39 years of age -> The five-year relative survival rate for AYA patients diagnosed with a primary brain tumor is 90.9% -> The rate is 71.7% for malignant tumors and 98.3% for non-malignant tumors -> The most common primary brain tumors in the AYA population are: - Tumors of pituitary (36.0%) - Meningiomas (15.9%) - Nerve sheath tumors (8.6%) -> Gliomas account for approximately 24.8% of all primary AYA brain tumors and 82.4% of all malignant tumors in this group -> AYA had higher rates of relative survival than adults greater than 40 years old for all histopathologic types. Though one-year relative survival for most tumor types was higher for AYA than children, five- and ten-year survival were usually higher for children as compared to AYA.",
                      style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.normal,
                        fontFamily: "JF-Flat",
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
              Card(
                child: ExpansionTile(
                  iconColor: Colors.black,
                  title: Text(
                    "Q9: What are Brain Tumors in Adults (+40)?",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontFamily: "JF-Flat",
                    ),
                  ),
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Approximately 81.7% of all primary brain tumors occur in the adult population. -> An estimated 79,340 adults age 40+ will be diagnosed with a primary brain tumor in 2023 in the U.S. -> Brain tumors are the seventh most common tumor type overall and the sixth most common cause of cancer related death among persons ages 40+ years. -> For adults ages 20+ years, age-specific incidence rates for primary brain tumors are highest among those age 85+ -> The five-year relative survival rate for adults diagnosed with a primary brain tumor is 72.5% -> The five-year relative survival rate for those ages 40+ years is 21% for malignant tumors and 90.3% for non-malignant tumors -> The most common primary brain tumor types in adults are: - Meningiomas (46.1%) - Glioblastoma (16.4%) - Tumors of the pituitary (14.5%) -> For 2023, the highest number of new cases is predicted in those age 65+ years -> Older adults (40+ years old) had poorer survival than children (0-14 years) in nearly all primary brain tumor types ",
                      style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.normal,
                        fontFamily: "JF-Flat",
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
              Card(
                child: ExpansionTile(
                  iconColor: Colors.black,
                  title: Text(
                    "Q10: What are Brain Tumors in by Sex?",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontFamily: "JF-Flat",
                    ),
                  ),
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Overall, incidence rates for all primary brain tumors are higher in females (58.7% of diagnoses) than in males (41.3%) -> Non-malignant primary brain tumors occur more often in females (64.4%) than in males (35.6%) ->Malignant primary brain tumors occur more often in males (55.8%) than in females (44.2%) -> Incidence rates for specific brain tumor types vary by sex. For example, glioblastoma is more common in males, while meningioma is more common in females -> Overall, males have higher mortality rates from malignant brain tumors than females, and generally worse survival outcomes with the exception of glioblastoma, malignant gliomas, embryonal tumors, other hematopoietic neoplasms, and germ cell tumors.",
                      style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.normal,
                        fontFamily: "JF-Flat",
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
              Card(
                child: ExpansionTile(
                  iconColor: Colors.black,
                  title: Text(
                    "Q11: What are Brain Tumors in Additional information?",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontFamily: "JF-Flat",
                    ),
                  ),
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Unlike other types of cancer, primary brain tumors are not staged. They are grouped according to the WHO Classification of Tumors of the Central Nervous System, which assigns a “grade” of 1-4 based on how aggressive the tumor is predicted to behave, clinically -> Grade 1 tumors, such as some meningiomas, are the lowest and typically least aggressive grade. Grade 4 tumors, such as glioblastoma, are the highest and most aggressive grade of tumors -> Only a few treatments have ever been approved for the more than 100 types of brain tumors. None of these extend survival more than two years on average, or are considered to be curative. [5] -> For many tumor types, surgery and radiation remain the standard of care, and national guidelines suggest that clinical trials remain the best place to care for patients -> Survival rates for adult and pediatric patients with brain tumors have not changed significantly over the past 45 years despite major improvements made in the treatment of other cancers -> Each year, approximately 70,000-200,000 patients are diagnosed with brain metastases (metastatic brain tumors/secondary brain tumors), while ~100,000 will die every year as the result of brain metastases [6] [10] -> The incidence of brain metastases appears to be increasing [7] -> Several studies have cited that the percentage of patients with cancer who will develop brain metastases is anywhere from approximately 10% to 30% [8] [9] -> Virtually all cancers have been associated with the ability to metastasize to the brain -> These include melanoma (where it’s been estimated that most cases will metastasize to the brain), lung, breast, renal, and colorectal cancers [10] [11] [12] -> Metastatic brain tumors are five times more common than primary brain tumors (those that originate in the brain). [9]",
                      style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.normal,
                        fontFamily: "JF-Flat",
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
              Card(
                child: ExpansionTile(
                  iconColor: Colors.black,
                  title: Text(
                    "Q12: What are Brain Tumors in Overview of the brain’s anatomy?",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontFamily: "JF-Flat",
                    ),
                  ),
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "The brain and spinal cord together form the central nervous system (CNS). The brain is a complex organ made up of nerves and connective tissue. Nerves in the brain and spinal cord transmit messages throughout the body. The CNS directs and regulates all of the body’s functions. The CNS is the core of our existence. It controls: > Personality: thoughts, memory, intelligence, speech, understanding and emotions > Senses: vision, hearing, taste, smell and touch > Basic body functions: breathing, heartbeat and blood pressure",
                      style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.normal,
                        fontFamily: "JF-Flat",
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
              Card(
                child: ExpansionTile(
                  iconColor: Colors.black,
                  title: Text(
                    "Q13: What are Brain Tumors statistics?",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontFamily: "JF-Flat",
                    ),
                  ),
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Brain tumors are reported in persons of all ages, races, ethnicities, and genders. Over 700,000 Americans are living with a brain tumor today.3 Brain tumors may be classified as either primary or secondary/metastatic. Primary tumors originate in the brain, and the most common types are meningiomas and gliomas. Metastatic, or secondary brain tumors arise from outside the brain in another organ such as the breast or lung and spread to the brain. These are the most common brain tumors.Unless otherwise specified, the follow statistics come from the Central Brain Tumor Registry of the United States Annual Report: - More than 84,000 people were diagnosed with a primary brain tumor in 2021. - There are more than 120 different types of primary brain and CNS tumors. - Nearly one-third (29.7 percent) of brain and central nervous system (CNS) tumors are malignant. - More than 28,000 children in the United States are currently diagnosed with a brain tumor. - In 2021, approximately 18,000 people died as a result of a primary malignant brain tumor. - Survival after diagnosis with a primary brain tumor varies significantly by age, race, geographical location, tumor type, tumor location, and molecular markers.",
                      style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.normal,
                        fontFamily: "JF-Flat",
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
