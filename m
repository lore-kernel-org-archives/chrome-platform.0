Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E44D388383
	for <chrome-platform@lists.linux.dev>; Thu, 28 May 2026 08:48:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779958083; cv=none; b=YLkoRRYZ+XtfFaXAhD9bdABM9hgqFPWLAlkVpbKQD8Zscld/bXly5Ou8Byl+3p8L3qz89QB48Xdim6SgHdcVf80/QxK59zCoX78ASfnv8XtBl4Gul5YmHBx4XUK1RxrGV6nnUZOPymZlK5HybJkkroLxFQ0bYu9+AuUxCO3H0zg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779958083; c=relaxed/simple;
	bh=SiiQ/8Pjo3hRAm8eRhuhyDhrCISkb1+d0Fn6rjQzIcw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QDrUs/zjUKwqOsX9hJCK0K0Zd3Us9I9g2g8WRxN44po4DV1ciSexPP2eori5vlj6FvuoOtNupuKy0ePTutvO3qaHparVlDw5AaA92cEmXMToggF4pPOQQoo0kCxVcj+C7u3sDC5Te9YbTe9829jqa2RuX/ZRN7fht1LU2QRkapA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=D06xo4wa; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Jrr7E/6L; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="D06xo4wa";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Jrr7E/6L"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64S7QBTb4188550
	for <chrome-platform@lists.linux.dev>; Thu, 28 May 2026 08:48:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oFz3XJI2yGl2SLYBsBNIOMTHUavJ/xUAME7pr/mxKvU=; b=D06xo4washJmnHQ4
	rbdbXIkPWeykYMtCpytbUnX06Dc7JDPdaDUaCt30fH2JwVLIdgHoEyrMel+ArvdU
	FDLAtI3865Fzwnf/u0kK0JtUcC/bUROA+//1yjx3EhM3ztWJ3gamyO38zeSkQtQU
	0zQCfNgjFgGsQFYC1VkDdRXV1HUL4XXFCNljo4HJYVNihs8Qdm+J7fGNRiAz+8wD
	b7KO1DS8j3JitasiMXHXz+2Ble8PKbB3qJQ3liPnRfQNvB8S82frDMXU56o5BIRM
	8yPaawnmA4yGkAQaEFjLoHGtduge7DpdMhB4aEjgv4haVv2j7/nUuzboyN/U9iqn
	mpp7Mg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ee7y2t23h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <chrome-platform@lists.linux.dev>; Thu, 28 May 2026 08:48:00 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-5104b861649so48394681cf.1
        for <chrome-platform@lists.linux.dev>; Thu, 28 May 2026 01:48:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779958079; x=1780562879; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oFz3XJI2yGl2SLYBsBNIOMTHUavJ/xUAME7pr/mxKvU=;
        b=Jrr7E/6LPh4og2PlgyHSmrJdLyKCYkr8Ugn8865fsfgKmWISYRmg0d5khXIwJonmCe
         x+Y2hm9MKcyb0ZkhEa7MvIwCkfVWt8BiU5FsrQWUHIBqn7q5G37XGYj4bRmesrZXd1fO
         lq7Mw9LBjbZQRCsSZFiCTvkjEmbn5fvRHEZhP3xbU9bEdi2UB0JiX3mAQdqkwQbpLjq2
         yo7ktLqjAiH0IRXhnzp9QveODacetK0zXC21JSE8kI9Cv6qsI9uQdAPkUvZVx6AYVaO7
         cHc+EswN/22a4LbToigs1jKUgWdUTyzT0r2iyzvFdX12F3jN+4zE0Io30JA/VVWgvP6F
         v/RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779958079; x=1780562879;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=oFz3XJI2yGl2SLYBsBNIOMTHUavJ/xUAME7pr/mxKvU=;
        b=Iz2dX5v2xkvWs7j/VQNdgflUuVnw3+btgQoFtihM9GJVAnoMqQ8sE5zh44jFaq8Hvw
         dYY4v0DNrlIjTubwB6EwvBGYb6SK5n/syJzmvI3ltbH9SNDE4Jik7ZT1qQ1EAoWPFq5K
         64wcYatLmGWgKoujtQ+N5D6u6dkxUlKxSbdDtbY6RhmjOLnuNQGlia5+IVYMJiCuPXNK
         22+zzPug8f510QkFtDlcq3MEQoMmqe6vyldRVBUO/zH7udEEmtO29HG+fz81vianSZm7
         VKNUbY9lemU3AF5B589IhoMPGTmKA1Db7NqzI+u1KArmdzjIApWhf2yzlrYVH5AsXuZ7
         xWmg==
