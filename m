Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDD5C35E93D
	for <chrome-platform@lists.linux.dev>; Thu,  5 Mar 2026 21:46:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772747193; cv=none; b=Su6lRiLHetTjzLwikqmfeJMZSJLFr6dj9gwiPCePhZOMVXqx73DwmEO9RQT/R/VzXITMPTMZ6C0PwEyfhb0wHx6orT3aG+v0a+IydnUyq+VzAyKbBFJgDOTXEcsxAwLeJ38nN9tzYFJRskWWRsH8gXtKxsgMrCkRZkQ2YycQbvI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772747193; c=relaxed/simple;
	bh=G2Qaq1IYTDtA8nYq8hb67ozAR45iYXNAROMWtKf03Uw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=d9XoRwPZYZYDPfKHnUHY9+SprqwA8Qsu/fSE0OmSdNedMLtHi8L8aqBWY8q8Eu90Pcf7U6dEaBSFVFSmvI6hMNNiS5pOpc3jNyVYL9Iwp4oF5XxLcpe7oWQOnIGcqBLWwth8gyiGmUuZ4/HY54ro50xqU7AJjPuUIXmrwefckuY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WFSxdaVi; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=G9NzKbqL; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WFSxdaVi";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="G9NzKbqL"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 625KmZJv3725957
	for <chrome-platform@lists.linux.dev>; Thu, 5 Mar 2026 21:46:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AH50fw9QTtdpPbt41EGIzTuypwuiZyQQHwG7B4PGWqg=; b=WFSxdaViIVPBNC+X
	9bqAQeOpl9vGXSUUioaKpINGyFSaBj1czQ0kQkCk8MAiZaNmcE7wHL7+fV2sSzvQ
	6+x6p53n81WDEWEXo0Nv8GVfz/Bq6O3kyYYQTrRB5tyQjxBDwKMW+0/9IXoQz2Y6
	d4BwliZ31/MTimweCNxGsU/+OJhDIJazRYQ9e0jeS9F19EGb9kvDa4WRvV90AKH6
	2VVrNet5cmq2/CEVpkYGWwoO80ZawsyODj/naisE4DyT4Ns4KkPWvMc1KeARrEeT
	q79E+dOAggE0iGVpm+VqfUmpaIxDya2l8W/S/L/z/yRp6GtTChefieGrRO/pVVkG
	7QkkbQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cq85dj4hs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <chrome-platform@lists.linux.dev>; Thu, 05 Mar 2026 21:46:29 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cb4d191ef1so1116926285a.0
        for <chrome-platform@lists.linux.dev>; Thu, 05 Mar 2026 13:46:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772747189; x=1773351989; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AH50fw9QTtdpPbt41EGIzTuypwuiZyQQHwG7B4PGWqg=;
        b=G9NzKbqL6KrjnirUcHZyOmj4PXg5xty9qNK/4MVyYJcrtBw+97K3azGd961GBraeEA
         ksocTAcTbt4qOZm+5WOl/S59WUiW2jBQDTlYhdMdVLT5zQGDwMq5lRFIG4I4WqFrJP8w
         lcuJBEwpa/EtLtJl0/RGPvZNQFuJZVBW2ucIuO7LsGF3zJwzUcB5YQpYhKXkV6qCLdtt
         Bt2GZLSa20p+E5lIyTUPZi+40slFluELh9ke3nowIcQRbRFGDObaKlGKk3fTORqB19zi
         J7Cnygf9gyFVsAyXUMaNO9dxee+LyGKNhm+emOAyMtfPyvC7dn4PP5pBXMG/HyibpVLB
         T6Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772747189; x=1773351989;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=AH50fw9QTtdpPbt41EGIzTuypwuiZyQQHwG7B4PGWqg=;
        b=NpQhWUKXZPRem2/La2F3GTnZyIWO64X/R2I72KIZbYNoKTu2lPQFSqvBp23P5u3YfU
         EMuSy1GAOQXPen1lZka0CjRYicU+a2PCq/6tTrDHwayfnkDgImxs/jQcZwjPvHjfnnpY
         g5dWvlNFqw0WBMAueF9F+IVlW+E4/FsKF2QQGkMk60hs2mMS9BFkY5ETyXB8H7O3vfwf
         g71cMN0eiKhYaysOcZ3huLpAvf6ZJ2+0MF2rOjlTX8TI2ZDwPL9aTDl1dPfkim3OAm1a
         MWuFROTXiFd8nNjQeRJin2Om6wsS4AYnfA5XsDMoVdGaX/BU52OCfDz3SXfpetCwufvz
         TLPw==
