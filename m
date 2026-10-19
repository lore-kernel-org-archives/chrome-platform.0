Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EDBE48C8AE
	for <chrome-platform@lists.linux.dev>; Mon, 19 Oct 2026 07:58:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792396739; cv=none; b=WY8nZeFapGq+IdAR1f5mTtaegiy6GZQ0IDJsxfn2KmnPNQHHfesQXQetbv89ss1guvgYHakBHEQiQo6j9wr8M28raouPyvXN8zuyBWZ6MWsp3nJu4WDdrndJNOE67fioA/NHge1ac7Qw09k1tVHNovnunAz6p45AcYWpcqHY3Wc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792396739; c=relaxed/simple;
	bh=LsxdgDgXwqXPOLGk7GvlQfV5b/AO/cM0LOJqWa7y3Fo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ssYBRcLep9jbgs0onzh8s5ApMSd9SIGllTVtwIqYFbX9daGJJWSOeDBQd8rmYxHcAWay6YUONM3uwen/IKa3PVBJCcuU6M7bMA1mdMT6ZiXTwyGAqP+GvBTXNjpCv5Ni459rK63ZRv92Z9YLpG6EiJc4dw5ciN9WxkZI/dyRvWE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=h5KuF6Rn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZlxFwya9; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="h5KuF6Rn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZlxFwya9"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69J7jQ8B1579268
	for <chrome-platform@lists.linux.dev>; Mon, 19 Oct 2026 07:58:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WqX4y0x+m5aM5jJEgMqJ6SpiXmB8tCcvAgnIWrDnW2o=; b=h5KuF6RnG+6+lJtn
	i+hOmHTka/CJJ+wtOI/2Em57na0adNK+OooVk0L2YjQ9ribZkGCcCy2vplquoOUY
	+ujP1qvQEK8K1n+F/84avGi5k+oFm51Bjh56lmX67psQnBwo7PtRoMy5b5n0p6B0
	Z7jOS1kArgnuLLzXVj63UFG1jBCigrq4xXuwR/DdZZPO01jIRDAb6XxyB4HIcEp5
	R00WUWpeiAuqMaEg7qiKpH8curwVIJA214bmlD68qKJifbs7c2iT+xttGp6usmI0
	0kK1wmjp5tHWSN5EjS0noTVnbUqL6J2kaCMZfTqu0rO9BzVqVAnHAfg2ImTTHXQa
	qAKhig==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdf3n01eb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <chrome-platform@lists.linux.dev>; Mon, 19 Oct 2026 07:58:57 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93dd3c3badbso440693985a.2
        for <chrome-platform@lists.linux.dev>; Mon, 19 Oct 2026 00:58:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792396736; x=1793001536; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WqX4y0x+m5aM5jJEgMqJ6SpiXmB8tCcvAgnIWrDnW2o=;
        b=ZlxFwya9hsM3tqUxwUKGMhtq1ywOfxx+cUTUfWmc14KcIgTsg7atP2sJdiRzyXWHev
         LZefNwlK8v4NbvhxL9Lwfs/6qmzW2ShveqzD0TMswNZ/PFkieci/gMo6U/MFlWvs54gi
         3QXTW8aXHC11pttf9QjPGJB1rX+gr2qr6L/V6/DEP9qeJnMfmIE5yXWBCXfgZhGGgrQf
         i/emfGcMIOSyQFc1YIS+IZppztFkjDntycCtzPpNHfcdWpHYH3RgCPdWjwkjp3wEIACH
         9wl8ReZQ2bbv/UiC8pwfA4z0s/wgloEHHCpK+HOQWWRG11MIGpWpSq9fs2l+3ul2oIZt
         lbPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792396736; x=1793001536;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WqX4y0x+m5aM5jJEgMqJ6SpiXmB8tCcvAgnIWrDnW2o=;
        b=Zf/2zJ3mKZ3HY61ctQ7/i7mLbXt9oWY7bPfSBiqc/Z/c3FlwiyKaW8LIa6gfxdhuW0
         r+LhBmIpHMvO9DA+NyT75TbScF2L2DW+aNQkmr7UQ7AmVxiRqG+WwsOKrlqWQvb5CKDN
         HI6Vd2lVZGrykRcapn2FAWPy2+PR21a1hS1Y6Rjtu3UF9HdiHanx3VuR+UFgVnvW0215
         uvPhMoKZG9POF+HoJ7bieLYWduJllwdyLIzLmt9hDJyiAAW9lKN/J3dhDMIeNiarMuIQ
         SSafYWZGS/HZe1EhF5vV5BIZIMQOJ6xeqwYGzSV0mTSYAlwqdQ3VojaA9h+HYTXp3Wnv
         DW1w==
