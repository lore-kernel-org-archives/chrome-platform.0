Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33F22401486
	for <chrome-platform@lists.linux.dev>; Wed, 29 Apr 2026 16:14:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777479291; cv=none; b=BgggZ0ZWq5lFpI7wCAVfDyhjKoDUijUPjRxedAoxRgq4l8gq8PmLJFdWiPh1tygKt/ZrUeJaffsYA4tGsyQJLkiN1RccxlpR9jtKVZhu59jXTg3E8kiKp+/nhPzZLBA0i4oY+HBOcrRX75GCxMZVICypu6NQD4szYtK+uUruBaE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777479291; c=relaxed/simple;
	bh=j+dZZjvhX3/uWmfqgcfNW8B38xnfwi9TQ/BZm/YnRHQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=trPYbb1tTM0Bw01t3TnwRz9WSZu2tb1wohpTbwlpDt3vRNXxvxnXctAQDsV4E+RAMb2VMRFPlrCz8u7n+0evyZkWMzy+5GxuiF/ToUQ4ZydUz4J0X1LeJia5u+AP5OhX11grCJWwA5TY9FQydmcyYUGP4Eigu62yw5YWTh/yA7A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XzAoSMb9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=T2fel9lj; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XzAoSMb9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="T2fel9lj"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63TFOCTY1728671
	for <chrome-platform@lists.linux.dev>; Wed, 29 Apr 2026 16:14:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=QzXG7s0ro7q
	CMWOD8nEVlnf4H7DSkLvufeY3TSsikco=; b=XzAoSMb94Jjx2djznZFI/GiHPzd
	0wpZslkvTKqC4BPh//sY/9WpNVsBGp0oPuKHEbotnnc6k0UYD/fHTfOuu54JNhu0
	lPpo2S1c2EFe7EK5QsyhN0NlJXCKdj6MZ0VON0KiIOh46xG5MN+QWzHBl7uEU3WR
	BlHj7KH2YT38M2YkTYO2LyfcgR81kQZF42xIX6WPewnd8dOPXvca3VIszrjbBVRn
	3VtfAeLClAoAz8MWBStYLSLZk9O/O0zoOJ9CMXt+dpYD5dbStbuyoRi1LVwnJhV8
	OQJSWjnIYFtB+I0U1wMPhBNgR93rI5rDKpTdFOuGqciqkCdtwVx7JjAAMog==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4due5ksw3a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <chrome-platform@lists.linux.dev>; Wed, 29 Apr 2026 16:14:48 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-56d849e9277so23751642e0c.1
        for <chrome-platform@lists.linux.dev>; Wed, 29 Apr 2026 09:14:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777479287; x=1778084087; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QzXG7s0ro7qCMWOD8nEVlnf4H7DSkLvufeY3TSsikco=;
        b=T2fel9ljY5/13QX/46AQcHnl8WNSCkXEI2yAR3JIjWvzVXElU7ZF1+0FWjGXdWF8YV
         CllnAeBM4cDXxfc9u0ZChcZHVpct6SPdQT744mJrO7EJXAKTxK2u9Fnk82MLsd1Kjezt
         NlSlywik3WmLLv6x15p8tHF+1ki8Xrroh3JVTZbzdEqtpJ+s9x7X6N5uCSodxw3oKbat
         Rj/qi+L4fwG4cA3Ppi0sqfUJOmws0u5VJSPTqX0RljUIy65BCRhwYK3sVciHS6MhkXIg
         1jB34I/gBAA5uZDIkZDC6vTL+CGkxFmvjIScDYeEiSZl0hkwXxLHRSxg5elzkg98IHj5
         ebQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777479287; x=1778084087;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QzXG7s0ro7qCMWOD8nEVlnf4H7DSkLvufeY3TSsikco=;
        b=jb+qwmKtc44bcONPW0YuofzwgiyTmhcKTvH3xzznDYg1/Oe9Ji+MTbxOo9iFZI8C39
         j9BvLtTB8kAPaFmFLMSWPqTDHPPC7gmW7TCcypJP0eex5F96gsw4UWx5v9z9Lngq9wK7
         5xP63ykP9CpFeMzPo+oJ3nbvpWGXouGSBiOZaCy7NGTkhZQvAouGdJuL+VaHH01nAX8F
         YhMg5cARvioUax0htS4SbCAywZf6uK17KqWv/esYfF0BTlbVgwR27wnH5wlGi/0si382
         ki338J5yfhR3MQRP849494eoF1fcmY7xqp5AQF5Q3lWmGXfseA/GMKuZwoVr6lgkkEOW
         ZSbQ==
