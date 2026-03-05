Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD00A2DB78E
	for <chrome-platform@lists.linux.dev>; Thu,  5 Mar 2026 21:46:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772747193; cv=none; b=drNO/r1EwkoG4gJykKqRxl0TrD14+QpmN8GYv/7K9Vgadd+n/wQ/DoM0ih23SutlmSU/Yqi20g8U7L4gyS2wp8xvkwJJfTaKBR/RTGq9BFttBkyhLSvyfGSZkiUQaY9auNGSRKQModfr2SPthsaBACinN/LCMGrXQNRSFMNVrrE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772747193; c=relaxed/simple;
	bh=PoZ0eKm8MLgOO90bXKtZwxPlfboU8J3eYOJIbv0VDv8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bqfXlPe2JjGJiUPjY45WleGvptGSGT4z7uPqz1ot7AlkaWAWIhFeg5h3tWwBFrntPck+hcN8KkSl4uFpgUAT/CN0Bt4d2cW1f8i2C3WUtDLP9qRxLMCDxqnlW2KWnTEhAGuciTnBiqMoMEhtbyMGvAsnLLKqWCb4kWuQgl9A2NE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ov+IYeXy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=itPhdeKx; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ov+IYeXy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="itPhdeKx"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 625KnYB41806804
	for <chrome-platform@lists.linux.dev>; Thu, 5 Mar 2026 21:46:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Vcpaugt/kV8VwsdX8NCcfQ7MWxrzT9ru/yIG08skX+8=; b=Ov+IYeXyCQyHl580
	YhbBes9RuhaotmCUAKz0h4zKFaOLd8/tSHTcFEVJdB6KXopiHp9iUXCwo2Fap0D2
	Tm631Kk4frs+VjP2udIj16K0WIpmkuQwAqmDaqP0nFv5H80yO3BFD/f5lb8sKE4D
	4YDPr99ljDYrD/YO59LlT12dnSK7tqc33oCibG7vKq3BS8yflyJCHAVZLTAjlWzX
	AnG5ISA08aa66pOBVm9ALdkuEAe7GizpbZdWTTNY5mcBpOWV3RTJe2/T+4DiaS99
	NWFYIC8KxY1qTqOhEPprHTKb3WbwGFsKvXNcqAfnkzrSR/HxANEXlqJ3bMERuPlq
	T095Lg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cq9srhtk8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <chrome-platform@lists.linux.dev>; Thu, 05 Mar 2026 21:46:28 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8c70ab7f67fso1088162485a.3
        for <chrome-platform@lists.linux.dev>; Thu, 05 Mar 2026 13:46:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772747184; x=1773351984; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Vcpaugt/kV8VwsdX8NCcfQ7MWxrzT9ru/yIG08skX+8=;
        b=itPhdeKxy3aiEgoxAEjq2U+gXIlTwYqsOgr1Kw54Ldl5i2u9bM9PWYG/rCmqtBWo1p
         u6/IAwVNHpPfwycN7M7Jre9fFAOtkJXt2GK3OVqF3FKlBpW315WDovy4KLE1S3SM2k/E
         xIl41GT9hbmxzIFMOWq0tJ3FaSp+Gjlr3tievXzFw3w4gq+Yf5Op5BK0a4auEaqEYCnB
         pFcxSsTdTTXg/aI2TO2zQNA3fNzm0aQzQpAIuP3CfXmZu8KCxeFmbkWvAotUQ2rBB0IF
         uWeeLddhzeQ/yfF4cJ5p3kCmAoPvTLX+oYwEporqQ110ph9Av7ezYYLqkJhNdcQ6NrP0
         Vf/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772747184; x=1773351984;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Vcpaugt/kV8VwsdX8NCcfQ7MWxrzT9ru/yIG08skX+8=;
        b=YZMjcSmUSaUeB5nLZDrLNddmKAx6AIT2eYH9Mv72PNe5hnskwytNOCJiBDjrmSDKa6
         E2PuazYxVrKx26GvF0/yLz8B6dSk/Uf/vIlKHYcZH+PIBKBz2PTkG2p6xjC9khYhZ8uE
         r8Z8uV0tMF4XJIY/0MkOifE/KP14apgQeElsCOCUpaG8NUYN0WszEsyxgbgFSoBYPWH7
         w+4JV4uyGYiOiBAlFXJqXlN13nlNldlz6otWPngqQUoXOpoprypk9C54fQHSnXRcANt4
         wzEp+m4RN1NxcF8TP3tY1MfEYzVMNsCHk5Bfh2EIipfv/lgRLdw/SAYEtc7oTaA89IFC
         gqzQ==
