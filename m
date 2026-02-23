Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AF4634A783
	for <chrome-platform@lists.linux.dev>; Mon, 23 Feb 2026 07:27:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771831668; cv=none; b=Fba+QVIpubsTaQ5RIcrKyF+OLJdqlKivX0mA473aCloMpVfvbBH2YvoNL/LhGwsg5TZJt/M9Dc46HIb/RG9xugkLkhCzPOA+it8G7mLDaUI8CQACJWsvx8HuClA6IBXmx6G7mNinzghC4EncW5eYL8A6+v+1J/2WpRqNUYvHiLQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771831668; c=relaxed/simple;
	bh=7mljl1U9eXffJpZ0hBAWdNAHR5m+p0KaG/n8r9LaqAA=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=E3epWlZfk+N471DBSRWesIxeiHsqUmvB563r42nMwDpVfVe0vkKsrSLFcRSn/4iulnq5/IYJbXsqvkDI7cjfgLh/zpUemlXYQyOueBKBqftTmZWMTp5Z7BqfWeeVL8IGM2206scVUDIiueWMf4sFrxFMcdc9eml/rraji3AXYh8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VIiZZeQ3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=d4Y25XWa; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VIiZZeQ3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="d4Y25XWa"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61MMrX5q3603537
	for <chrome-platform@lists.linux.dev>; Mon, 23 Feb 2026 07:27:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=+Lif/v6jrZ/kaLcznuMV5N
	FqGRHxVZU6OFm4P/Ynz3s=; b=VIiZZeQ3woW7l8DMziY9OPKkuzrr5WNhrX5twr
	Ot+moTFjx0q5lnDv2or3HQApaGPAmGRN5kBaE9R1gOL4H9XLEJsO2V7GjrwR6KS/
	tjoF3hKqVcrtYtggls9p2aTzeYdDOfWzzeICU7aJZD7k3wBXJLhlT9QO5Th5FVBZ
	J2OFM6fMPkp/Er9l8bdQJEg3PqYWiqCuez3tlzixbMcjJKMvz9CNOy4SRJkIo1xA
	sV4vkvs2yAakQhJTZXYBjOtq6L/Ae8FSE/PS1IcJYsBKCOMJFCMns+gcLB6upM/R
	lI3Lhx/blom9t0CM8AxYew3hhZCFZeaOFLQywNLhRa9aiGKg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cf5u8krvu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <chrome-platform@lists.linux.dev>; Mon, 23 Feb 2026 07:27:45 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cb3fae6f60so5290530585a.1
        for <chrome-platform@lists.linux.dev>; Sun, 22 Feb 2026 23:27:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771831665; x=1772436465; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+Lif/v6jrZ/kaLcznuMV5NFqGRHxVZU6OFm4P/Ynz3s=;
        b=d4Y25XWaaLqEqvDC0Eb9zHL9wcWwE0BP08O21428N99CuBFb+dYF4E5v/eUyBbdsTr
         1WAFT7sdlWDq2lInVoA/d4HN9BNqmuVCv546QgZjKNGOVJ5Juun9wvqK9rS9EZ0YsrXY
         +al6mc+abeUgAP6qpqKaEqznyh07hrcp9MXT0vx2DlmnKIJ++fBYMESoKKbhjsLx1Wms
         pfAEp/H5uFrJ9jt0jxXh08mYFPw70BmXwhUHHq/cZn41gUe+o9AtxSXQnI2624QtGwp3
         SUpL1aJvtb3KPCHSioDMQo1tOoTR4Ziww9GWLSpYEUW4WRboolwuvqVY5UlSjzA+uwta
         JZ0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771831665; x=1772436465;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+Lif/v6jrZ/kaLcznuMV5NFqGRHxVZU6OFm4P/Ynz3s=;
        b=vAJYpjd4SqgMW+EzY+pLjb3yicYFvOQIQfen20RlL3jYSCluWG02PpnTWcVFFSw0VJ
         WCASuyHNb97s8ikbHo8Jc57AGLHuP65+OfkVST7qhxtJpJdnt7uiXT8YsSqPUv0HNlmp
         T3reIdwOi6wod+5+ZcXAPiXjxpdAkM2/MTMrFVYhjPQ60vKaVwMqcNtdAa5a3pQpXS/C
         ZcZuBKkjya7TVKDDOwz2HOLulElcVU78TB3Bxs9hb8uS4MBx1Tahe4AqFe6plAIcnbBH
         US+GrO+ldJ6xfILrA5vlk0jtHpZiMhloWK2NTcFpjLE3vQUW5OP0OUIiK92lvK2K/E89
         WlPA==
