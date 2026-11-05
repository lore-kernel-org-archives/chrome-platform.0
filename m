Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793902947;
	b=T6lZZlsyH2Bs+J6Looy2gFiGAlVLwuufbGRFSNvDcspMa3TRqPiuL10x1Rr4z7Nk82jr
	 0a2Hf6Wm/9cecDPcJK7CawVyvkY3Op/OM74dXjWWVgRkYUwVxTFnKvFrVjnYm4d0kqGuN
	 dvD4oNCoKZlEy3tLvOhlxNWbkDDyAZtBgYVJ7BBY1dxS2UR2CboUi/9NzyuoqeX7PNt2j
	 txuO0YaS3/wTfah5ZobeInw52wpEG16iL+Bc2Icgt2JzZEt/VuuqaEtFriKQ8esBTW0XA
	 JbTB2/WjNs0qoXgPx7DKn4wgT8HLu/NQyvNKdTXiJAGIXQADmKhq9yA6NDlzxun3DTg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793902947;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=YHJMEIRh83r7RL3if+qhlEXqyFZGQxnKFEkhzXkGzVg=;
	b=bwAdS/XjpCRHKMpkU49oAaGGFuFTIJWvdhL3+KysOnfOrBrkE702QwG9gjkp8gc25eGr
	 nSCSeB/KYgot1jicQe7Bq+BmPGZIK0eqrx0IBN9oj7ocKPf42NTvykRyKixC+syLEGI4k
	 nE86BoKCmTMpSq1RwI5vJFG9bpBaWm9LWyOPIHnAbYSFPtYwr2IVGsixRoCjcqcLiid68
	 qnE4lVDGkzCE0gvvjIigNS5bphlbhx+6S8ob2uj4FZRJ9pPH9S3+QR8V4n68TX5c8rnui
	 8f2vStVR6Z3ozGlYnQauXW+GN71QcI7NaYaEK9eeiwG/8GE9v59sA2Fpx0dm5NgcIVQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=temperror header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=C5A2fBWE;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HHOo9khd;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DA3A606A31B
	for <chrome-platform@lists.linux.dev>; Thu,  5 Nov 2026 18:22:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9DA3A606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=temperror header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=C5A2fBWE;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HHOo9khd
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A5HeNem526146
	for <chrome-platform@lists.linux.dev>; Thu, 5 Nov 2026 18:22:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YHJMEIRh83r7RL3if+qhlEXqyFZGQxnKFEkhzXkGzVg=; b=C5A2fBWEz+nOeUUa
	yXR1tZzfSVPkA0Ok9Lm5hjlni/66tbBOIlfMQIMhBScbceYCpVWRkuFOHowAIafc
	Ccx+/9veRF4CPl/hJzwm0Lx9ZpxeuLkhzjxtPU23Btr2S4LR+IwYxYdt1mo9Ja/2
	4AK4ZqgT0XzEVGq+cc4BN++k3NHnL5PoVHscghV44poXqP8+wmFjQ4aG3RmxTobI
	wJs276tvSzxgpo29lT86qIUBB52NYLlju/ywUQ42ZutoBkXCm8I57/uJfVJ6YYq1
	8WmgM2R9y3X88jvHNCkFj3OPdTpB+aoRB1GMBTpBAxmiKziBsvCL/tZx40864F6V
	efd17A==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hrj43knqc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <chrome-platform@lists.linux.dev>; Thu, 05 Nov 2026 18:22:19 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-33c35f5ca6cso3843215eec.1
        for <chrome-platform@lists.linux.dev>; Thu, 05 Nov 2026 10:22:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793902939; x=1794507739; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YHJMEIRh83r7RL3if+qhlEXqyFZGQxnKFEkhzXkGzVg=;
        b=HHOo9khdKge5DUAlLMGqaycJirstQ2V+eH+dwOxaJU0bne/h754Gnwcr4TSzDcQg9x
         z4TMsqG5Ql3SEhtw1tEHq3L5vQXareUtG6IoRug98xakihWNSUbrgJ41+MeegBFTWoZX
         llh7QGHvjrsZP5ExMgrpKQ+PTDh0L+0F7i/k3YmocmGfNl/oD4mLe5bP6oZsWi9eDcji
         S5aWnfcA1NDknL+/vboxdp7eTJiKvsl3QXl5al/n5zY6wICzmmORX+IIxzIOsnJimhr3
         gRCQFcM5UonUkEx6z/3bKlRYzDExbdYqFZDxjLyC6klC1JYu3XlpOX9lOWeDZ+7zpB2f
         ODqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793902939; x=1794507739;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YHJMEIRh83r7RL3if+qhlEXqyFZGQxnKFEkhzXkGzVg=;
        b=EqKnIlDz4pWVanb5wOOxmGtzxQ+ho5a2kGKro/xFt6pP9csXOx6hOeu3kfTBMr1FAq
         zOoh2EDXItlqsEcimdq8rEJ0MVKYhfimgNSkZS/5gQ0IJ0Sammn81OvlWYENCuf9aXKf
         gj8t/O6KYWSyk8rRJRCCGixa6jobhebyVr0IVWo8kKfAw6kifSbIyDLPDpsOHpW2YVup
         TVImLRy/fQs7+qgS4Yvwo8PGQ5tRo1O1ibSKF97sMVoBpifNuMPWpyOPnulSCArKUnj5
         FBTmLVJKgCkoiMVGrlecrHmJZOjsmRt2kvvuZ7TLiqDhBhm7JlNLquOOJNnwkQ18aQgM
         P2kA==
