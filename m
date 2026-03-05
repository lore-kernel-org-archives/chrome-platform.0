Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34F4835F187
	for <chrome-platform@lists.linux.dev>; Thu,  5 Mar 2026 21:46:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772747186; cv=none; b=SRyt8oKhMPXuacfemQ1H+V8tFX9zG8/jS0tOEaFsDKcx8w3LT3GIImwq3OQBrL/c2QELPcBO/zJMXm1pUCxmArb7M52t/odvTFJK1ipXZYk5IyYnTbZjciCetcwb431yiTBoN2AbQvIUiTbx/3I6YY+87RoKzXYlnkgdQ2jjPLg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772747186; c=relaxed/simple;
	bh=6wTg5DsJ+ATD7iLynQ18x4EJDM0BB2ZAPMsN3b8NZJk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jXeB2bW2FophxdZhYwxCEaxi+XLDUf5eCfF3KcA7DYfmfV5rQz+7pSL86UdDHQyj3P+7rFJMBA4FMVdIqbh8bGGNRVMalOgZM+3n3Nr+7LeWKwtnZDuJ3ORMOmSskQj6P8UKyuZGctAZK8lV0YaM2udzP6NnwftCvPqt61zWJEU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bKCS2POP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ETNaL8R1; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bKCS2POP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ETNaL8R1"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 625Kmg5M1489165
	for <chrome-platform@lists.linux.dev>; Thu, 5 Mar 2026 21:46:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lmkUTSqSMKdHAfSHvzXCLPeWkagFUCz0SlNEC6QFdTo=; b=bKCS2POPMQPrhHTk
	ngNEQyMtdSUmID1ke5PQnDAWyP62jpHAdCAGQ3Rlru28IR2le3f4V/FpLO2n1OQm
	cMEG/XkRS4ik+VDEjHAlj3RMPaUE1GYVcEGbUy1wtOhDdF0n+sueBWvOEY5tn+fK
	YsXx2uEnAFpLhBX1uiUGNpRMLzjUq++idIRis2YSfm3ulhsiDpsQLOS2P1GdAC7m
	GSzaAJGqpZpRcHQsXXk6dZjKo1iW6zpEH6ZACe75dKr7H122JTczXqU3o+Qszzbd
	Iv3WjqUH0Zbam5CljqlClCvQCvJjHeuzykxsgbwm6k8fUfxCAgddNktl+SoLAnp5
	dPt6sw==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cq84wa3y0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <chrome-platform@lists.linux.dev>; Thu, 05 Mar 2026 21:46:22 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-89a174bd442so163263406d6.2
        for <chrome-platform@lists.linux.dev>; Thu, 05 Mar 2026 13:46:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772747181; x=1773351981; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lmkUTSqSMKdHAfSHvzXCLPeWkagFUCz0SlNEC6QFdTo=;
        b=ETNaL8R1VBkKVYI3tbhWrb6zHgulAR3OKxbO7OU6R10DUAe+Juxc/rRy0g2DzTpZgr
         ibY5bvx5zc0pqmdOSb8CF1uV8FSczfd7jBYqV2+lduuElY7TPK+9cfC8KR5C2IaAk6Si
         hQ6uSxWjf7ZTfU3eSFeEPEIT6z62ehy3JuwoZ7aCX+Me1yNeTrglM4N7+Hn5GW0CQSBW
         +xh1MHKdOV50umlTErhOWJ3BT0gYjWddMFUqlWQ0jJpVcdpqbruOluCpBgjRY+JmUgj7
         FeE4o2rO0I1AK0GkllgZj6PD36iaxVD5rtlT6ob9ejgHs+JMoAbjWJfXa+iiUO6J+tHP
         NTVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772747181; x=1773351981;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=lmkUTSqSMKdHAfSHvzXCLPeWkagFUCz0SlNEC6QFdTo=;
        b=ZjrNj+QIf7Ej3wJpTL0WuInGwdJXJyCvfR6rNDQ5hy3EW8nC3O2iMB+fgWpT18/DgY
         dqizvrMlQ1Z2O3X+SIwACAw6RUHx3XLKNdaV0Wzubebl2Ne7vSUrm/cZ6mirT3AQqrFJ
         pSwnI6ypuV3FRzuZrcYgxcHi6N4NeDgLCiwfkG4imDgsYBcebcL/ua7BC5Y4baoeULHN
         oRfwAIgpl7OxvFeRNmc5oK6XbiVk4oflnrHg5dk44fp51aXU2xozRFz//tnqLyp5xZgQ
         jb4ZAVuZ7tKxB8OU1hwLoYh5kMyijjWtvMk6dOPFYViiVPjDgFq+JwSAyK+PCXbZamt2
         4WKQ==
