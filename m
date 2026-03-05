Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4143835F18C
	for <chrome-platform@lists.linux.dev>; Thu,  5 Mar 2026 21:46:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772747190; cv=none; b=dNZ5ZLJc38OpyBEiyd+JvK5kXROmNUD9xVXu2lD1Ymuxhp+MPkjB2VP4bEh1P8fMdcs1Is1m04vio5fcfHxZyjeZZNqhX4dIQYdW0CMr0irSfct4wDmd+tZz1jIU8No/FsZy8qnC2lZmFOUZUSjqEhYUa13171zTVbNvV+/1lOc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772747190; c=relaxed/simple;
	bh=NEUpXBPJ9dEtS2fWmU+0dR2QDjspzcgcqiZEmv2uSmU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HhhzSiQsQ3stYEM7OvsCOCA3JOgXOHl0Cs6KuY1rn/CLm34RXoYbeT0WeTuPB3VLCn+7GqIWXqKXewy4hxGXaOk1b7EGdBfvN1mmxXSuZ6CTSf+KfsuH9XtYxSDliRMn7+FADYtpawwreEONWAxpLpQR2dL74vMxdyrNE6nPxHs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hsF3iFgZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cafOXYp5; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hsF3iFgZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cafOXYp5"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 625Kmfac3136718
	for <chrome-platform@lists.linux.dev>; Thu, 5 Mar 2026 21:46:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pMdwalXJEavN6LV6CAE/53Eqg9eopdoniYo4PZb2D4c=; b=hsF3iFgZR3eFh6Ua
	8327APE3WHi8P+d6fNwAgOeZkBA7nU/f46nx0tJOzdK+dQl1mUb1mq1x+YiANJp0
	I1GuI4e/GaoeDdjwQb+St9rfI9y7MqWyBz4m5Zwmi6XUFeS/TwygmH++HSfneFeu
	xS/LQxdbaLeNZDvra23uALJ4t6q/5eQIIrxKq93g/I6j+0Cji+dm+0N7fr6xzTiK
	RNL3FSlM0VhToCUb5dUT0iKFOb6lqFDhv8glQwvmkyXyFgj2RHeC8McMjhTvQ3ar
	M+dNBv0iH6X1ejSPi+62L2hrLHgOQYxx9kKdsHP1E3gdJflQnXe09MMvi5DxJJbm
	OzwKJQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cq1pk3hwu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <chrome-platform@lists.linux.dev>; Thu, 05 Mar 2026 21:46:27 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8c71304beb4so1287222785a.3
        for <chrome-platform@lists.linux.dev>; Thu, 05 Mar 2026 13:46:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772747187; x=1773351987; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pMdwalXJEavN6LV6CAE/53Eqg9eopdoniYo4PZb2D4c=;
        b=cafOXYp5xrM+6yk4aSTVKVfh7W8DI4Z3bujB31nwbq+doR3Fww5DIkqrQRfcM2oNcL
         TjZsPfR4/CxtFBRFaRFQYsIbfAWYvBvGjzggIuVek9BUUqOa9OlvHw3PAxrZ/YLBAlbc
         4rf4Kbm1e7DLLtrBVnqvdYnxDDbdpWMW7zr6mYH3nLKE87F+hVbSxLEErEzFvrdnH598
         UtNlUcYT8OKeA1YXr+PfHnQJ+FkgdJhJy0UiEhQ98KlcdhEiQKU60MGCYA48baC9mki0
         pGNxV6TJCV8MsWCXEN89f9mqm9e9n+qdwV4rIg0eHQHOOSiwMOJ+BDOW5tvJkUKbbt3j
         85cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772747187; x=1773351987;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=pMdwalXJEavN6LV6CAE/53Eqg9eopdoniYo4PZb2D4c=;
        b=pnJBRtOQni/nmCELxi0Xt4Bk+bageRoA5YITAS85VBM0CIHbz00iY8mHJixXuoHfIO
         Ip9Utp6ex9oRPkjJkuWgpf83o5NApQygyH4mC3nP5W7x0rdNFXWCMRtYYpfClwI63Yeq
         T2Csvj/vHWx4FCh2Ym2XlRE3KvblklFX9qwSmXdlZUcA/CGPOGOZuMSIVv5tiXVoqhQS
         cIwfAdchDRgaAmPlHk+Y2kRtVlVpMDKsH3cGJqH30OdH3xdwisHBG40w8tbqLwmfpRsC
         cxQioMCjOAIoYLuC0XG8sWGTUmY9Im4CSFd4l0jBpIXnGMfJSNrowSdXxXBDu3G3MWO8
         eSqA==
