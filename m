Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B770A34B697
	for <chrome-platform@lists.linux.dev>; Mon, 23 Feb 2026 07:27:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771831676; cv=none; b=l/ReRjR/9I3nWdbSpP9jaRDdu0z4NNF1bbjalwy3e4rC7GRvtaIg9sz/i4MlQTechJ0lJH9doo5J/llaVg5JjpL9N55wXeSW9hPrD/FwWcpJdBCCKvAw9Iq+Q2ZUUFDlzteMkiy9M4mOLTXI+XzbW4CpiXilX4NFhXwa72TP4So=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771831676; c=relaxed/simple;
	bh=JXjiqG9T78eAGojjEK9/Zi9nDA6gm8rfDk6Pl5Nb7BE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oV6N053szj55XPJnALGyM0wz9CnV6ZT6eeyF3VJyq3JdEalq5nOV1N69rz6gbTQNSyQU1sxdG5pYiYgIgI4dOqgwh4e/t4bAewdCp/+wx0+RWILp4kw+BFT3oDmAQUUiCZqg2eNUMeBpUGEbuKxolCyG0OKlMcXoQtIPcOPKIMA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SpVHZjbm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HHTh6VWH; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SpVHZjbm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HHTh6VWH"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61MKam4l3337870
	for <chrome-platform@lists.linux.dev>; Mon, 23 Feb 2026 07:27:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	J8/2gvQaG0Yq+hSJC2X5/y/AH/3zpoF7o7r8roBAJXE=; b=SpVHZjbmZaC1Z+RT
	50XGF06GAFXw7h4mNNwaUvn09re6nys6p0++c6ufA08lkdSvfVmuzzcSI2D+p7PW
	0kbwQeoXfuQleIRzkZ1jdUEp43XPREr9XwmpZAcri4ihmzWnAWV187icZi+kFlik
	F7Avbuj12qOGhO9n9mNLtGsHKM/Zdoh0sXVWiIXvokaEX+ci3g1Wt/M8lSMV2C1I
	P1nPmHYLdQ5g12mUQjqkr1eB9K9z3c9wGKmFjWVmaDuidGQzMoz/S5R4fCoO8ri8
	5byBZT8kEdPx4TwygRme45jgmViQIh7amKpIi3MqHzxeaTxHeuF1jdpXfxOTLlKU
	5EvOTQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cf5u8krwr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <chrome-platform@lists.linux.dev>; Mon, 23 Feb 2026 07:27:53 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cb3a2eb984so1030486485a.0
        for <chrome-platform@lists.linux.dev>; Sun, 22 Feb 2026 23:27:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771831673; x=1772436473; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=J8/2gvQaG0Yq+hSJC2X5/y/AH/3zpoF7o7r8roBAJXE=;
        b=HHTh6VWHdCTGXnGnJh0a+dRYQwRFb2VKApFd5nCgIekM2TrfYSSno9+A+jIj5YGnOX
         1awGpyFQx7xqUX0k658D0V0OpwTRKtwBr1UoAjDNYSJp7BRHQsUPegnKBrHLuVbFmVMg
         mUPZ4Ebt2ZxJ/4FMrLMXyIbVn91zW0lvsbx9syFXxkqYWKFh86ahvd8WZ6pXSuPsoZbq
         Z53diXq6EwLIR64x+EWGL9bs2SgoSxdYHWbonWHnDm64NCWQQCWbh+YeTGdgHfrITDE8
         wfZSG4HOC/+yZuxZ8DxQJ3UZiBqX/v18eSNM0wsz6FlfQU2q4+vDUFqj+DbG0BszHC+z
         2Eig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771831673; x=1772436473;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=J8/2gvQaG0Yq+hSJC2X5/y/AH/3zpoF7o7r8roBAJXE=;
        b=SeRl2KqtPg4RdcriRQtzZrDFQPdZBPeIxW/lxybwAyTCss8JoOn+phBEyTQEkutbWn
         Nr2cI9Ot8ZRF2qPC88sh1YC6+5c52foezOPGsfsPsZ6c4WSBNwnzyJ4WrazL99Uq0X5P
         4i/rw5Jg1aHWMQf49v0JpW9Uwk9fL7GawSN00rxQnJgXGD7fkx4jr7oWSpLbZvUKgSVH
         8QQD+L0YuZth9awDeIUlmS2cRnHBF4WZZjibEpCKPLUnLn4FQpetWSdvVRU8I76luV45
         ikhKX+ZlJBvFA17K3ct/T1ZEwoWAJl+4KwPiPhOoFApLoGOdPDIJuuZjlED6tYs6XmvG
         Ms3Q==