X-Forwarded-Encrypted: i=1; AJvYcCWAJ81W81QYJ4qTv4FWi0shIdY36oYS2FnAnT/1CVUngT/7zRZBZEC7NUuH+EUv01tGAWejx6BvVJfiIjI61Xk=@lists.linux.dev
X-Gm-Message-State: AOJu0Yzv3qNMh+7tdcKwB947Pp79PlHf9+SRS5T+GIi15pVqjTc/lIzJ
	Et9mX723ne+u3Pdpj2orHtwnQTLDPhtGn8oyMBzCB8FMe817jaPjXlc33BaNygm/AsCWX+UqDTq
	TdX1fkW2GiN66PpDYHKEqUkG7zV0IT4ifcbMrlu9ICjkwqcV64S7ojEm5hfu3JugqeFtqxl0=
X-Gm-Gg: ATEYQzxfkS2PzUPvwAe5UH4jZTuMpjYAlnihyxbTGvZ1P7CZGI+E+IMLk32kIvi3LVG
	VxHn7pK+cvQHmGgQ5GIOe7lPXtyf/4HLGNkSqeviM4lUtz5sUrL/wghuFQ2ckzTreIs109XnJea
	c9o9Bgg7slvm/YUvwZr08wLFPhVxD+oiHLnFdv4bH99cYKSSmcMLcNDKCHFIm2MmokqZ/QhEKMy
	JREs54X6MDEztTOwJrf9afQ24qhxQJhnjqc0wDsuHQLiu/VywixXMg9uB/Qyh4Q4Y3cUkxpG2wE
	OkNQY9aP1f+4Sm8KRJGGM/9T49Kh4Ij4NycCymDs3ky8yCjznPktM7YwlgrMlElVLTxR0hg6fgQ
	Xf+iHcz1djXo8XtBiAiegmK2pFb1OOwp1fJKB+WHlBVWU
X-Received: by 2002:a05:620a:1726:b0:8cb:4fa5:d47a with SMTP id af79cd13be357-8cd6d494e49mr2330185a.77.1772747189115;
        Thu, 05 Mar 2026 13:46:29 -0800 (PST)
X-Received: by 2002:a05:620a:1726:b0:8cb:4fa5:d47a with SMTP id af79cd13be357-8cd6d494e49mr2326485a.77.1772747188622;
        Thu, 05 Mar 2026 13:46:28 -0800 (PST)
Received: from [127.0.1.1] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439ba2a58dasm28571575f8f.27.2026.03.05.13.46.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Mar 2026 13:46:27 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Thu, 05 Mar 2026 22:45:45 +0100
Subject: [PATCH v2 06/10] power: supply: ipaq_micro: Simplify with devm
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260305-workqueue-devm-v2-6-66a38741c652@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3021;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=G2Qaq1IYTDtA8nYq8hb67ozAR45iYXNAROMWtKf03Uw=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpqfmdS1zMtD2UaoQRfaiq5mLP0QlOTpilY/8TD
 J4ztu2IWgOJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaan5nQAKCRDBN2bmhouD
 13BxD/0YZqo0vRusnBrySJI4j7j0qBvMSBLl9ERMwbH5zZQFXisFq0V0/yim2m6aeuWG3sue54q
 cQyLvmbMOtlHEjhHsJW0gAP7otcp1O0SfR3ykSEKToa0wZY7+zGXm7wnrXKcTsXhcddZj9Ywk7G
 k8pxhlb6R/iKHlXjSedxxBM2U3iicVf9s043yF+9ADEZTF2SsoruyLdMui8TCO60ILt39gQjuqx
 9inYM98ZePPGSQtHGfvmONO7Gu1D+EvkseMIaO+YIhDzEMAJUAmew+WPrK567ES5pxsJ/GIg9ul
 ND9JhEpU12ZAB7EKrHhCcxcFQOn6vDEvL5ZJ4rtl/Ts+C8ufpzL1pVEuldmRhFHjG17dv3Mm1hU
 qG4oztSBnPshts2d6Nc/Y4uayRlpNpeK+7SrP2f/PrWGQdd5KdFo5Iu1uJnwGMsiExW0MLOT2eI
 43o7eDO7M+jC3NfI7za2SVUY8POdUyx/ba5BPcXUmJd5RpRiyOgPbEIZeRhYhkxSm6zNITQjBIQ
 7tVjG3QlahgAPAcbxe0FiplwIwhYBRcso/cJGY5XD8IFB9T8+OH6y3pOed4UM7DNe3E2zT03P08
 8/si+s74GY7hTw3HR+7C9YKGWQeAGDNHcOFKDrfcLEjPqmN4Od/VOYDbfizGIxxbX4sM4VQDDfi
 JSVXiCJBbZxkykw==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-ORIG-GUID: n0Cj4di2Wrxal4rJZrlcDhC-LNPga0bP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA1MDE4NSBTYWx0ZWRfX79AGGo9Iy6G2
 94DspbL988w6+vbYJukvGNt9JYsSQACa3V+Br/3rjaqWty1JtRGQeoiaZ9aO/IDXuNtdyalvEp0
 TXKLFfCEfUJ+QVi8NrUVt/5w7klulp20dcGTDOSMNsJBEBaX9e/OHyo4IurYDOM3ND1Uv4BfaNt
 TGKeZQ0to/y69K0bJwMajoYdqelqaNCQA2saQXwko4VE1zgychQ69ACl+zDDeMWolmrVtr43Z9K
 XOHhxRlpQ8k8jA+hjVFwN1fKq8kC6LKzdeWVCJJ0XaxPzdDUmzaxAF4K8U6+MwOhp/G5majsxDh
 amnea5AXkJIQbJz/iY9gyVIkiM7I2h3oXBpsPsUm73JGRiaf0fH8KxfttGLxbSXP8/E318iWq6T
 9Rxvyaqo6Rq5bF59cQKQLOKUlbaBMxhZxzPcd4P3xA0wwtHe427xkXPa7jHGp/N+Z2eAvrh6Szy
 OGxqRcUxgsBzyUs50cg==