X-Forwarded-Encrypted: i=1; AJvYcCULjUhm4K6D2TvupgHY+tdcJjBF2bHj/Z6nnjn90ZQTs1MqDWF/+AurOChIpegQNET3BpalhGREjJtkBLyY9Wc=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz7lcZa0HQXduYO2WQPOMh+NtSAK/63NX9nhNYGamYgRtObrRoW
	ZQhZ1G3PwE0bwRGGpm7w+nO2U8S7FLROSNLOccytSRNf3oy+Rhl+Y7GJYN8yyoLlggK5cgy9Kn8
	yBU/Ul2Zkvwmc88sEvKNTjhx6IK3ZEFPzx4UuWg38Z4uzMbLjyu9qDZvJibfblIJRVougQWk=
X-Gm-Gg: ATEYQzxk53hLxma/cZ6XLlDE4CVB0KKJBS1y7NwhlaQUauNGodEO6CDXXF2C2y7Y94n
	KvIz6SmEAWtNC6nD5eGi79xyEZBPoykCdwhPxtir1Upu6U6wJxuEwR1dgzVMVuF8e9g53OA90oj
	/nS6hyH57sJlu9DfuH0YDNVlomGEhZNb7P5px4mbCz+b8NEMVHkC9CS1n93knVq/68gYaokBgwf
	CTM+eB5tvh7ygmfJAgw5RDdf1qBHmyvleBRAo98ooI07GF0XaqcuYz7eN87IXDEbgStlSwnupv/
	ikA2h2SOtMalqvBHYkXWsfMzyKV3lULopZ5JHGVTHTpjwdZ8FynWZ+r+O1sYESPLYSEh8vFSsav
	vhDdaUWUEVsiG1Mp7uDs+hcXF+4paWVy/JQMNEFJEi0Uh
X-Received: by 2002:a05:620a:4723:b0:8ca:1107:1214 with SMTP id af79cd13be357-8cd6d3fb768mr5037785a.7.1772747184096;
        Thu, 05 Mar 2026 13:46:24 -0800 (PST)
X-Received: by 2002:a05:620a:4723:b0:8ca:1107:1214 with SMTP id af79cd13be357-8cd6d3fb768mr5033785a.7.1772747183545;
        Thu, 05 Mar 2026 13:46:23 -0800 (PST)
Received: from [127.0.1.1] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439ba2a58dasm28571575f8f.27.2026.03.05.13.46.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Mar 2026 13:46:22 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Thu, 05 Mar 2026 22:45:43 +0100
Subject: [PATCH v2 04/10] power: supply: max77705: Free allocated workqueue
 and fix removal order
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260305-workqueue-devm-v2-4-66a38741c652@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3546;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=PoZ0eKm8MLgOO90bXKtZwxPlfboU8J3eYOJIbv0VDv8=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpqfmb2gO7y2En1OEl5OFrZ4KkZpCqXAC1BJCWa
 rs6OqZthfSJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaan5mwAKCRDBN2bmhouD
 1xQjD/45+o2CDJzfafztbtIZA6A6uwd2/M6StDF+nW79PQVfIupsEalhQKwpwZ4AsUkT0Uw8RGj
 wj0rA71xQpR3ABUAkbkTWK29AtuiG3exU1uIDH9aCZRainZVaR7wkSUHCvMgKsaTp9dlIsn/7bY
 w4bO3g2L5ptohXvEgDXiLd7V+2bX89tyyI0oCiQhDwFCBlhvzFZ6x7iqZbQ4E/CLc++QQQA6CZH
 nzuCgbL17+egu2SJsyhPXHZe/+O2mKiTAYmgK1tYwfD3BErfUDoR2RNwOR9JzpmeufDlWnGqlTO
 EIDMTiPrXSaF4bQEb/ft3SNHmkCmKeufktwmwfOLdpfyL4Y3JXmolp+1IjpJeLodU4EXEOIYQqa
 v9/iviO4p0/enW/wWzn0wYZhB9qAUGTF2Zq4hs1xJqhr6Wd46MkRRpEdOFUntVvF0WnTuR6rHil
 d8tykmlOpdqR/4hP4S9icOrQ38dyPg90iLESKGi7zVvjVXzDWThzA60B0cJjcgCUxSAVtOIW3vK
 MXACsTA6NJTMi/oPTFMFJJjHJHXFLTEvTxIsHdN6fDLQTWtAHkD7Bate29s1YA3OC2CEx7umvTZ
 5nmi58PnCwirVetEziWYHH+9AfaojA/6g2yTy2rWOnwHbU0uXY75M11oJychETq9y86bCN0o7bV
 jVaMqs2Z9iuPX7Q==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Authority-Analysis: v=2.4 cv=a/I9NESF c=1 sm=1 tr=0 ts=69a9f9b4 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=NrNmjpoQ7DW6B6PU5UcA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: 1s2NVGdQf7aOfnUCbl3nyTxTmtOTGeH8