X-Forwarded-Encrypted: i=1; AFNElJ8dSMgW3bkmck25LWxUnirdUQ1v+ePlWB+gm0fC+8Qq8yQPSnaL3PQkl3gfhO7euXrCjozivCiHoytYPUblR5Y=@lists.linux.dev
X-Gm-Message-State: AOJu0YxV4eub18JwU1j7wcNwM4SWYGajXqUQ8NkpmgF9OvvBXO9qbXYU
	GUNQzrUIVeMsIB0T8l1CPfNCwn/odCdM+pujNzRUqI23czXYTSjfjT1cfN1dKLSkqP2UWM84YpI
	K/46A/rIMJmj9UJKLW9HSEvKgbWwnuh1Ps2I2k1/m5HV4F8rCuR4eJQHYr63CONW4hWEuJN0=
X-Gm-Gg: AeBDieubOA8Gw/cttuDxQFyOSzGgPg+rEytStu2HqfM8aFGcRrSGEgkBjPaVN03Kj6x
	p4ZKCExniqCH++2smQu7KhCysH8WtQAzCN7VsAI1qHIqI9qA0Pq3xQ5KRT2smSIy3GDDU6aRjlR
	LXpsPhWleQ/YfskDpTkFjCGwpjwaG/W4GoI18n7zFEhtwjhlusn2iAY9JUsyo1mBEWuIcpR8P9p
	i1gqlXAR2hbr7YgR9UClgjRyrzZIlAlcIpxR7P7pbfOffOkeOWKvL14mvFFQsy00xrNO9tBrxtX
	RRHW8XMr7GeeRtNZe3xEwCVcV8bUg7ITrLL22Wc5++WKsO/mwtm+C5BUzM9Hw1pVgsVXhUpu7WU
	jLZnz+Y9bEeSlxGtaqUhWo+/+wDTaOIIFDDb1K9V47SJ7lRVU1Igs9XOXVQc9
X-Received: by 2002:a05:6122:288c:b0:56f:1bbb:83d6 with SMTP id 71dfb90a1353d-573a566e5f1mr5070859e0c.10.1777479287105;
        Wed, 29 Apr 2026 09:14:47 -0700 (PDT)
X-Received: by 2002:a05:6122:288c:b0:56f:1bbb:83d6 with SMTP id 71dfb90a1353d-573a566e5f1mr5070740e0c.10.1777479286228;
        Wed, 29 Apr 2026 09:14:46 -0700 (PDT)
Received: from mai.box.freepro.com ([2a05:6e02:1041:c10:ae20:597c:99b8:d161])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a81ed659dsm2438525e9.2.2026.04.29.09.14.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2026 09:14:45 -0700 (PDT)
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
To: rafael@kernel.org, daniel.lezcano@kernel.org
Cc: gaurav.kohli@oss.qualcomm.com, Zhang Rui <rui.zhang@intel.com>,
        Lukasz Luba <lukasz.luba@arm.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Lucas Stach <l.stach@pengutronix.de>,
        Russell King <linux+etnaviv@armlinux.org.uk>,
        Christian Gmeiner <christian.gmeiner@gmail.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Guenter Roeck <linux@roeck-us.net>, Joel Stanley <joel@jms.id.au>,
        Andrew Jeffery <andrew@codeconstruct.com.au>,
        =?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <linux@weissschuh.net>,
        Benson Leung <bleung@chromium.org>,
        =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>,
        Avi Fishman <avifishman70@gmail.com>,
        Tomer Maimon <tmaimon77@gmail.com>, Tali Perry <tali.perry1@gmail.com>,
        Patrick Venture <venture@google.com>, Nancy Yuen <yuenn@google.com>,
        Benjamin Fair <benjaminfair@google.com>,
        Heiko Stuebner <heiko@sntech.de>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Amit Daniel Kachhap <amit.kachhap@gmail.com>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Amit Kucheria <amitk@kernel.org>, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
        chrome-platform@lists.linux.dev (open list:CHROMEOS EC HARDWARE MONITORING)
Subject: [PATCH v3 04/11] hwmon:: Use non-OF thermal cooling device register function
Date: Wed, 29 Apr 2026 18:14:17 +0200
Message-ID: <20260429161430.3802970-5-daniel.lezcano@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260429161430.3802970-1-daniel.lezcano@oss.qualcomm.com>
References: <20260429161430.3802970-1-daniel.lezcano@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI5MDE2MiBTYWx0ZWRfXyqDV+qXSBh+Y
 ue8YazER6B5oVz/ZWp//q8h7KPF7v1Zqc871YHHHeMyS8PtIGUGL55rNVaEfu+S//HzAPneYCaA
 b1qtkQfa1aVg1cRdNwdzxqjzc0mJBh8M/BHWp6Gcz4bNe7jiIHNjLJE5JwIbhoG/Z1v4Es0/XoX
 O9lycnjGinFT0dyw8ylYH6RBLUogDpHDyHnzggfvTu3P9WXJTH/OpMbIVR2SuRUEFmMJoHbBdjN
 pZvKJrDB03hMgINZkI9HmbLciRfwrhKy02DiBlKVkX0oki0p65cFDm1RpUlpqrfhgtnTEUyqiku
 QfmkWI1DLsnnKzePzEHBfTFMGhXFeoCDydSjUq+KCWNJWZSPEF35Uaog4ZM/wq9zbtt/2bI//bz
 E+VmJuwObJ8Hdsf/OZxxkmuQwArisawotfMXo1CUp7tFiDlUSMYqq9Cy1X0axLVxVZKdy9cYhTb
 HqavN3xWgwO0WnIU8BQ==