X-Forwarded-Encrypted: i=1; AJvYcCV2DZViViartnzvVkkaku1XyEOfv2TB/laUvH2z4okEfIVhsRKlXdeCtN2xRXnlya68NUBUSFuIOO6SO+jAGZg=@lists.linux.dev
X-Gm-Message-State: AOJu0YzbjP9LFKSVU/5diirTY0BsdyeqMZ7NR5OBp6QUMu1WcMLuTdge
	zKuxPNL/TW+N29dJJ0up9hs4sWhdi/GhftnpCgPgVjxqFYSTXju2+f12ghgmX4d4moJ9IoUpriU
	t/NFMmrLDknUBKjB6cBsmVDKbyKKlaVa0ajC1AgDmnxs+vifZGQUfRWCkniVDSTiFCXw744I=
X-Gm-Gg: ATEYQzz1lr958eyvsC6woe3lwZ9lI9K2JPCG+MdHW8wmOOMIbKxmg0vVS+IkHouQBsI
	CfNYHXkh9USH8G/EbsjbtULubAsl+McyA1qu/ShtOrwD29pH0hHR6Y32X7VOwtykTrAanitjbtj
	EUVqweATjn/zTPvQqORUJYwLTUcvQ0PIwcSY5k17/hEytlvVC+NjhU+6pxshN1r9DsLCuDqQ6oq
	7cw5I0vlwJEEt07effQGWsUydMd8LwMLe1utK9DMU/BrSQbcuo9rHiK38jTBrcYBggvea8ynyHT
	835ogebY6iJRnCcBn3mqkDVHQklccilOiFzi2Gt8AddZiIFmQyzb27+KGj4LHhrzPis0mHSWutw
	cz9zNpDyE9U7vAQlAKN5jM59d5CTD/hhKEzqUgYLzd/+U
X-Received: by 2002:a05:620a:4494:b0:8c3:598a:2956 with SMTP id af79cd13be357-8cd6d3966bamr6923585a.33.1772747181588;
        Thu, 05 Mar 2026 13:46:21 -0800 (PST)
X-Received: by 2002:a05:620a:4494:b0:8c3:598a:2956 with SMTP id af79cd13be357-8cd6d3966bamr6920685a.33.1772747181120;
        Thu, 05 Mar 2026 13:46:21 -0800 (PST)
Received: from [127.0.1.1] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439ba2a58dasm28571575f8f.27.2026.03.05.13.46.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Mar 2026 13:46:20 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Thu, 05 Mar 2026 22:45:42 +0100
Subject: [PATCH v2 03/10] power: supply: max77705: Drop duplicated IRQ
 error message
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260305-workqueue-devm-v2-3-66a38741c652@oss.qualcomm.com>
References: <20260305-workqueue-devm-v2-0-66a38741c652@oss.qualcomm.com>
In-Reply-To: <20260305-workqueue-devm-v2-0-66a38741c652@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>, Tejun Heo <tj@kernel.org>,
        Lai Jiangshan <jiangshanlai@gmail.com>,
        Tobias Schrammm <t.schramm@manjaro.org>,
        Sebastian Reichel <sre@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Dan Carpenter <dan.carpenter@linaro.org>,
        Krzysztof Kozlowski <krzk@kernel.org>, Lee Jones <lee@kernel.org>,
        Dzmitry Sankouski <dsankouski@gmail.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Benson Leung <bleung@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Matti Vaittinen <mazziesaccount@gmail.com>, driver-core@lists.linux.dev,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Sebastian Reichel <sebastian.reichel@collabora.com>,
        linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, chrome-platform@lists.linux.dev,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1275;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=6wTg5DsJ+ATD7iLynQ18x4EJDM0BB2ZAPMsN3b8NZJk=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpqfmb4FqaUPE8Ufhusp62MvQj/z/BudC05PFyG
 lRWQHQ+flSJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaan5mwAKCRDBN2bmhouD
 18oJD/0TgRoahqQolkN+HXA2B7CERLNPQLecC5FxtW/Y0TeM3mpHkMAh5y1xBix+0e9BayIEkGg
 SMrEr3kgC8I9FEc8Mc8G2UFY7AQpAHuFGmjnjIhj9YCfgJaOB9GLUtsDkzip9AjWYMuEPNdg0hH
 N240sOUOBCgzBgfGY+5U8AHaK7JKZp4nA257ZtiwWR/9Ua7KEXVvyXL7KujZzgWoYIY1H3CJ+p9
 T2MII1isUfaViTmqZnLN/EDTeHMwvh2SUwRMBc0x+oROHzkHmx7GkhwhXEFpFaQlJpLhHdM0cr6
 UCteNGZaYTAhPBNZ3Iwwg1g3kHUQpAtuxMGI6wP2TM2T8thzx0lOP1vpCHoyAKS8NffvVE4Cnlk
 LJeRT9kzSPj3mNfW2tQPou3NDRouDud3eSUX7dHRCsKEgWH94aGzbAGxyuCFcq/tWFl2XXBOmfm
 44H+Vcs8ff43di9cK0YWiJtn5Sk14hXiz1sz6bEFr/nKpKDdCiJw5sSjZF3+ODc93BsQWiJXlsI
 8T9NZ7c4YdS+9WfiGvwjRTTPanrmNmgtAZXQEooWvgiGwxRPaR1whqMDEtiuFeAauioOIxE2eQ7
 +MCgY2ay1ZTUSZ8QjJDAT3LgPa6Dqw/0s4NcwNpP6zqW+ya/JiSa/HNOPPnTzOt2BShhQY/QI3E
 YavCWFWns+RI0Iw==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-ORIG-GUID: TY9lv-nEWZdi7cn0zhf3myy23PrkTKV6
