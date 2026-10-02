Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EAB943CEE3
	for <chrome-platform@lists.linux.dev>; Fri,  2 Oct 2026 07:53:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790927609; cv=none; b=cv62yMxA67GY/HnuB5BJfXZ0AVIpBun8LHyjB9cnrfKbUThQ/B0D1RuBQ4N+IlGJy09weAyrAT7pWq/iqrbqCqhFNtu8kzitMjI56FZHRzK2jii3T1lrKI7F9NKFiTpcbYDyVUgZKK4BwPf6khpdr/BvsPGl57MWsEdXsNzeZNw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790927609; c=relaxed/simple;
	bh=o/RvQv9f1ZtZd51QR8FJOZby6EqzahPJ2E5K519w+Ks=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rec+gUXOmKRxgVVQnuDZA+r7WcQ9l5J62FYMCwzt+usEiSwqjV90qJqjbYc3DlRpFMe1t7nbwC6AVcxa1YBoQGImS/APEflr/5fAtpezQbtgxdMW9AH8vlQNM/zAl64Hz2Jp9C+kib9k7VJnnlg3j+lBYmZfdA8Gp0khthVbWFI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FG8vwcof; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=C4o1xJ4E; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FG8vwcof";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="C4o1xJ4E"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6925ikux1542451
	for <chrome-platform@lists.linux.dev>; Fri, 2 Oct 2026 07:53:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=6leoAHiHC58kTdNzD41rzsHZ
	ue8MEp5AAZ57oKNPKQI=; b=FG8vwcof6+Yymu+Xm20Dzq5uzPYgxmE7Oh+3KmL9
	4k+05Lbc2lg9qKNEPq9qtsiLUBRv3VR4dETGZ10i/P9o+KNQdNkUM7EVqedL/Ssa
	KK27jCk46B8ABvKq5zQ4XEA+fzDqbLSTEIu1HZ1WXYZsdicLSoJHYn8O5QLdi67o
	zemOmMenzMGG/BDqkhJ71t8iUVgI+KjzE6yKdJuOUIlfbE997K0uT7alHIK/xHZ0
	Oo24b23CSc50iIrinWNXkSiMqqLn0UbG49MXWuQtqjnktqJ7nEcX7AY7U3Xse7TO
	eeDAsgdGubFKFokXl9S49mTv3V8O+eOeXtKjEX/4/NsuPA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h256mrkbt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <chrome-platform@lists.linux.dev>; Fri, 02 Oct 2026 07:53:26 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93dea1b6c89so54610585a.2
        for <chrome-platform@lists.linux.dev>; Fri, 02 Oct 2026 00:53:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790927605; x=1791532405; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6leoAHiHC58kTdNzD41rzsHZue8MEp5AAZ57oKNPKQI=;
        b=C4o1xJ4EPR1y9gYxZcOT4iSCxc8jhDo5dLl81tYaqaa2c8ezPdH6n+rftW/NqAEPwe
         9kd9+AZ2jMGjfUE21iK1Ru0nBGeu78jxNEKqPKi2h/A+KTgPBv43vQGxn0VyC4r4uz67
         Gpj34vZcFF7Br4EG/hdeqbgPOH8ljHT49YnRQnXj3UOyNxIqPiDQv+YEeL0+kIr8SiZa
         1FarKgDlo1mrSSf6ihX6WJRs7fPEBPkH0MMfT+Q9hJho6IxgimPbDDWmDNb2Q9n/CbCr
         Kgae+nQOSf9dC5Y8LwgSBQ54e3gA5nW4vMwB71E8NmBidfLMo6j8Ngxhe+VnsjWUzPcA
         wTJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790927605; x=1791532405;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6leoAHiHC58kTdNzD41rzsHZue8MEp5AAZ57oKNPKQI=;
        b=N0PKFV2y2Kl2QL9U0v57ywHZd+9EdaJJ2RFNIDoHLHRsxM/YL3Mik/LoysKXpMq1DN
         RYaxEhekL5pXGtrM+ZQTZCwKUhJ8w/D/rmO4hMIP54aUUbQggSDyoIpVTBMmxf72d6am
         rLvkJ9OwpQ2ab5y84ONB2pY767yN8MVufKaAvIsB4LtSG6K75hTnatrv5076lMetiqdI
         aQj/gidjET5gDa3MoXR3oxFpgjGqcX3MiPXfEGFCuBix60miebw3GjXBbC5DShhomunr
         Ht2qzpgMzAyMbOmAYvhOAZ/Fuua5Infn1FdS5NfJXphaLQYumfrEjqRchicjNPnj9gmO
         3OrA==
X-Forwarded-Encrypted: i=1; AKwUvBxdIQaWTXWbLd2fVMa5xfm5CKKOv3RbtO34v5xoFPFIozmnUoNWtMOWdKlDAH38OaIz1BgXtn1FWyma0+x4E9g=@lists.linux.dev
X-Gm-Message-State: AFuF++l/5bJeTyvpaPcTS40sayERGvTYWmvSK2OkpbwEKyHX12+GURKl
	XFnXzeUzDg4AmInx4CyEDBiNpzNAJNvsPPEETbcwEooVPszVhy39U7sRt2281yFZLXsI/gU/hDc
	q2oSAqnaL7ht2F4SR88NDm2fph1GrXfDWx6k8P5oxMQGRaRXuy13wPBiBX1G99w8heKLA5Iw=