X-Forwarded-Encrypted: i=1; AKwUvByeqnApmouGev9dFYNcBSan1B8wVWH+QIiVPGM5ZjdrBN0fce0cajFDh+vIlVIC+iVN8f7TpkB9Tr8qk/xL2ZE=@lists.linux.dev
X-Gm-Message-State: APuU4Z8I+5llwiALdGJPcfpeqIdRVkn/bWhme7DVImVhTX9x+GuFqlW+
	b4TXJwzfhxZW59wTyn56S+AY/1HmCNAjN2TLNabMmFFFrprC/1BRpxmRD1y/8rMh+eB03mxixfA
	aam67V/ZuBKIWP2nMHH+Ks34ntWS5ROGXuG64VaTnH87y2bnjFw08848pH6DIyJHBfbQRJg==
X-Gm-Gg: AYBFou3fUxy2MsfD2fuYzPxn/d9oWWV6vCJsqYQKtYZnqqOcFrq8s+DOjM6HPJ4MSBs
	N7iIm/NvsfjCPDvU8BTDzw7vZRbKMCbpDxPiJVk13wrWci47Cywo9TlKPJROtSoGbtN4v1iUtd1
	SiliYXPrlBltDcxtuXWZ7kvob8gG2drIQKUQoCxRgqBdSUjwu/g2IJD24HtXFJRqYjOy8nYvXdn
	pFdJQOjlMXoLVtmHL+s/cyl3vmuVp0w5nZT0ZKofabMWtejj32/nXOyv0uU1UKNh4WuuvxiBzvr
	gP6BwPK9cDybi/4qrzAG8E8/XO+2bz+db/eInjHisrbyrMIC5VnX5kd2j03soHeyJnFlauZwRGK
	EXSHDUd/bP/1Tm1SWMP2l5/6Pk0H2jY+rKVkEeYKJ9KW23Odp3+wCDeyeb9h4wJ5MC9sndg17vf
	ri3A==
X-Received: by 2002:a05:693c:87cd:10b0:36c:a084:30a4 with SMTP id 5a478bee46e88-36ca084365cmr10656619eec.21.1793902939032;
        Thu, 05 Nov 2026 10:22:19 -0800 (PST)
X-Received: by 2002:a05:693c:87cd:10b0:36c:a084:30a4 with SMTP id 5a478bee46e88-36ca084365cmr10656556eec.21.1793902938276;
        Thu, 05 Nov 2026 10:22:18 -0800 (PST)