X-Proofpoint-GUID: TY9lv-nEWZdi7cn0zhf3myy23PrkTKV6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA1MDE4NSBTYWx0ZWRfX721QqVlHU5HO
 /peyAhdyB5Ce7rVHCbPZ57Qn7Hxf5w4o9c84wFR3l/Vng+UJ25niM+jC47Ng8MqNpbVgv8SetQY
 iAMDxPeWDbq078Os93RsokLoIkit53XUl8RXlng6rzub9ilLRugFBlOx/C9mGFS4tRF7CuRH9NT
 6Ch4ACoTLX1dYRPyO1ry1tcbOo7JFSvTHE94TvsIS109oeCcDzNYuPA3J5t7myh6PgjaKDJUfhi
 5SAqrWbTkkXQfaaEoEAo9JJ0QtddRKnMDna/ccyOIZvSxL5Dbwd59tz/2dVC8LEL8pRmGTG6Mei
 kWrPtWMCtIhG5WUtrEUrboAC3FUPTL0IGC9WUhmJfO+e0VNJnPCigu7Bd/MDQGKNFAsK8XR+T9k
 jQnTm7YzwETCuHa9TMIuWuncmsZte5FOdzyvPS9ZNHRd9+/KEVVFMENGDOu5wWcODkcLMl/Y98H
 uENKxxfxowzr557Kszg==
X-Authority-Analysis: v=2.4 cv=N64k1m9B c=1 sm=1 tr=0 ts=69a9f9ae cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=QyXUC8HyAAAA:8 a=EUspDBNiAAAA:8 a=e9VCzvh-DsFqsbzuLP0A:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-05_06,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 bulkscore=0 clxscore=1015 adultscore=0
 suspectscore=0 spamscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603050185

Core already prints error message on devm_request_threaded_irq()
failure, so no need to do that second time.

Suggested-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

Changes in v2:
1. New patch
---
 drivers/power/supply/max77705_charger.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/power/supply/max77705_charger.c b/drivers/power/supply/max77705_charger.c
index 5dd02f658f5b..0dfe4ab10919 100644
--- a/drivers/power/supply/max77705_charger.c
+++ b/drivers/power/supply/max77705_charger.c
@@ -666,19 +666,15 @@ static int max77705_charger_probe(struct i2c_client *i2c)
 					NULL, max77705_chgin_irq,
 					IRQF_TRIGGER_NONE,
 					"chgin-irq", chg);
-	if (ret) {
-		dev_err_probe(dev, ret, "Failed to Request chgin IRQ\n");
+	if (ret)
 		goto destroy_wq;
-	}
 
 	ret = devm_request_threaded_irq(dev, regmap_irq_get_virq(irq_data, MAX77705_AICL_I),
 					NULL, max77705_aicl_irq,
 					IRQF_TRIGGER_NONE,
 					"aicl-irq", chg);
-	if (ret) {
-		dev_err_probe(dev, ret, "Failed to Request aicl IRQ\n");
+	if (ret)
 		goto destroy_wq;
-	}
 
 	ret = max77705_charger_enable(chg);
 	if (ret) {

-- 
2.51.0

