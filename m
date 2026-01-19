Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73DCF3659E9
	for <chrome-platform@lists.linux.dev>; Mon, 19 Jan 2026 14:21:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768832497; cv=none; b=Szja0o7GI9ZNmOtkHQagB+ojytPvK9FWyhNTzkJcwyAuxxIxM7BE8XLRy3h5PwwcFeSBEvufdxZUK+zkDFOxC8K+2FtUB/x5J5vyXUhDBQiOsU0wc2Um5JBtcwQ6LkpYWf08jM4n0DR9PgFqkwr5HOI93Kh65LHDxbYdeLWjGiU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768832497; c=relaxed/simple;
	bh=8agNwjJ4zy4m6BRUaQNXinFIwq7siSR4+wJAzG4qWxU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Xv5nAlYRSZUI7WNGu27I0yIM/Ykg/JxNyf3lwlHA+zqQVBi2vT9Ej9+JRKmgjGw9SZ4ZbxHgrxLo3r4jvg5Kq6VK6HxTNpz+bmXRJ5pQVdSKpCqlCdi8hELhRypJHejokCOb85kaZiDFKZ/eVWedOQrm/5s0lo7S4kZPFGH7YJI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MBkLyTHu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HFOYM72J; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MBkLyTHu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HFOYM72J"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60J9nSsD2966239
	for <chrome-platform@lists.linux.dev>; Mon, 19 Jan 2026 14:21:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DUD17svob3ckgQw9sTfdTLObVRKIRVlmGErtozciMyI=; b=MBkLyTHu7KHdVtED
	SgDcrkk5UUan1MrpVDRaT0Hms5z6vq9gbyBcN4LId7jUIF8bDB/rs30a3Gq3xblc
	bs5UK6F2UArgkILogkapp0gL7Thoch2tvUuc4/W1BfNa1ZI+X/wHYHMVXjY5aNxG
	1F081JymlmZx3BgTb93925rQhXZZwjGaJocsBqo5Om9cafW4lDEewc51dm1UfyK7
	wgyZFVR9z98IvALAodPN96IN6dxmZ73ztmF/6fZWZE69W1Hfee2NgT55OwOzOmX+
	PS5x8Yb9rqtVum6jW0KrGkdTHlTr/PJ9g9DjV+e9/efbZWns3PEBt6As7oILNqyp
	/jiESw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bsjaa8r5f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <chrome-platform@lists.linux.dev>; Mon, 19 Jan 2026 14:21:35 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8c6a289856eso864838485a.0
        for <chrome-platform@lists.linux.dev>; Mon, 19 Jan 2026 06:21:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768832494; x=1769437294; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DUD17svob3ckgQw9sTfdTLObVRKIRVlmGErtozciMyI=;
        b=HFOYM72JS8aEokWvRxWyxhxanEa0GVPfyYyubZgN3tR4htSXYSvIc5fN+cGJvl5iwZ
         ca2RzkWVO0MmUegNCFGomx6Z1vzL9eLHllgF3xLXez8xvI+vhp5uBJrWFaLusxABfOxQ
         Jq85KPuxjKQ12/04G2Ls5gvsZFQFGi2RHcEjKChHZpv5G/tyVZm3gUwwC30JGQfqxtJH
         GGjFfZM4JeKnGMKVTRwBZX7Xu27xj5hDX2BBq1uQo4kJWyCzUlsAUg+ndtsiSQwXT13I
         Kxk19XkoHDb0//yi/0AE+9/EjiSKwcbwConYIdvB0vVWvqnDlRwCb8h/K0on7LFfsXK+
         oa3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768832494; x=1769437294;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=DUD17svob3ckgQw9sTfdTLObVRKIRVlmGErtozciMyI=;
        b=cbWtTy11bhksWYDcEgGBWKZ+4u+VFoNMXKxG5gzSM+yo19SSvao1R8TFBAu55gIEJb
         QUPchXC+RgnWhcmvedZiA4AB13k2RtV/5rRH4qgcTr2eVxPYERra9ai+kJsVyanLziA9
         iwbZ/G/nQ3Svow5jM40WEE/nEllEYeRbPfg4y2dY7q+wmhmlxgXSIwQlsQI1uBZ5RZ+U
         Jad247uvO+2PC8olf+wfV4T2lbxS+lQKDNZ7CCNwGRAyUP8rwBFBdFM7ffqoYaJi3Krh
         THvyezhopkpM8pZUDoNxEMjrc0RbTD5XxfjNIuYWuonBCHp/77iITnlWK+cFw8y3vG1z
         HfWg==
X-Forwarded-Encrypted: i=1; AJvYcCUNr7burIC+5BJ92do6sBld/EsgujdcKWQkbTtRl/hLAgkRL3r2PRqMB+9M31pncIuVDGHU6RFrcyzczNd7GaU=@lists.linux.dev
X-Gm-Message-State: AOJu0YyDOkXg/C/cwImO1Nni+B8TLHC8HB/xbN/qU8qqvAvrTPrzczcs
	iyTtxmbW7QSmYocurf7fYvVhWkfIBaI/DSU/337zN4strJrdUmknnM8zNbc1eBj6IxPO+iwXSW6
	kebxHTJXls07G/B1LGWoRlg8cP7YxfNHikgnMfAcw3X0nFrp3QqHNBPl8fpmN1Oyx0LJQwMA=