Received: from [192.168.1.11] ([183.83.138.70])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36f66086a4asm210818eec.0.2026.11.05.10.22.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 10:22:17 -0800 (PST)
Message-ID: <85e8effa-dc1d-441e-a721-e4078388c9ef@oss.qualcomm.com>
Date: Thu, 5 Nov 2026 23:52:07 +0530
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Post: <mailto:chrome-platform@lists.linux.dev>
List-Help: <mailto:chrome-platform+help@lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
List-Owner: <mailto:chrome-platform+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v17 0/6] power: reset: Introduce the Power State Change
 Reasons Recording (PSCRR) framework
To: Sebastian Reichel <sre@kernel.org>, Benson Leung <bleung@chromium.org>,
        Tzung-Bi Shih <tzungbi@kernel.org>,
        Guenter Roeck <groeck@chromium.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Matti Vaittinen <mazziesaccount@gmail.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Oleksij Rempel <o.rempel@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, chrome-platform@lists.linux.dev,
        avaneesh.dwivedi@oss.qualcomm.com,
        Umang Chheda <umang.chheda@oss.qualcomm.com>,
        Ulf Hansson <ulfh@kernel.org>,
        Sebastian Reichel <sebastian.reichel@collabora.com>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
        Bradley Morgan <brads@mainlining.org>,
        kernel test robot <lkp@intel.com>,
        Francesco Valla <francesco@valla.it>
References: <20261019-pscrr-framework-v17-0-69ea6cdf4731@oss.qualcomm.com>
Content-Language: en-US
From: Faruque Ansari <faruque.ansari@oss.qualcomm.com>
In-Reply-To: <20261019-pscrr-framework-v17-0-69ea6cdf4731@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: Vd0RTnXglS7OuHdPgBw2DsjNr7-SPwJ5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDA3MyBTYWx0ZWRfX79071C9pSA1w
 loIZzZi0QC4VCmu2Zd42KN6aYoBohPKasGrne3xFn0mX6tWBqv6pC7cO+jwHf8Sm5Vh/nbDn0zK
 iYehXgLnu/Lqlv+Aasxr5QolLmEwfpYOTIpnJDTXBbS+CdpWJiA3r+rACcK7u57kqZr7Lej7Fsh
 yT0jKSK+uoC81nwNEnWwmkFyZmk/V0B5UbVqAFsoLnuXHY9Q9cqEnlZ+1n88ZR8d6lA4wW09GRG
 J1ceY8FDxeFYTUdWXUcVE7JRMbDt+PKfe8FcgM/gxWNC/1cjJ/uNMW8dH9m9+KbPcPV6mhYV016
 61mdIrBd7C6L2jm4n+UOdBllPk0PDAQDevwChlkUpASrcSaIekoZPXxkevLLSlEap5ZVkTloZfU
 hMrD2BQ4kgcfdp1ctk1fNSZ76njlimU7p5wxafvJJYwT9BMim+vtrS5NPlhON+fFL0+uNbJw8DX
 hiXTpAiFhqV5mCdwAQA==
X-Proofpoint-GUID: Vd0RTnXglS7OuHdPgBw2DsjNr7-SPwJ5
X-Authority-Analysis: v=2.4 cv=SZdi5fRu c=1 sm=1 tr=0 ts=6aecc95b cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=Ns+0gdUR07JhZB4Cb4qmrw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=8mBobP89YcDz70HNg1MA:9 a=QEXdDO2ut3YA:10 a=zgiPjhLxNE0A:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDA3MyBTYWx0ZWRfX1T+fdMzcldNG
 F17FTYG7hxLvs18UF7+QseQFfVFxK6VM1M7t+cN6JzXbaqaMlAJqgs6hWAmTqsw7x2+NFGj4uD7
 h5qnl4nIC2bFivVNFcHlBaxxPl4+T74=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_05,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 spamscore=0 adultscore=0 bulkscore=0
 suspectscore=0 priorityscore=1501 malwarescore=0 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611050073

Hi everyone,

I believe I took into account all the comments and got the 
different reviewed-by tags from the different maintainers for the 
changes touching the files out of the scope of the 'reset' area. 
Is it possible to consider this series for merging ?

Thanks,
Faruque Ansari