X-Forwarded-Encrypted: i=1; AJvYcCV5HEi7g05UJXW+OqepvPiKW9u38IflPDzWv5EPo7BZK61MIymxNvWQ2l6EZz6pQy+6yiqWPfcm++iTW8M0AUw=@lists.linux.dev
X-Gm-Message-State: AOJu0YwJLqL+/CKCAkYF1/QZqN2qfuZrwlge12T8Zgl/AgLWjGwLYYKw
	s4Kmx+f+VUIbsTls10i5vWcVIPiOoKIv42qKvcp9YSxqClrvbgvjHc9iCijnQTunX4Ndi/FCnh9
	YwuRohtbOJRjYDPU3GrKjlKjuctRJkmiVLRd5d8nUmm2MkwRzUvMXBTT46cE+wJ9NNmFHHls=
X-Gm-Gg: ATEYQzwVLEGZd7bF6zAg54fGGqcjkDAGtvAY4aK8tI+mANrsfJSb164kG8koaFGFU3d
	IgV+nn7wMHccGqAGA0TIonsrhipkPBQbsdAzmBJwbeEIcBxgTGT6Ke6A+URSLMoZfWDN3/rEdJk
	90DLsLJpp5dRhQXwakzWb7f0xvuWEtdD6M4ukYSE7lhZyKJoABqIpYJ1SyM/GSBCKpb/1gGv7gl
	AZfMYk5JW9tH2jOYcOtyJaC/ysyOfqxEu9UMt09jNZZY84XAbXbTjan07trP/V+ibh6DzNIl45e
	IkUF+fwQEhlmISaTzjOLlMRs0DDqj8wT0WQQXgNlYQotkefAUU6iF5ihlS2mVGLDWkgyqmadyXr
	zfhVIeSd2J51J0kRYIGfmtYrSeAtdp+GziINRahYEftiX
X-Received: by 2002:a05:620a:4482:b0:8b2:37ff:de74 with SMTP id af79cd13be357-8cd6d3ab314mr5798085a.34.1772747186568;
        Thu, 05 Mar 2026 13:46:26 -0800 (PST)
X-Received: by 2002:a05:620a:4482:b0:8b2:37ff:de74 with SMTP id af79cd13be357-8cd6d3ab314mr5793685a.34.1772747186093;
        Thu, 05 Mar 2026 13:46:26 -0800 (PST)
Received: from [127.0.1.1] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439ba2a58dasm28571575f8f.27.2026.03.05.13.46.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Mar 2026 13:46:25 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Thu, 05 Mar 2026 22:45:44 +0100
Subject: [PATCH v2 05/10] power: supply: mt6370: Simplify with
 devm_alloc_ordered_workqueue()
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260305-workqueue-devm-v2-5-66a38741c652@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1981;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=NEUpXBPJ9dEtS2fWmU+0dR2QDjspzcgcqiZEmv2uSmU=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpqfmcNn3k3Rnw/2EcuO2yaMfih5Vsn0i/XXJf8
 SvINHHZXpmJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaan5nAAKCRDBN2bmhouD
 136hD/9ALKD9SvFh/azG10v3UDLkpNlFun8cFPxOsqHfB7d5jt0wLAMJR5OL/G0gbo4oAOx3rZz
 T8YEb9fJN8jqmiPiXHZV46OJ6MX4FJxGF3ko3W56lIhjR/GbgdkU4oZZOUDfJjhKmjm52JL4uri
 Ety79GYKI8agwE1+zQxflWbPZ0ACvbgpu/gSfA1+uImrdNmJrXxnGczTKSzc6/cwKvrfFhRITfK
 qugeeHB6FJX98OI7B0/y5V/PxLS6HhXfQb28TXxpfHaQi2Z6At+ql1/SaeFX33rIq4NSlV1Z17x
 2AQUKGzGhYSQBFE9p/BHznlYMN4+YUsSpkilQJq1FLg50apjcVXWhbRdDTU/QlgGwiy/qn849+R
 bTeGbErLTERXzbcUgA0JDy01bNziJyp3zcwACGBgVCoc7HyfY1C+ZrrXs55ou4ZUTH74eX8e/75
 Bsj6LEgkgws/j26GPyEqX0tUEoKn4KYjr5vjMPiT3B4CjRnm2EIMQA+hd3eVIDLEF1Gx73S//O7
 P3uykwrUAg4/KbdSlO4x8Y0oZekuMvA0wECeeIsW6nBX/GLqql/R+MrycZ4s3CzNoILTJJm4VGq
 aqUNQtFjSZkEGtycfu9T0VqpOY1quTm3MSUX/d9t7UBo0mj5pjjRuYFEc0K/+Auqy76BT2ros/w
 1z93nTbelAT8enQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-ORIG-GUID: RD2xHhikCNWNvvpNir71Nz4JwX460zkQ