X-Forwarded-Encrypted: i=1; AKwUvByhnCSeAyQBD19gxJly4xHwqSepc1WioiqCwyIdvigqVbGFBrZlFZdz8mVC9YJPhXnkgU4SdonQVjrxx36s7bc=@lists.linux.dev
X-Gm-Message-State: AFq9FYKX8QnteTIeTX0ibiuhaB/o/3DukvcbTT222M2DSCfXatYI9WWP
	6EU6LIVRTjNtL46C27nOGfFEJeDGmZFxoEoLO3Unm6BLM79eHh96QD/ASZ6wSdcG3Viw/1T0EVg
	K9HKXHYOMZVIxITBXYpf+F5x5ka0g/AzczVUiAPyJNNEYizt0ijG7V8Bh3x5zORKMUPoIpsA=
X-Gm-Gg: AYBFou3EtB66WVlapW+J8dRxmery33gbdKTqdZMILTeA5IjEI9vGrrrIzlx/5dR99Lj
	rjJif+KdtiQw34so5aGvCrYbbNO+jjGoiqj89lGBtz9B8WN3Lxrq/Pyeq/53NSxRs8TWIclWpgz
	xEinLAEGACEfx+I2mq2JL5knrFMuIdMgBB9RrcXrZeTsvV6eDZavtRfe+/3FcPhumwfDRBFz9sM
	D79c8obVOr32MFj34DKCIujkF4txkjhZ+D80NQpyAz48gU1UiX8UqkinlOlP2GmQw4p3fXNhKLd
	O5UeAsEH1zUTj/Yiqi3gedhkGfvV7pXxCsTI0V+Sh+G1SbnJzSyusya5OEUqhjdxWL21MsWPr6Q
	xNr23rtxzcDCUqHxmvU9b2j0R30WhBbji5kHA6vHHB/pF0y5ehqyfxYs6/WWd9A==
X-Received: by 2002:a05:620a:1a13:b0:93e:be0c:681a with SMTP id af79cd13be357-93f29d7b37bmr1121575685a.55.1792396736533;
        Mon, 19 Oct 2026 00:58:56 -0700 (PDT)
X-Received: by 2002:a05:620a:1a13:b0:93e:be0c:681a with SMTP id af79cd13be357-93f29d7b37bmr1121571885a.55.1792396735896;
        Mon, 19 Oct 2026 00:58:55 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:d01d:2002:4b7d:4c30? ([2a05:6e02:1041:c10:d01d:2002:4b7d:4c30])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfe4d2321sm25461692f8f.19.2026.10.19.00.58.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Oct 2026 00:58:55 -0700 (PDT)
Message-ID: <707c12dd-6e03-485e-a913-d7f0c719c126@oss.qualcomm.com>
Date: Mon, 19 Oct 2026 09:58:54 +0200
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v17 4/6] reboot: extend psc_reason with power-on and reset
 causes
To: Faruque Ansari <faruque.ansari@oss.qualcomm.com>,
        Sebastian Reichel <sre@kernel.org>, Benson Leung <bleung@chromium.org>,
        Tzung-Bi Shih <tzungbi@kernel.org>,
        Guenter Roeck <groeck@chromium.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Matti Vaittinen <mazziesaccount@gmail.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Oleksij Rempel <o.rempel@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>