X-Forwarded-Encrypted: i=1; AJvYcCUmpUYb1iezJcKMVHJEkcdV+OhDzuqlM++nx1sM/+z/lYFLnDusIEcNDO7+sAkdlVIi+YZOC5PZRD/h9z9e/JA=@lists.linux.dev
X-Gm-Message-State: AOJu0YzRoiQB5VxjjDNXHVG/OmXGitw+GEKNKNf+GLWY1vFWVIU3pmfl
	s8SAI8UGVsaGTzUuhO4s6aGqEt1wGkoyaqMlZa4gALL4Nxouj5hyoMbInXDiGp/15HNV22dwMV8
	Ln/GhF2cZdi1XcZnAdIRebt6mr2/A2msjkWjXZ5o+oSJD9xlgkSgsNYUVim944FJ4ncfNvIE=
X-Gm-Gg: AZuq6aLEzItmWpjIOxWfGKA4tpNRR1VKxCr0WlgWP/4gYoGsfdYLZvSnNYTumaD2l/f
	m08lvV25TRYD/ReyuFFBq9ZhrHgaTr3DHZdv8u1qxRgpJ8XKUohhZY7iFK2q/lej7EKVArUs96R
	i3zMfcY8sDhlpDNuGuyqelYw7sBEzjFxuJSsXijlQpyPNeF6/YU3sdjJxL1LYlmjlRdfkgiLMtv
	6ID33z/z8YfYUQhCSUTtUepfjvV+Z8HkEs7WEJxHevO5QwWOo2WUmo1rjulfPJVmF69ajME1xkw
	1Y3dNM4pkZG9HyWUKdsKHJ3IZ2l2n24Vb1Jspc4zfFq4pKVT+Ym3V42B6xnKdzaQw3qPnyqo67n
	z6PIo+LgxSdZAs5YcVEi+5CSTPvTZ7xqiqDsWZ9PBI3n6KA==
X-Received: by 2002:a05:620a:2a16:b0:8cb:44d7:39aa with SMTP id af79cd13be357-8cb8ca887c6mr919029785a.74.1771831673108;
        Sun, 22 Feb 2026 23:27:53 -0800 (PST)
X-Received: by 2002:a05:620a:2a16:b0:8cb:44d7:39aa with SMTP id af79cd13be357-8cb8ca887c6mr919028285a.74.1771831672680;
        Sun, 22 Feb 2026 23:27:52 -0800 (PST)
