Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D6DD34C134
	for <chrome-platform@lists.linux.dev>; Mon, 23 Feb 2026 07:27:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771831681; cv=none; b=du31SKC2oQpLbvtE6+d4Xnq1fpCE+ptJ9WGGLdcoV0Ghy77g4+txHy3SW3aKM44cjZrCigem1gsLLhYaJb94A4LRWemdtE8Vmitaz850hLpJe0JPeLYL0D1fctURFypGXAotBz1YYFKggYAWciAj6/qdey7AlG28dSJDNGL9WAI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771831681; c=relaxed/simple;
	bh=r9x2dulUi2i/xHeDpXgX0ZLrT/131D7Fe/8Z5nmd+1c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KKSB+M0KJTPWzNnEBxKv+Vrb55cb0dXt4fmo5iyatG8s17H5FAgGvJyzGfN9Koy50KPwkIWkNctIvm0Dgx6eBpJgwHhorXhSUiBjHpNo76ea+iWoagGoWAxupMzrAfM/1fMm20ubO2dIU7x6s7nHSRZrDjvl/gCjBziHAVBvk4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bXFefgdh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Utnn2Imf; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bXFefgdh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Utnn2Imf"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61N5QSh62917608
	for <chrome-platform@lists.linux.dev>; Mon, 23 Feb 2026 07:27:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nrZc/Z7Be2A9y5DqcniQ9Lm/4gP6G87E802BvnTYUp0=; b=bXFefgdhxPDsuijE
	pYnRuIw6NL0O9YNgYItg1nt7i4ZCQEWOoOkFJAUghwrB+umKaoiUYEtnZpPxNNPv
	OlxrAGmuu+grnE0hac0PCqTo2xII88LwC3ifwVKfvHze7LyFkgVMOAn4C6uMF0YJ
	8jmAdcTJaXVqOp4YC+mru81BehBD+pO8nU349x98rPbYDSELkEAXuHO7UYcyA+yV
	K0q+d/6efiT0GCyZpTSr8tHZ67dyXrgpKBBLC7c8thjs3hNPl4RTemJhOjlQSZX9
	zgOUbR4t5ODWBY2zjHg1jkLRKO2p5vtjTVKJ21Y/ynHGhui94xPGB13nXFD7ys/s
	uWY9GQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cf603ks6m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <chrome-platform@lists.linux.dev>; Mon, 23 Feb 2026 07:27:57 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8c711251ac5so3535956385a.1
        for <chrome-platform@lists.linux.dev>; Sun, 22 Feb 2026 23:27:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771831677; x=1772436477; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nrZc/Z7Be2A9y5DqcniQ9Lm/4gP6G87E802BvnTYUp0=;
        b=Utnn2ImfuLTC3D56+Et5vdXZJ5KvfJA6GPyK1AN64F8Cq0tAKwYJyvgvKtsGkAYTj6
         spv/8VM5hAMkIPEjOWVJOzTCrbp51bpKffy3piuhhd7efFWw+ZfZUqEOd85rQg3VARjU
         yZpIe6F5l7a8fNoMxqCtvhKFhN37bsYzUWQrdxl9vRisZ4RJaiiIv1y/BuaYLoat3Upv
         Yx3ioeQVHvCFY9XC35dQR+5pFuePokIR5RkV8JSuJ/KF/72JPYXBbbsHKg6+NzO3s0UA
         HRfknvbJqEib9M3zcST4i3wrixfPEZ7vX+V6SpgpI3Kizj5HkVAxGY//W0yfbKsX2cxV
         MU6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771831677; x=1772436477;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=nrZc/Z7Be2A9y5DqcniQ9Lm/4gP6G87E802BvnTYUp0=;
        b=k/OjmgaaJBQP0MD2GXEB6elma+MPO4BayVmj60iCStcgewPUQHYCOEdTW4Vrjsjk9s
         8XLh8uW+ugmPYWknIw3tLsfin6uHeBDgV2Q3kR6Z4TujfDznWPrmckW6d/SHWo35/BiH
         bw6T2gOme3HN9ZbqhmNMT7BRA+R+s6VsDFwqW14CJI5daAhlWVoiI6WzNqEmrvuhMHgO
         nIOHW8k7YY4+3w/MSZWAba9utbBMq1ySGGEG/OEozZit9e//2NnpaHxiFBXWUgCujGMJ
         KIcubCfqnXUaKr+Bz8rI4LEz8X1LA1i7HvyikRHh0bAai3ZfAQKLk2ljljMQucYAG9Ym
         J0tw==