X-Authority-Analysis: v=2.4 cv=Gu9PO01C c=1 sm=1 tr=0 ts=69a9f9b3 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=3EgDlKgDbQZu3HAsDPoA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: RD2xHhikCNWNvvpNir71Nz4JwX460zkQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA1MDE4NSBTYWx0ZWRfX1XxWmoAzROVl
 4WCyA9PN4pKzC8PBSixm2FSCofQ/a8QrjsSUOv23Xn7x3yzQOuMAIJaFYPt9gcZP83rjqUWAD6q
 dvjG/yVO3eLEEni5aQ+stIiiRxtJG/Di230noPHyQUl/fFWCaTjL8ggF0j8dr+IqRVUBT158+nX
 oRVkvgtZq4MGPtcFYCWrj5I26U54saVfT5qkNXXU42i6z1tUQY+ppH6yh63/gAsnv72dXVn2KXh
 p1c/2mUc78dxbTvUahacZYdicfiUvWVAyzmEVjV0wk1E2goU3LAfU3TxQ1lgXSqBvSyP5GA/KAx
 eBUymHmJ07XyHpaHGveyrqN4lM9xAlh3q+y7DNkdEnC04ij8mqw5gUxtaYxX6Ch9hBgfcH8EbuJ
 zx61+UrSWidOn00ebEBfJNmRG6StCicu6aLyWUjDjhtDXuNCOERb6Vvy2ZGTnew+cQcs48BN/LW
 T2gO18d0in9gkJglJtg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-05_06,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 suspectscore=0 phishscore=0 adultscore=0
 impostorscore=0 clxscore=1015 priorityscore=1501 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603050185

Simplify the driver probe function by using
devm_alloc_ordered_workqueue() which handles the cleanup already.

Change is not equivalent in the workqueue itself: use non-legacy API
which does not set (__WQ_LEGACY | WQ_MEM_RECLAIM).  The workqueue is
used to update power supply data (power_supply_changed()) status, thus
there is no point to run it for memory reclaim.  Note that dev_name() is
not directly used in second argument to prevent possible unlikely
parsing any "%" character in device name as format.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

Changes in v2:
1. Use devm_alloc_ordered_workqueue(), mention this in commit msg
---
 drivers/power/supply/mt6370-charger.c | 13 +------------
 1 file changed, 1 insertion(+), 12 deletions(-)

diff --git a/drivers/power/supply/mt6370-charger.c b/drivers/power/supply/mt6370-charger.c
index e6db961d5818..916556baa854 100644
--- a/drivers/power/supply/mt6370-charger.c
+++ b/drivers/power/supply/mt6370-charger.c
@@ -761,13 +761,6 @@ static int mt6370_chg_init_psy(struct mt6370_priv *priv)
 	return PTR_ERR_OR_ZERO(priv->psy);
 }
 
-static void mt6370_chg_destroy_wq(void *data)
-{
-	struct workqueue_struct *wq = data;
-
-	destroy_workqueue(wq);
-}
-
 static irqreturn_t mt6370_attach_i_handler(int irq, void *data)
 {
 	struct mt6370_priv *priv = data;
@@ -893,14 +886,10 @@ static int mt6370_chg_probe(struct platform_device *pdev)
 
 	priv->attach = MT6370_ATTACH_STAT_DETACH;
 
-	priv->wq = create_singlethread_workqueue(dev_name(priv->dev));
+	priv->wq = devm_alloc_ordered_workqueue(dev, "%s", 0, dev_name(priv->dev));
 	if (!priv->wq)
 		return -ENOMEM;
 
-	ret = devm_add_action_or_reset(dev, mt6370_chg_destroy_wq, priv->wq);
-	if (ret)
-		return ret;
-
 	ret = devm_work_autocancel(dev, &priv->bc12_work, mt6370_chg_bc12_work_func);
 	if (ret)
 		return dev_err_probe(dev, ret, "Failed to init bc12 work\n");

-- 
2.51.0