X-Forwarded-Encrypted: i=1; AFNElJ9MIuN4VfdebrgdP38zgd9d+hFR7EWuJXgumR7vuja82Azj+pHB8MRJ9q/klGkyngaLlGk1pRINOuyL/nuu6b8=@lists.linux.dev
X-Gm-Message-State: AOJu0YwjC1vv/7MwcmDYOktRmw3TbC45/1+CyeZJVM7CdJv0kdYxfXZV
	St5pvqLy19cfI9P6p3ylly3K8UiGMZsHTr+TqJH+3asEdDry9RaObmx9kPDmvo0TAEUq8Wj1w5E
	Uz6h6Q8fEW3yI9nQkPd94MoHBTowNDZB7+jZF8lZK3inikagVYLqzJkCIKX/6Nkm/TTwbdSM=
X-Gm-Gg: Acq92OFmUmXcMPd5JaZ3fp8Ys/KQV3P7ro3sZ8Wyv49CrgtmmV3qKotdN3D6zaSbbaj
	Jo6E1EYH26XVi5kv6DeYp3K7gRiR0uxZnTsilaSHUW0MShBhgf+BOmcpn2b0lglus7ff+2mYYG+
	KpVZJw6X+oHlrCU+CDoWQiW14MyB1/mb9AKh9mgVrG2Eueedv/4KsO/pV+5uyB0SwUm9d2c0Tny
	bSTRMrebS2E+Y4F85O3d4i9YvezEFRFGHRaaZxpYY4/455entmp4VYIniUwPcsL6i0FoqAiwTkj
	5+xjfl+ajBavK8QrLu6keFB6Tulc6A2wApaFqsETzNkgDZ7+xV/9o2s67pwFyYvMfR/CXSDdHs/
	U+9ulG6cMLuhn1XmkzW7SEyKOpiim1a2XnbErlPOtFgIu9m1/AbIpwtv1+XZT1+Kk1YnA3IKDFv
	upuRjw4lUZhRyAoMMllWCfRIzoMg==
X-Received: by 2002:a05:622a:251a:b0:517:14b6:a2a2 with SMTP id d75a77b69052e-51714b6a335mr70490141cf.27.1779958079285;
        Thu, 28 May 2026 01:47:59 -0700 (PDT)
X-Received: by 2002:a05:622a:251a:b0:517:14b6:a2a2 with SMTP id d75a77b69052e-51714b6a335mr70489891cf.27.1779958078802;
        Thu, 28 May 2026 01:47:58 -0700 (PDT)
Received: from brgl-qcom.wifi.ville-nice.fr (62-193-63-110.as16211.net. [62.193.63.110])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4908f0afc77sm10817465e9.33.2026.05.28.01.47.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2026 01:47:57 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Benson Leung <bleung@chromium.org>,
        =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Guenter Roeck <groeck@chromium.org>, linux-gpio@vger.kernel.org,
        chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Matti Vaittinen <mazziesaccount@gmail.com>,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        =?UTF-8?q?Andr=C3=A9=20Draszik?= <andre.draszik@linaro.org>,
        Robert Jarzmik <robert.jarzmik@free.fr>,
        Aaro Koskinen <aaro.koskinen@iki.fi>,
        Andreas Kemnade <andreas@kemnade.info>,
        Kevin Hilman <khilman@baylibre.com>, Roger Quadros <rogerq@kernel.org>,
        Tony Lindgren <tony@atomide.com>, linux-pwm@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org, linux-omap@vger.kernel.org