X-Forwarded-Encrypted: i=1; AJvYcCWWqN39TnG4v9q/U0ezuNF753x/G7c6s25KQ4TPOHh0Vu7lvzYMHJhqoFqX0ea7b7tvNSRHU1Q5RzwRlKPeI3A=@lists.linux.dev
X-Gm-Message-State: AOJu0YyqVD4JnMmhv5ubxbcx+/G5d8/RDJ9fSc1lsGPdxK40YZShyaM+
	ap76JolHiyc+o4UjEZpLLYk4qnysqbzmNQ/dj0Q1iPHUzfkprymh0Ennkxnvu6sC2MvF8xieL1P
	/aRsRk51G+kH3G/NkB5DDNwzuJSAQ+bpqtzevzq0P4nALpsdU1l7QqOMErxF9tupGS2ynWAE=
X-Gm-Gg: AZuq6aIGSogng/R81mUCKatdByMtgaUIDaV4XAdGZRKgGHMA024m1LL20bvLJtlxlGr
	wQ3K5+jrAK7BU8pqYWRcYJWDOZom5ekUinRJiDZ3uvZoDpFYWt/wioVWdChDqlTLbIl2lpb/iqQ
	FPQReZxUgF0FZlCxBzWWsIo0N/ntlUsFzZpKHiUMI+htGWu1+UgYlAZEqH0hIfRKVcKha+EZ+P4
	xBwg/dd4EMzNBSXIwfAcRbzsRZO6ryKCGtd27RwPKIkL0nSKjHW6Tu4+LDvVKZYBBLYozfnME18
	a+WSjBNcZ2Rx/1RKOHRiUIKcJIaLfDZY97O3PbvsMsSm40AvS1QXsXIzFIOhHi+ssSunAc8/hZ/
	JLClEFmIPqGEfKshKrsUAvK/NvinmOT/SY+JyIzM0ktfirA==
X-Received: by 2002:a05:620a:4726:b0:8cb:66dc:9fcd with SMTP id af79cd13be357-8cb8ca740a5mr760939685a.56.1771831676900;
        Sun, 22 Feb 2026 23:27:56 -0800 (PST)
X-Received: by 2002:a05:620a:4726:b0:8cb:66dc:9fcd with SMTP id af79cd13be357-8cb8ca740a5mr760938185a.56.1771831676321;
        Sun, 22 Feb 2026 23:27:56 -0800 (PST)