X-Gm-Gg: AYBFou0Ewo2ckLiYZDEV15Ul+7yGfOH0SgybgoA3q4Or87/aU5f93TjJJtXuoD+wK/2
	8SqUIPuuAfWumr3eCOW7+Av6G6xDKuKrOgd/azs9IO3THCYStzTALoINxDvXL7Pc9HZUWVwbDOt
	Kxz1VW8pZEd+RksnY1pAo/rCDNkg2FAwIY/vTG6p3Zj4Rx3OyYO6byTCjbDvpeqgh2WqYK6BlEp
	dLwHzoCua42K2owxX0cH4vMOfRIOiBhfiv+B81V555kF8MqgJxWCyiSCyqSBtvzmPu9g0s6kUyr
	Qd6yhpTKzkf0ZadaW5Y5gLpNyKmmnPJTV+XknPM7UbPPSB5nADsokojA5OJiY9bcZwSEKPCon0p
	ue+D/tjNTXi62Xqc7sdr9
X-Received: by 2002:a05:620a:a0c4:10b0:939:fc74:b6af with SMTP id af79cd13be357-93cf16b3fdbmr230239985a.11.1790927605368;
        Fri, 02 Oct 2026 00:53:25 -0700 (PDT)
X-Received: by 2002:a05:620a:a0c4:10b0:939:fc74:b6af with SMTP id af79cd13be357-93cf16b3fdbmr230237685a.11.1790927604917;
        Fri, 02 Oct 2026 00:53:24 -0700 (PDT)
Received: from mai.linaro.org ([2a05:6e02:1041:c10:f14c:b716:c104:4712])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b380fad53sm4411184f8f.19.2026.10.02.00.53.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 00:53:24 -0700 (PDT)
Date: Fri, 2 Oct 2026 09:53:22 +0200
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
To: Faruque Ansari <faruque.ansari@oss.qualcomm.com>
Cc: Sebastian Reichel <sre@kernel.org>, Benson Leung <bleung@chromium.org>,
        Tzung-Bi Shih <tzungbi@kernel.org>,
        Guenter Roeck <groeck@chromium.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Matti Vaittinen <mazziesaccount@gmail.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Oleksij Rempel <o.rempel@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, chrome-platform@lists.linux.dev,
        avaneesh.dwivedi@oss.qualcomm.com,
        Umang Chheda <umang.chheda@oss.qualcomm.com>
Subject: Re: [PATCH v15 3/6] reboot: add parsable tokens for power state
 change reasons
Message-ID: <ar9i8i-7a7ZnT5t8@mai.linaro.org>
References: <20260924-pscrr-framework-v15-0-7af87107e0d3@oss.qualcomm.com>
 <20260924-pscrr-framework-v15-3-7af87107e0d3@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260924-pscrr-framework-v15-3-7af87107e0d3@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAyMDAzMSBTYWx0ZWRfX0RyyKF+xNifb
 yMFqb5xQZ1gs61946xP8yEavwtrNQRRpsat6+lqYpxjfHZPjlG3z+KVV1B1EAm2ulZ+tG8WjyEu
 eAhjwl9VSMFKhT82TrpeP3kKW8QbaT8=
X-Proofpoint-ORIG-GUID: MisQUCztDKJkMRUI6OxHqHJfXdcZfWSv
X-Authority-Analysis: v=2.4 cv=b80ncdGx c=1 sm=1 tr=0 ts=6abf62f6 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=pGLkceISAAAA:8 a=WjtHAGiS79jxuaiHvU8A:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: MisQUCztDKJkMRUI6OxHqHJfXdcZfWSv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAyMDAzMSBTYWx0ZWRfXyyRG2AH5Yxia
 d8BWuIv6SaoWDw7K3P19QVxtSbJUb3N/6Ak6MhqY190zziP5J8o7+OSqV9thzqK40aVkWchqNOl
 iUQCPT8hqRAtx3PexaKqedt9tI5UpFFl5m4ULiOstrMwTfoE4Ikoos4JSU8M52RQXHudpZJhZ5B
 Rj40qop6SCzcHKFfPYctkNc3hsD/4ZDfMA0lv2L8AYzesiyo5Y4RC167PwH4FzLs9dpb5z1X1LF
 TMOLV1q9kz3duwNNf8Fg553MKVIYhN+YWdc4fL+JgvojNGeC1CkjWKLNZ9XPnqj3kzM9+FOOdBZ
 CgzwiJJhHu6Amy/Dca+ZxBFPY5cREp6IU+FI6dd4o9YFCgSmVHd98HzZFm1aKw/fMV3pzPiHE8e
 u2MehVUfdrutqiH29E/qh4NAUos9+bim2t0xBKeMXQoCiuFiXRS8n6cHq1m9LxpdX6WyG/IlD2U
 ZwOPRm3ekqVrh3ylJBQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-02_02,2026-10-01_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 spamscore=0 bulkscore=0 adultscore=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610020031

On Thu, Sep 24, 2026 at 12:38:44PM +0530, Faruque Ansari wrote:
> psc_reason_to_str() returns human-readable labels that contain spaces
> (e.g. "over temperature"). Those are fine for logs but unusable as
> values in a space-separated sysfs list or as a write target.
> 
> Extend the single reason descriptor table with a stable, space-free
> token next to the existing label, and add psc_reason_to_token() and
> psc_reason_from_token() so consumers can emit and parse reasons without
> inventing their own string table.
> 
> Co-developed-by: Oleksij Rempel <o.rempel@pengutronix.de>
> Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>
> Signed-off-by: Faruque Ansari <faruque.ansari@oss.qualcomm.com>
> Reviewed-by: Matti Vaittinen <mazziesaccount@gmail.com>
> 
> Chnages v15

Nit: ^^^

> - Add Reviewed-by tags from Matti Vaittinen.

Reviewed-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