X-Proofpoint-GUID: swQFABAFA49n7jBHbdCN3cDHzggNYINQ
X-Proofpoint-ORIG-GUID: swQFABAFA49n7jBHbdCN3cDHzggNYINQ
X-Authority-Analysis: v=2.4 cv=CL4amxrD c=1 sm=1 tr=0 ts=69f22e78 cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=xqWC_Br6kY4A:10 a=A5OVakUREuEA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8 a=_jlGtV7tAAAA:8
 a=ggIEzLyBpZPC2L1Vao8A:9 a=hhpmQAJR8DioWGSBphRh:22 a=nlm17XC03S6CtCLSeiRr:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-29_01,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 adultscore=0 suspectscore=0
 lowpriorityscore=0 impostorscore=0 spamscore=0 clxscore=1015 malwarescore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604290162

Make HWMON drivers which are not based on device tree to use the
corresponding non-OF functions.

Signed-off-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
Acked-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/cros_ec_hwmon.c  | 4 ++--
 drivers/hwmon/dell-smm-hwmon.c | 4 ++--
 drivers/hwmon/mlxreg-fan.c     | 4 ++--
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/hwmon/cros_ec_hwmon.c b/drivers/hwmon/cros_ec_hwmon.c
index 6cf5ab0f4b73..77dd9f28962d 100644
--- a/drivers/hwmon/cros_ec_hwmon.c
+++ b/drivers/hwmon/cros_ec_hwmon.c
@@ -532,8 +532,8 @@ static void cros_ec_hwmon_register_fan_cooling_devices(struct device *dev,
 
 		cpriv->hwmon_priv = priv;
 		cpriv->index = i;
-		cdev = devm_thermal_of_cooling_device_register(dev, NULL, type, cpriv,
-							       &cros_ec_thermal_cooling_ops);
+		cdev = devm_thermal_cooling_device_register(dev, type, cpriv,
+							    &cros_ec_thermal_cooling_ops);
 		if (IS_ERR(cdev)) {
 			dev_warn(dev, "failed to register fan %zu as a cooling device: %pe\n", i,
 				 cdev);
diff --git a/drivers/hwmon/dell-smm-hwmon.c b/drivers/hwmon/dell-smm-hwmon.c
index 038edffc1ac7..47b373ea6db4 100644
--- a/drivers/hwmon/dell-smm-hwmon.c
+++ b/drivers/hwmon/dell-smm-hwmon.c
@@ -1161,8 +1161,8 @@ static int dell_smm_init_cdev(struct device *dev, u8 fan_num)
 	if (cdata) {
 		cdata->fan_num = fan_num;
 		cdata->data = data;
-		cdev = devm_thermal_of_cooling_device_register(dev, NULL, name, cdata,
-							       &dell_smm_cooling_ops);
+		cdev = devm_thermal_cooling_device_register(dev, name, cdata,
+							    &dell_smm_cooling_ops);
 		if (IS_ERR(cdev)) {
 			devm_kfree(dev, cdata);
 			ret = PTR_ERR(cdev);
diff --git a/drivers/hwmon/mlxreg-fan.c b/drivers/hwmon/mlxreg-fan.c
index 137a90dd2075..860de6cfd8a4 100644
--- a/drivers/hwmon/mlxreg-fan.c
+++ b/drivers/hwmon/mlxreg-fan.c
@@ -583,8 +583,8 @@ static int mlxreg_fan_cooling_config(struct device *dev, struct mlxreg_fan *fan)
 		pwm->fan = fan;
 		/* Set minimal PWM speed. */
 		pwm->last_hwmon_state = MLXREG_FAN_PWM_DUTY2STATE(MLXREG_FAN_MIN_DUTY);
-		pwm->cdev = devm_thermal_of_cooling_device_register(dev, NULL, mlxreg_fan_name[i],
-								    pwm, &mlxreg_fan_cooling_ops);
+		pwm->cdev = devm_thermal_cooling_device_register(dev, mlxreg_fan_name[i],
+								 pwm, &mlxreg_fan_cooling_ops);
 		if (IS_ERR(pwm->cdev)) {
 			dev_err(dev, "Failed to register cooling device\n");
 			return PTR_ERR(pwm->cdev);
-- 
2.43.0