X-Gm-Gg: AY/fxX5ha5LPRwzJ5L6DdoVL4pnrCwMM39JvNMXOzm2uMDDfyE/xpX2hcohdOrCKlk1
	aj5YZqpkDebrULbssaN1rrqhjTEVfddg8Pxv+xcb+1JmokELSkKd8mQGymuOAiJ4CwLn6dJnUs7
	78AaCG7p5JX8jhbbDkpXyu3NMedUjn/0/rlI23EN/S2httdhlG82VAqHEfFdiAOJaAHE94KdcQV
	1eTsgg5cc4nh4TIkkPHN973MW3cQrqzNlY2/SdwMZNXAXMKFqiRID0D+qbDa2W7nBcaoKuB3wVX
	smmLXkeU2YsW//pHeG86YRjE4M5g+H6HmL21dSKoY7Va07R5/m1LTs7tefZvquZnxivvspW8CzB
	h6P+/rcq+f3HwYIztSrTOZUE9ZPCvsp+bm7yH
X-Received: by 2002:a05:620a:31a4:b0:8c5:3412:3aa6 with SMTP id af79cd13be357-8c591a1d06cmr1960802085a.42.1768832494335;
        Mon, 19 Jan 2026 06:21:34 -0800 (PST)
X-Received: by 2002:a05:620a:31a4:b0:8c5:3412:3aa6 with SMTP id af79cd13be357-8c591a1d06cmr1960795585a.42.1768832493696;
        Mon, 19 Jan 2026 06:21:33 -0800 (PST)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:8691:997:57af:f0e1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4801e8c0475sm232136445e9.10.2026.01.19.06.21.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jan 2026 06:21:33 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Benson Leung <bleung@chromium.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>, Linus Walleij <linusw@kernel.org>,
        Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        chrome-platform@lists.linux.dev, linux-kselftest@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Simona Vetter <simona.vetter@ffwll.ch>,
        Dan Williams <dan.j.williams@intel.com>, linux-gpio@vger.kernel.org,
        Jason Gunthorpe <jgg@ziepe.ca>
Subject: Re: (subset) [PATCH 00/23] gpiolib: Adopt revocable mechanism for UAF prevention
Date: Mon, 19 Jan 2026 15:21:30 +0100
Message-ID: <176883238369.34730.6318990234727983164.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260116081036.352286-1-tzungbi@kernel.org>
References: <20260116081036.352286-1-tzungbi@kernel.org>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE5MDEyMCBTYWx0ZWRfXyiiCCqC6pTc+
 JKTRttVSBx9qYPRJKleHVZsZPp815lKXvGWEshBCyhoPYaYzGsw92ZB6LlBybHuVt8amz2Z5Vl8
 EP5fFzwVjdI2zJiq2QIsy61DpbFE5RD9mnsGUOeKsI1j4EQk42SvJrUYp7B4/HAdljRsqloTwhh
 ojEGTWVPziSSDLdG1LtY0+4ZIVMt1QcuELe1HRo53uGhMF+Mx7wh2DJW+Fjx6x1DAeeiDdT3jnD
 Sh/6b4RrXgtSoJwbzRp38V7UVGt+kQIZwFQuQZdyVMgL2pBSl3KVPPaWeWcgR+1yvxSZg0t2mCF
 nWSw7NjHbLknDpeSDdNsemzDtgN+gmN4kQl6KpESiJcvgS4glNb89micP7O5s1dn03Fz6Q+Ke4m
 zqa/VbeR9IcRVBxgHgUC79bZYSF+bkS1NBVNixEHDYY/xR95ABDi3D+7vINxhz/d42gEhlGxIy2
 F93+n8lWhk9ARb9Nn7w==
X-Proofpoint-ORIG-GUID: Hs2LUHUtuVdAle-s4FTbvHlAMaiAgxfr
X-Proofpoint-GUID: Hs2LUHUtuVdAle-s4FTbvHlAMaiAgxfr
X-Authority-Analysis: v=2.4 cv=L8gQguT8 c=1 sm=1 tr=0 ts=696e3def cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=9vGuVDj-4svxC1PVwDYA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-19_03,2026-01-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 suspectscore=0 phishscore=0 spamscore=0
 clxscore=1011 priorityscore=1501 lowpriorityscore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601190120


On Fri, 16 Jan 2026 08:10:13 +0000, Tzung-Bi Shih wrote:
> This series transitions the UAF prevention logic within the GPIO core
> (gpiolib) to use the 'revocable' mechanism.
> 
> The existing code aims to prevent UAF issues when the underlying GPIO
> chip is removed.  This series replaces that custom logic with the
> generic 'revocable' API, which is designed to handle such lifecycle
> dependencies.  There should be no change in behavior.
> 
> [...]

Tzung-Bi: I queued these two for fixes. Please resend patch 04/23 separately
so that I can queue it for v6.19 as well. 01/23 and 03/23 risk impacting a
very fragile path in GPIOLIB so any changes to it will have to wait until
v7.0-rc1 to give it a lot of time in next.

[02/23] gpiolib: cdev: Fix resource leaks on errors in gpiolib_cdev_register()
        commit: be037ec1785d76351037103ce6baddd3299606ee
[05/23] gpiolib: cdev: Correct return code on memory allocation failure
        commit: c7843298bf973d4bc7f4346140661e117186decc

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