X-Proofpoint-ORIG-GUID: 1s2NVGdQf7aOfnUCbl3nyTxTmtOTGeH8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA1MDE4NSBTYWx0ZWRfXzdu9WXFmej6i
 sBtrMOyVZ8St/ofI9NcgzLl977r+TFHPXUPmbzb5hLDVIQDZzJCTEVDO3EwWlwKy00671mdzkuE
 H4DoQqWJc7V0htjQaQGtwJWMwUlOngaWs6qk1bZ7gfgCBxtMKKqRfn5hyd9SFMkr4DkjREqKMOW
 4ygPn4Wd33SH7lxKKUYJTYskCOUR4p/HAZ58M6b57A7k2GUukEULBV2e84zBgqBV1JVEz/Wno2e
 ojFuoHLLHvoeKxipgXk0kVppnkk+Qx3z5N7AbpODPLaHVzWM2GLytqiAkTl2dPqAsMdMEFJewSa
 UHIvQyMmPxXZPwz3CD/CsazYd90sZweuBum1Rcj45R0/7ShmOpz6l9KHWaG7bLd5nxqvlzX7ZPp
 uZok4gfxX8qRWKySjba2ZmyaCpzimd/sZ5UR7i2ViAOBEsa/p+sgFkMw3C2IelPVQoFbJltyvab
 EDtBw5eImfZYMVgLJDg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-05_06,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 impostorscore=0 phishscore=0 bulkscore=0
 suspectscore=0 spamscore=0 clxscore=1015 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603050185

Use devm interface for allocating workqueue to fix two bugs at the same
time:

1. Driver leaks the memory on remove(), because the workqueue is not
   destroyed.

2. Driver allocates workqueue and then registers interrupt handlers
   with devm interface.  This means that probe error paths will not use a
   reversed order, but first destroy the workqueue and then, via devm
   release handlers, free the interrupt.

   The interrupt handler schedules work on this exact workqueue, thus if
   interrupt is hit in this short time window - after destroying
   workqueue, but before devm() frees the interrupt - the schedulled
   work will lead to use of freed memory.

Change is not equivalent in the workqueue itself: use non-legacy API
which does not set (__WQ_LEGACY | WQ_MEM_RECLAIM).  The workqueue is
used to update power supply (power_supply_changed()) status, thus there
is no point to run it for memory reclaim.  Note that dev_name() is not
directly used in second argument to prevent possible unlikely parsing
any "%" character in device name as format.

Fixes: 11741b8e382d ("power: supply: max77705: Fix workqueue error handling in probe")
Fixes: a6a494c8e3ce ("power: supply: max77705: Add charger driver for Maxim 77705")
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

Changes in v2:
1. Use devm_alloc_ordered_workqueue(), mention this in commit msg
---
 drivers/power/supply/max77705_charger.c | 28 +++++++++-------------------
 1 file changed, 9 insertions(+), 19 deletions(-)

diff --git a/drivers/power/supply/max77705_charger.c b/drivers/power/supply/max77705_charger.c
index 0dfe4ab10919..63b0b4f0cd21 100644
--- a/drivers/power/supply/max77705_charger.c
+++ b/drivers/power/supply/max77705_charger.c
@@ -646,47 +646,37 @@ static int max77705_charger_probe(struct i2c_client *i2c)
 	if (ret)
 		return dev_err_probe(dev, ret, "failed to add irq chip\n");
 
-	chg->wqueue = create_singlethread_workqueue(dev_name(dev));
+	chg->wqueue = devm_alloc_ordered_workqueue(dev, "%s", 0, dev_name(dev));
 	if (!chg->wqueue)
 		return -ENOMEM;
 
 	ret = devm_work_autocancel(dev, &chg->chgin_work, max77705_chgin_isr_work);
-	if (ret) {
-		dev_err_probe(dev, ret, "failed to initialize interrupt work\n");
-		goto destroy_wq;
-	}
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to initialize interrupt work\n");
 
 	ret = max77705_charger_initialize(chg);
-	if (ret) {
-		dev_err_probe(dev, ret, "failed to initialize charger IC\n");
-		goto destroy_wq;
-	}
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to initialize charger IC\n");
 
 	ret = devm_request_threaded_irq(dev, regmap_irq_get_virq(irq_data, MAX77705_CHGIN_I),
 					NULL, max77705_chgin_irq,
 					IRQF_TRIGGER_NONE,
 					"chgin-irq", chg);
 	if (ret)
-		goto destroy_wq;
+		return ret;
 
 	ret = devm_request_threaded_irq(dev, regmap_irq_get_virq(irq_data, MAX77705_AICL_I),
 					NULL, max77705_aicl_irq,
 					IRQF_TRIGGER_NONE,
 					"aicl-irq", chg);
 	if (ret)
-		goto destroy_wq;
+		return ret;
 
 	ret = max77705_charger_enable(chg);
-	if (ret) {
-		dev_err_probe(dev, ret, "failed to enable charge\n");
-		goto destroy_wq;
-	}
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to enable charge\n");
 
 	return devm_add_action_or_reset(dev, max77705_charger_disable, chg);
-
-destroy_wq:
-	destroy_workqueue(chg->wqueue);
-	return ret;
 }
 
 static const struct of_device_id max77705_charger_of_match[] = {

-- 
2.51.0