X-Authority-Analysis: v=2.4 cv=aOb9aL9m c=1 sm=1 tr=0 ts=69a9f9b5 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=PkD0MmKtpR7JdVUpc-MA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: n0Cj4di2Wrxal4rJZrlcDhC-LNPga0bP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-05_06,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 clxscore=1015 adultscore=0 suspectscore=0
 priorityscore=1501 lowpriorityscore=0 spamscore=0 malwarescore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603050185

Simplify the driver by using devm interfaces, which allow to drop
probe() error paths and the remove() callback.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/power/supply/ipaq_micro_battery.c | 50 ++++++++++---------------------
 1 file changed, 16 insertions(+), 34 deletions(-)

diff --git a/drivers/power/supply/ipaq_micro_battery.c b/drivers/power/supply/ipaq_micro_battery.c
index ff8573a5ca6d..5e3fe3852d0e 100644
--- a/drivers/power/supply/ipaq_micro_battery.c
+++ b/drivers/power/supply/ipaq_micro_battery.c
@@ -7,6 +7,7 @@
  * Author : Linus Walleij <linus.walleij@linaro.org>
  */
 
+#include <linux/devm-helpers.h>
 #include <linux/module.h>
 #include <linux/init.h>
 #include <linux/platform_device.h>
@@ -232,49 +233,31 @@ static int micro_batt_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	mb->micro = dev_get_drvdata(pdev->dev.parent);
-	mb->wq = alloc_workqueue("ipaq-battery-wq",
-				 WQ_MEM_RECLAIM | WQ_PERCPU, 0);
+	mb->wq = devm_alloc_workqueue(&pdev->dev, "ipaq-battery-wq",
+				      WQ_MEM_RECLAIM | WQ_PERCPU, 0);
 	if (!mb->wq)
 		return -ENOMEM;
 
-	INIT_DELAYED_WORK(&mb->update, micro_battery_work);
+	ret = devm_delayed_work_autocancel(&pdev->dev, &mb->update, micro_battery_work);
+	if (ret)
+		return ret;
+
 	platform_set_drvdata(pdev, mb);
 	queue_delayed_work(mb->wq, &mb->update, 1);
 
-	micro_batt_power = power_supply_register(&pdev->dev,
-						 &micro_batt_power_desc, NULL);
-	if (IS_ERR(micro_batt_power)) {
-		ret = PTR_ERR(micro_batt_power);
-		goto batt_err;
-	}
+	micro_batt_power = devm_power_supply_register(&pdev->dev,
+						      &micro_batt_power_desc,
+						      NULL);
+	if (IS_ERR(micro_batt_power))
+		return PTR_ERR(micro_batt_power);
 
-	micro_ac_power = power_supply_register(&pdev->dev,
-					       &micro_ac_power_desc, NULL);
-	if (IS_ERR(micro_ac_power)) {
-		ret = PTR_ERR(micro_ac_power);
-		goto ac_err;
-	}
+	micro_ac_power = devm_power_supply_register(&pdev->dev,
+						    &micro_ac_power_desc, NULL);
+	if (IS_ERR(micro_ac_power))
+		return PTR_ERR(micro_ac_power);
 
 	dev_info(&pdev->dev, "iPAQ micro battery driver\n");
 	return 0;
-
-ac_err:
-	power_supply_unregister(micro_batt_power);
-batt_err:
-	cancel_delayed_work_sync(&mb->update);
-	destroy_workqueue(mb->wq);
-	return ret;
-}
-
-static void micro_batt_remove(struct platform_device *pdev)
-
-{
-	struct micro_battery *mb = platform_get_drvdata(pdev);
-
-	power_supply_unregister(micro_ac_power);
-	power_supply_unregister(micro_batt_power);
-	cancel_delayed_work_sync(&mb->update);
-	destroy_workqueue(mb->wq);
 }
 
 static int __maybe_unused micro_batt_suspend(struct device *dev)
@@ -303,7 +286,6 @@ static struct platform_driver micro_batt_device_driver = {
 		.pm	= &micro_batt_dev_pm_ops,
 	},
 	.probe		= micro_batt_probe,
-	.remove		= micro_batt_remove,
 };
 module_platform_driver(micro_batt_device_driver);
 

-- 
2.51.0