X-Forwarded-Encrypted: i=1; AJvYcCVx8VvUpvBTc/Ql3oHisvVF06ca0E6U4gpZNJsXd0Co95HWyhey/nWwiE4VVMUHgNbKawrMDvez9syM8n9TdDY=@lists.linux.dev
X-Gm-Message-State: AOJu0Ywqjvx0ogv0b1LSHpsBtA7KLh7yVlob/xa6Mk7JeZaxxvajDvJ3
	JZbEl9aaZhR//UhY+KjsxjYaN2vi35qdjB2WqCBu4WkKOLCOFM3+x5U1ModGCdCSDrkPifvRt9/
	YKu/hF73VKs/xZhnlV6sHN8yS+t8zCg3MXOKxOoNy60OWzyeCaPMSty24xj6pZ/CW0hAAcx8=
X-Gm-Gg: AZuq6aLZu9c1ofmYIFRY5p+cgsECwInkI+2NzeDbeGJG4m671zBOJxmvmxeTJEqohbR
	z5bzjQvtj+WMkStGgsxeuqGqY8AgpEt7o9uPf0p3r3bHcvdYNZCExMM4kWtLwmHbBYN36h4A6qz
	fMTirhOTZsEw4UFTeS19oHA4zq1Wb0/fJgvtS6waXYUgYUnmado/+9kWndNzNTVu+VN0xT7KdZ6
	m9zwqeXp60g7oiLmXsfi8oskcnqyp/xAO1cyCb0xdKLVZPT+XXREtniLV0NiotmEvZbBZheS1oO
	UgBzXPt6WTEMwm2pjDVddmRxd973aM7MdDaHY8E/q9EJFV47kB5cfvBMwvmtbKWkIpF+AWLjs8i
	VrNO2by1r1Ghmm04vSVBzIZxYrEfEp+sJK+2cn4wHCU2yzg==
X-Received: by 2002:a05:620a:3949:b0:8cb:4d46:7a6e with SMTP id af79cd13be357-8cb7be5dc53mr1446018685a.10.1771831665243;
        Sun, 22 Feb 2026 23:27:45 -0800 (PST)
X-Received: by 2002:a05:620a:3949:b0:8cb:4d46:7a6e with SMTP id af79cd13be357-8cb7be5dc53mr1446016185a.10.1771831664738;
        Sun, 22 Feb 2026 23:27:44 -0800 (PST)
Received: from [127.0.1.1] ([178.197.223.140])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43970bf9ff5sm18550286f8f.4.2026.02.22.23.27.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Feb 2026 23:27:44 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH 0/9] workqueue / drivers: Add device-managed allocate
 workqueue
Date: Mon, 23 Feb 2026 08:27:28 +0100
Message-Id: <20260223-workqueue-devm-v1-0-10b3a6087586@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGABnGkC/x3MSw5AMBRG4a3IHWtSTRC2Igbojxvxuk1LIvauM
 fwG5zzkIAxHdfKQILDjfYvI0oSGudsmKLbRZLQptDFaXbssp4eHsgirslVeZchRavQUo0Mw8v0
 Pm/Z9P35gpCpgAAAA
X-Change-ID: 20260220-workqueue-devm-d9591e5e70eb
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
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        stable@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2816;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=7mljl1U9eXffJpZ0hBAWdNAHR5m+p0KaG/n8r9LaqAA=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpnAFmZkGFLhO7cbL4Sqp0/lLgGV3Z1pGEZFFfE
 0wp1vv9KA+JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaZwBZgAKCRDBN2bmhouD
 1w6hD/0ZJmVgKfBwm7gdyPe4n638O/Y+0/1CnXxbSLVvC65RI+b67sjIRddYF78ZDR86k0TSQ/q
 DjiUVn5vZAowj6LeTHrZRaRtHU4IZE+hh4eAQ1lSS/4NgwPBo9lQ7MI1jCAqg/hhcrMyEI1apzN
 uz6mXYcLAmYs176+CiTXgk3dZheGTTQuy1dq216FpqcPC37DNvAo9MRMMNrQphMMBOccJtUBxD3
 FVpfb3ryijGZo7GnGUR2Zl9th+Ckpj/DwAceYI6vXj/GFH9Re/rG7P/HCyXgU4IZTHyprrcN0A4
 +Fimqo16Xxk9ffA8Ay5jkNF5/dFwQpgwMaVL2UJ04reD02gmHC/ib98vWMWTn3f/7w9pHDHAREO
 P6lx3QQKk6T3RT93ubw+O1DmjEMUeFnQHjEzk3b2S24uPwigtCuuaaFwe3gKzE0RhJAa3WROqJW
 dDx5NhC+Xg1aVOvRnLui39fkdqlwI9+AymUaGv3Ywe4BuBFA+lIcaUtPr14MrB329TWkJJB4ESJ
 PI9P0pNKpiPr/7BP05GVUyC8Wog05QRUVQBpPrxGG7VNotOJv1XCvWsNbVW8DMTvYVdkjPGefdM
 gp9gsjavEO6zd1p18hW06CbQu1O3rfae5eMWQTfiESznwD7h8CdoGC1MzLglLGA/ohMND7X7f4Y
 IcMk/BuoVRa2UNw==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-GUID: qKFdc7IzEOn-d8Z529Mbvx1DyHivJ4es