Received: from [127.0.1.1] ([178.197.223.140])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43970bf9ff5sm18550286f8f.4.2026.02.22.23.27.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Feb 2026 23:27:55 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Mon, 23 Feb 2026 08:27:34 +0100
Subject: [PATCH 6/9] mfd: ezx-pcap: Drop memory allocation error message
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260223-workqueue-devm-v1-6-10b3a6087586@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=769;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=r9x2dulUi2i/xHeDpXgX0ZLrT/131D7Fe/8Z5nmd+1c=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpnAFrkKbfiaWJobMJ1uaOgm6ZHmwStj8BHlR2u
 vp1CSwCm1iJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaZwBawAKCRDBN2bmhouD
 1zVfD/oC4r95LjZ3DM+u2Ns+t8NFjd9MPKu16F32jeMboQjnWCR9YCLIRwn7Fvr1TR+ff5UtpyT
 XBgB2Rx8udmj/g956wfXJx/U4gpvw4kMozdxk98g5ROegzSW+zpfBmSdv/Y0RkSJY7v5JcH18E4
 nWjB6GjTLB5VOxQQj3pioJknmyxmuwTELNXH+jJri9kT3Z41Bz+Klt2i8/wc91yhXb407gbpdfR
 4DvWYkfuiKiF3C1e4MhjzEzlfuG9qQD3KIscOucgJL+YRlX3Ey7sED06o+WoJPNrPK0QfFXhHZv
 NOLX6kWeE53OeTAgE187NhmpJzoj7zvcDbaBI31ndIEGgthZWx7pORQJu6zkRlU71fOtYDaid9J
 FrKtxYHV0/sGCkFHormsZ+GOapWYEhWEJR50ScVUbd9ULC4ZlxUxCBTIWhz+Lkm9Gv5VXaFcLS+
 7OxY4GcIIWlXpspwcVNxWaSdqZ9JRVxzaRyzkcKW3kuNAn523XVBOUAuM9iCufA13SLXkpczN+Z
 ZZSw0XB5klJtECmOL/uR9A38T4ef5aU9LT4QNNVIEmKT6SgLS7zCvlvFse5bWOgrryLV9WAJGQ4
 W5iU8ft6bo8owCRtIIzDxGrRgVlwrPd6TNb2HR4Nqzie8fw3AxXahDDaQMK6t5HaFml+MzTwWfh
 z7dV1TA37i7F3gA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Authority-Analysis: v=2.4 cv=XbWEDY55 c=1 sm=1 tr=0 ts=699c017d cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=6nO30s3o7FuWeffXwhKHTA==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=3HoxRS3-ReI3PdwluWoA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIzMDA2NCBTYWx0ZWRfX/s+jQFbl9gv9
 Ehg2arxeE5VhObSD4QelGnmkv8xTDEdFwH8LH6PkTBIsqPfGacL1Y8K5VJVLi5rAli5eWCGaZun
 dm9v0bQx7Jk7biUvWfC0qxH1Pn0gyMNZG9CPeTwH9Z8sepTjX+zcvuyJkZ3/S/7Hyl7xDqFIbSG
 ORlD8vJkN/sz2QaNiQUdDmyPIZG/cybj7Xo9IVg0PjBfvQ9TkGsmo0gOGCXCf4Txfh98+4s3HjS
 kXxDkTaEthdOX2YUElkeJzSB4DNV1fDrlep1rPWMn8K2sLvFKmjndFp+7ur9HuQIdiuOtuhHZJk
 SxJUnsVWZYIT7crnErHKs/8pJ4JTJmq3jG6aGREw8EiPfT7mDaKFer5MBzpnNzXMOMnD/cK0fv7
 n9dlBJB5KzKhkjYlfnX+/hvsxo7Y8Km+9+MboOPTJKT4upA53zolSZlohoHegMYSXz0jWArzTKR
 Rn89z8eaLYncaJpF4KA==
X-Proofpoint-ORIG-GUID: baqlVhQEWuMsdWptApVpE5xZBt3zf_vl
X-Proofpoint-GUID: baqlVhQEWuMsdWptApVpE5xZBt3zf_vl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_01,2026-02-20_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1011 impostorscore=0 suspectscore=0
 malwarescore=0 phishscore=0 priorityscore=1501 adultscore=0 spamscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2602230064

Drivers should not print error messages on memory allocation failures,
because core already does it.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

Further patch depends on this one, thus it should not be picked
separately.
---
 drivers/mfd/ezx-pcap.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/mfd/ezx-pcap.c b/drivers/mfd/ezx-pcap.c
index 1be4557b7bdd..13cb185638a9 100644
--- a/drivers/mfd/ezx-pcap.c
+++ b/drivers/mfd/ezx-pcap.c
@@ -416,7 +416,6 @@ static int ezx_pcap_probe(struct spi_device *spi)
 	pcap->workqueue = create_singlethread_workqueue("pcapd");
 	if (!pcap->workqueue) {
 		ret = -ENOMEM;
-		dev_err(&spi->dev, "can't create pcap thread\n");
 		goto ret;
 	}
 

-- 
2.51.0