Received: from [127.0.1.1] ([178.197.223.140])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43970bf9ff5sm18550286f8f.4.2026.02.22.23.27.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Feb 2026 23:27:52 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Mon, 23 Feb 2026 08:27:32 +0100
Subject: [PATCH 4/9] power: supply: mt6370: Simplify with
 devm_create_singlethread_workqueue
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260223-workqueue-devm-v1-4-10b3a6087586@oss.qualcomm.com>
References: <20260223-workqueue-devm-v1-0-10b3a6087586@oss.qualcomm.com>
In-Reply-To: <20260223-workqueue-devm-v1-0-10b3a6087586@oss.qualcomm.com>
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
Cc: driver-core@lists.linux.dev, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Sebastian Reichel <sebastian.reichel@collabora.com>,
        linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, chrome-platform@lists.linux.dev,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1484;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=JXjiqG9T78eAGojjEK9/Zi9nDA6gm8rfDk6Pl5Nb7BE=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpnAFp9FpdXlORK3TYpQCMwkXfvfWNBaac//1X0
 vhPZnV5DAKJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaZwBaQAKCRDBN2bmhouD
 1zzREACQTNEy+SyS8bNuKjvXbhz5E4jN7BzYOJgWNyNmgpmJ/J0B04PSNn7WhRDzfnj20zlc3no
 4Z7M3WMZLj5DqvNNbRKuKmcYK8fumg/o8XU9WV33VRrFKXZHZ9fTesJOPKo2Ldub65X3GHGkqK7
 DpQ4aC8bK8O++YJp/QxQn1SGyQaJisOtMDOrk6nsOrOmZi3FftfnDF1yDgBmbHSZgSYrXGYFxJx
 LOA8z0QczvhcVAZdmENDdCbXK5OArtY07J0o/Gv3rHQ+2PvZmwswyFz4dsaQ4ckWnsX3VQ2rDTw
 i/gsWSxXY4M6NXKOo6267SGHkuwUwJhyALG8NwGGNncwrbNGuChatk5zV+ia7yiWwoRm4kinVV5
 H5hMs6RMj1luoPCIO7NhYLwgePLg7PEQIyL13bkMLl0ZAtO7InkRRbRBj1Sg4LrruS3gg4QOYFH
 chibkuHJZsfg4m5bL7vjeqDilJ228Ymmh1vH1CBdvvfmHKziimERsZvPLv+dF0BXo5LwFpPrNrn
 gqno1C894RfGiUYOj9LEKWcVleHEfiUd7WIj1WnDhgVnrmuuN6W2NqNSR1fYWKBUnzm57jZK4Ie
 eTOZPwdVIE8s4gcOtEZ2LNfkUjadTTtP4gjawJ6JsI6T9QM50P9nuFwrhox4a3nhNO3DJnk3qc1
 ZnclO3WsVt0zb8g==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-GUID: fL4YQQxMhpMHtpQkGrcltnOmyM53CUFr
X-Authority-Analysis: v=2.4 cv=cJftc1eN c=1 sm=1 tr=0 ts=699c0179 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=6nO30s3o7FuWeffXwhKHTA==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=ztnre8jBXG8j2NFRlM0A:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: fL4YQQxMhpMHtpQkGrcltnOmyM53CUFr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIzMDA2NCBTYWx0ZWRfX8ezDxTvdSbCS
 PZ056u8z/b3UU9jq57j3//QlcbzjAaZ5H94/F6Yk4aY6CTecyAHx/QM2qbTgws8IHG6Obi4E1z7
 hO6Rbh1tUqke+iYG/QLp5jtLXEhGv59irlGjCefwvCvVgEYTw1qxedPkDDvIYnip3V3Hr1Db39k
 2mgLpeyy7T+Av6jbKenOWpb6ES2qUXMrEBRqXHUoAJOCLyfX5sjElqvpFkdz7F20iMkkQzZevFR
 7+4KfgNQ5P6kfLs+FDKHcqZL3SecptsWj/3VjnI1bbOROD7uT2SDLZ/gnpdIvGSqKchj8qaDINn
 2cscqxoZKGR0KRzMStSZsxQZIv9WjP5nCWyQRa/SXF6m7Z/2oQTQARgvTHc57OqPGUM7mXwWzmL
 l/86ihAHkCwnZQ5by2pBr7qvXhBk4nDQf0yYyXn9wQ4NmsStDjJlrW8DVR3hPf260aC79D23Yvt
 bpxPZyAU39DKfbqP8Dg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_01,2026-02-20_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 clxscore=1015 malwarescore=0 suspectscore=0
 priorityscore=1501 lowpriorityscore=0 phishscore=0 impostorscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2602230064

Simplify the driver probe function by using
devm_create_singlethread_workqueue() which handles the cleanup already.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/power/supply/mt6370-charger.c | 13 +------------
 1 file changed, 1 insertion(+), 12 deletions(-)

diff --git a/drivers/power/supply/mt6370-charger.c b/drivers/power/supply/mt6370-charger.c
index e6db961d5818..f671fe62876a 100644
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
+	priv->wq = devm_create_singlethread_workqueue(dev, dev_name(priv->dev));
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