X-Authority-Analysis: v=2.4 cv=cJftc1eN c=1 sm=1 tr=0 ts=699c0172 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=6nO30s3o7FuWeffXwhKHTA==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=5RJr-VCCejNB9LTRrg8A:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: qKFdc7IzEOn-d8Z529Mbvx1DyHivJ4es
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIzMDA2NCBTYWx0ZWRfXy4SE6QJ2CWQE
 a7jWxINO2sdPI3eY06ym+N20FgC+rZCOEAWkgI7RntEFoXtIl+gvUTfkSaTFEmMA3jaqs6/WNRi
 qALSSdUmSL54q4N3V48RyY9ZDnIsLFSGjNOAauWxC5bZUR6KIelJm8ejb3FRyZ41GVmS/TPnMbZ
 /a6iX+sObCGJoe22yT0Vl4ESTqwNyvOEZdeFJk/u2hniQXKnRG2hAmD00Ri2wvtAslAITGPTTur
 2ROHvwZbz9jFMwwtLtTggcKyUX35llryb0AyDAFEzlPDQVFMFGmmE2hYcMmIu1snbjUhcOgeXLz
 CeIafqtpZGDDsTMM0rf9sGGQb4JBXvhRtR3Eh74lPtrQLT7BsWw0hAv4FCQYW9hoWQ3rsrSeSVe
 xkYCeZ3g7qOmrbgko4fjTP4iZDGkrQzD5H6gnPQ5zAkr4VD/WaffpB0IDMmBdBUWI3L3v49dP+W
 Nt9fKh4dAbzjL1GG0wg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_01,2026-02-20_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 clxscore=1011 malwarescore=0 suspectscore=0
 priorityscore=1501 lowpriorityscore=0 phishscore=0 impostorscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2602230064

Merging / Dependency
====================
All further patches depend on the first one, thus this probably should
go via one tree, e.g. power supply.  The first patch might be needed for
other trees as well, e.g. if more drivers are discovered, so the best if
it is on dedicated branch in case it has to be shared.

Description
===========
Add a Resource-managed version of alloc_workqueue() to fix common
problem of drivers mixing devm() calls with destroy_workqueue.  Such
naive and discouraged driver approach leads to difficult to debug bugs
when the driver:

1. Allocates workqueue in standard way and destroys it in driver
remove() callback,
2. Sets work struct with devm_work_autocancel(),
3. Registers interrupt handler with devm_request_threaded_irq().

Which leads to following unbind/removal path:

1. destroy_workqueue() via driver remove(),
Any interrupt coming now would still execute the interrupt handler,
which queues work on destroyed workqueue.
2. devm_irq_release(),
3. devm_work_drop() -> cancel_work_sync() on destroyed workqueue.

devm_alloc_workqueue() has two benefits:
1. Solves above problem of mix-and-match devres and non-devres code in
driver,
2. Simplify any sane drivers which were correctly using
alloc_workqueue() + devm_add_action_or_reset().

Best regards,
Krzysztof

---
Krzysztof Kozlowski (9):
      workqueue: devres: Add device-managed allocate workqueue
      power: supply: cw2015: Free allocated workqueue
      power: supply: max77705: Free allocated workqueue and fix removal order
      power: supply: mt6370: Simplify with devm_create_singlethread_workqueue
      power: supply: ipaq_micro: Simplify with devm
      mfd: ezx-pcap: Drop memory allocation error message
      mfd: ezx-pcap: Return directly instead of empty gotos
      mfd: ezx-pcap: Avoid rescheduling after destroying workqueue
      platform/chrome: cros_usbpd_logger: Simplify with devm

 Documentation/driver-api/driver-model/devres.rst |  7 ++++
 drivers/mfd/ezx-pcap.c                           | 27 +++++--------
 drivers/platform/chrome/cros_usbpd_logger.c      | 18 ++++-----
 drivers/power/supply/cw2015_battery.c            |  3 +-
 drivers/power/supply/ipaq_micro_battery.c        | 50 ++++++++----------------
 drivers/power/supply/max77705_charger.c          | 36 ++++++-----------
 drivers/power/supply/mt6370-charger.c            | 13 +-----
 include/linux/workqueue.h                        | 32 +++++++++++++++
 kernel/workqueue.c                               | 32 +++++++++++++++
 9 files changed, 117 insertions(+), 101 deletions(-)
---
base-commit: bc32aa8c2aea9fd3acda58dd8a5ea6c17e9dfc36
change-id: 20260220-workqueue-devm-d9591e5e70eb

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