Cc: linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, chrome-platform@lists.linux.dev,
        avaneesh.dwivedi@oss.qualcomm.com,
        Umang Chheda <umang.chheda@oss.qualcomm.com>,
        Ulf Hansson <ulfh@kernel.org>,
        Sebastian Reichel <sebastian.reichel@collabora.com>,
        Bradley Morgan <brads@mainlining.org>
References: <20261019-pscrr-framework-v17-0-69ea6cdf4731@oss.qualcomm.com>
 <20261019-pscrr-framework-v17-4-69ea6cdf4731@oss.qualcomm.com>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <20261019-pscrr-framework-v17-4-69ea6cdf4731@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDAzMSBTYWx0ZWRfX4AgdmUVEPtQx
 Bz/s08pTmlhWgZOM2dDNS127vvWsgBHwS1tX9xWYyH7SuftScEHPuKeFg5UrdgWOZ81qEcNdVac
 VhlTzlWpgMnvPcTr9amWG0RPfot8P1c=
X-Proofpoint-ORIG-GUID: 30XmVTBUBCa_z-qiUaRJhdey2R5xtdEC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDAzMSBTYWx0ZWRfX57c/7k7f4R/Y
 ku7BFmyBblxv8Lk6dQQNvyK79FDmjPbXFHz6bhD4/oIYdIbNmf45U4ZL5plihA/NyApWJtewmBa
 nvfR3q3zn2QDYfYhvflH2QNwdIyTbHxODDGzF87zRDa95KMZT+9wEpio3ivZs38Aqj1Cw3KtlSc
 Ct49RG35KrU1MjJrkHfjtiNb8VOF96DGWMLBHlY/kYjWJWWZ8b2LdrwHHVCae9Kl5vuXC5vEoxi
 O1pXzMsQT6UNTS4hrp2NHVxh2vIMHAJAmhzBdD+MsXjD+MQ20g8RZgeHfq+m3z4DSlF5rzdk+cO
 3KoOhdlpGdgGKObQfqCSZ1Oh9hV50dvgcUFIJfL6qREsCbX2vENHxvP2syzIhfKd3t+CCRSWOjw
 mUGXvxwLlv3EzWspo9vFzTRC5sOmsgJ1CIHIpDs5kptvbIkSH7xMUjHBgj/X0W+8XLLUdPicImY
 PgzFbQHrEXoOFk+6fVg==
X-Proofpoint-GUID: 30XmVTBUBCa_z-qiUaRJhdey2R5xtdEC
X-Authority-Analysis: v=2.4 cv=Zf2IpcVA c=1 sm=1 tr=0 ts=6ad5cdc1 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=pGLkceISAAAA:8
 a=OuZLqq7tAAAA:8 a=EUspDBNiAAAA:8 a=-fWPkMAOK6Nn3R5z3UIA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=AKGiAy9iJ-JzxKVHQNES:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_02,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0
 phishscore=0 priorityscore=1501 bulkscore=0 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610190031

On 10/19/26 09:38, Faruque Ansari wrote:
> psc_reason covered only the protection reasons. Extend it to mirror the
> full POWER_ON_REASON_* vocabulary - power-on, watchdog, software,
> external, RTC, reset button, CPU clock and crystal failures - so a
> provider can report why the system last powered on, not only why it was
> shut down. New values are appended to keep the existing numeric ABI.
> 
> Co-developed-by: Oleksij Rempel <o.rempel@pengutronix.de>
> Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>
> Reviewed-by: Matti Vaittinen <mazziesaccount@gmail.com>
> Reviewed-by: Bradley Morgan <brads@mainlining.org>
> Signed-off-by: Faruque Ansari <faruque.ansari@oss.qualcomm.com>
> 
> changes v16:
> - Add Reviewed-by tag from Bradley Morgan.
> changes v15:
> - add a static_assert() tying ARRAY_SIZE(psc_reason_descs) to
>    PSCR_REASON_COUNT, so a future enum addition without a matching
>    table entry fails the build instead of silently reading a hole
>    (Matti Vaittinen)
> - Add Reviewed-by tags from Matti Vaittinen.
> changes v12:
> - new patch
> ---

Reviewed-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>