Subject: Re: [PATCH v1 0/3] gpio: Use named initializers for platform_device_id arrays
Date: Thu, 28 May 2026 10:47:55 +0200
Message-ID: <177995803708.5037.5318741720946502441.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1779893336.git.u.kleine-koenig@baylibre.com>
References: <cover.1779893336.git.u.kleine-koenig@baylibre.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=VeXH+lp9 c=1 sm=1 tr=0 ts=6a180140 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xizqlaZpAqmNt8UN1ov9oQ==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=VaStRuOlacOtyYye708A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI4MDA4OCBTYWx0ZWRfX7Bu/XAzKKnx+
 voPfit0jkvW81oHg8ovbDAvCWaOt6BCIK9UQOpcwAFPCLWDAUnMockTLD9mbt7ltmouBElBW1eV
 FrSkdZqakGQw+7Oq6+CqafnJBT879nTg3sTt0/1QAzn7l0PbSFnOOtrijuwmJbn+kTbNHyKvlQg
 FJf4gJj1nu4H0nwRjljFNqCotez9BZ3erRS+z+1Arf1eKxuTfIn3Q7gWanDqUK6chLPsMBmDp7Y
 MuFSXO7ZIM3rWmOlzl/IXzO3OhQiuLdu+7i7ssI7EkhcBeK478LD7khZsnkKXjzZRlydWnVWu9I
 UzmsFvrsAs/tTBahlLVldLLj35IO7PFITfB5Yi3jTFqcKRvdB8e6EZA6QbLqyVUX2mieeyFrQB9
 moRWHmX6VYmnArqSBBqv1GiWeMwnQuqEg3WBBvNQGDWkOJSCKMjQjCZKU7aMJrV+7TnfbPsV5uu
 6cpPmMkL+mUu+saaE3w==
X-Proofpoint-GUID: Dp_omElvAel_vv5iqEhrdMcLc1mrcHrl
X-Proofpoint-ORIG-GUID: Dp_omElvAel_vv5iqEhrdMcLc1mrcHrl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-28_02,2026-05-26_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 adultscore=0 lowpriorityscore=0 malwarescore=0
 impostorscore=0 bulkscore=0 suspectscore=0 clxscore=1011 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2605280088


On Wed, 27 May 2026 16:57:26 +0200, Uwe Kleine-König (The Capable Hub) wrote:
> this series targets to use named initializers for platform_device_id
> arrays. In general these are better readable for humans and more robust
> to changes in the respective struct definition.
> 
> This robustness is needed as I want to do
> 
> 	diff --git a/include/linux/mod_devicetable.h b/include/linux/mod_devicetable.h
> 	--- a/include/linux/mod_devicetable.h
> 	+++ b/include/linux/mod_devicetable.h
> 	@@ -610,4 +610,7 @@ struct dmi_system_id {
> 	 struct platform_device_id {
> 		char name[PLATFORM_NAME_SIZE];
> 	-	kernel_ulong_t driver_data;
> 	+	union {
> 	+		kernel_ulong_t driver_data;
> 	+		const void *driver_data_ptr;
> 	+	};
> 	 };
> 
> [...]

I fixed your SoB as requested and fixed up patch 2/3 as one of the drivers it
touched no longer exists in my tree.

[1/3] gpio: cros-ec: Drop unused assignment of platform_device_id driver data
      https://git.kernel.org/brgl/c/516e4d886941568174f46985fbb7c960c516ada9
[2/3] gpio: Use named initializers for platform_device_id arrays
      https://git.kernel.org/brgl/c/2d43fb71f4ecbd10649a277e8790e7ca27acfdfe
[3/3] gpio: max77620: Unify usage of space and comma in platform_device_id array
      https://git.kernel.org/brgl/c/a8754838f83a9905af516f38dd2633744a94f71a

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
