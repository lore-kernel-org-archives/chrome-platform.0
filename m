Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793604244;
	b=yy/OfOUGCq22TsAKyq2Q8ehuBX/bb/p773ZWISyubDuZb7nnlWIbz1yOaDhkIGhVP4S7
	 q/+ZmZzzrY2E8xwBboh2W6+/XGac7gUbY/bADTMjJlVuUIu5opQ8Tp8F4N8Lv/sjYL94C
	 Q8yrgZOomKVLMm4nn9odNOFSE7j0OtgCLVrij3Qo3PqhDtZUUFAfgpoEjWyteOHqCpMXV
	 8Da5B3JcqGfBcrptgGyPf7guKW1MtwmSDskwAJI5yEIUvHw8G8QvVXMW6v/d/ADLsdhNR
	 9jgwgl7DEPP058zRs3JEW19WiTUK36uVZL1TXOlFvbTidIpO6rnqP+K1fXuJ/M12Ckg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793604244;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=E1wMT+/ccKcF5sYLZnsI1jaWTQsigD5t+XChwFqJkLg=;
	b=SmJMvu8VpI3kbOUgYYO20la12OVR1vB1ti1DBrtcv38wHxtgA8A04I51ZvN/qUYe/Afk
	 zAM0K0Qimmi+o1Cvws1s/zyDhororSXdJKOwCRMzqUN7DAsThAXpKaaGkd3zne+hpmnLO
	 2/SpRTwP4VO+ocD56RuW0mFwST/teSYIW7AoJzDrv0mHQCDbMAR79din1c/KWXXOOF2lM
	 pJmkAfQWgEQLFKyApC+7d7Tum9VbwOv8WYwQVXyhzoM4DiIgp+WzA06GXFIQERgokhqxb
	 0IcYwqTRoSKuJVHHxuLchXjlkK1sfcW5KJKEvEgqRLRlhDSeBPQd2sfcgrDf8Fs2iOg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nnKj8gyD;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dXXsXq75;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCC45606A326
	for <chrome-platform@lists.linux.dev>; Mon,  2 Nov 2026 07:24:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DCC45606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nnKj8gyD;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dXXsXq75
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A23vVpU2192534
	for <chrome-platform@lists.linux.dev>; Mon, 2 Nov 2026 07:24:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	E1wMT+/ccKcF5sYLZnsI1jaWTQsigD5t+XChwFqJkLg=; b=nnKj8gyDjIMqMZhg
	Zps7qYWTR0bBKOMv6zZJo0Eu396pDcc9Bu08rQNbvKXfShVl08suoOu2ZHNxTyvg
	oDyczpkUwDGPm0rEjTk+QhcCsg9uoOlmEZ6zRu+oAGyKyF4uUeJakt5ExPSbzink
	DR7My4eZjIkfXjkfPh1gLWHJgIqJs17ZG/zrqKwI5z7hlVckbqGkXPnkNFrz2tmG
	7lOThCFqboVfbVZEndjz/xh5RhVIJ3+sd4auujgbJgIuNXLqPwMKQkKda36FuvIj
	EyFRv0vqSumHR8WnnRcPWIWMv2h8QHPZQAKkPcaj+7s3Ae1MTYEvH3z+3HMjf8oC
	/8eTHg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn93enh6k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <chrome-platform@lists.linux.dev>; Mon, 02 Nov 2026 07:24:03 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3abfcf726dcso3776443a91.2
        for <chrome-platform@lists.linux.dev>; Sun, 01 Nov 2026 23:24:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793604242; x=1794209042; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=E1wMT+/ccKcF5sYLZnsI1jaWTQsigD5t+XChwFqJkLg=;
        b=dXXsXq75rv2VQtAHQbdi8PIgDfnkjyYF4Sm5U9P728uZlaBygPsBxfh1MooRp8zkry
         LGuFXSffFb2gfyWiaJVW+wG3gyntZ08iB2ravSGTu+GPv6/eziAk6WHBVHeQjCi2rcLy
         NLoc0+59ssTFIg4dNRiyXSzwBswrsfjCwoEDnD8u7nEpnaRDav0mxFjpSL+Ywgo1L+eB
         QfE0P7eInzcfd3fqYGy10FwPqpWvG3J58l2cukYgIb6k7Tt4x2KiNRv86d8o2XfqYBVv
         czrmszBI1wbbCJClxo0hlHNgl6WgjH0tsh+YdpC1by/FVKtiLfoPYFaSloSzpbrB6Q9m
         2/NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793604242; x=1794209042;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=E1wMT+/ccKcF5sYLZnsI1jaWTQsigD5t+XChwFqJkLg=;
        b=dGvhmxGkluyw2ae/h6bSribp+0Ejye5gZGWsMJCTW6cox3N9iCq8yRVtAu5b4p587N
         l0+W1fUArnBKOEbGCKs3zyvQQ6AhsDGnWQhARhjC00BymbnlU2c1CQF9OEVTMCYQJaHo
         1nCcJ+ppwgwNo0eZwLhHDnrv7vGiM4zV+2FlWBHDpQui8sGHdWO/2AierLqUFs7kzyNI
         /8S2Dl8u22s7RfOHwYF5aA1aeZ5l70ol6oQu3+3a4Az6xvpux40enlpu08GKWyHruVSl
         omCnGVOpvDS81W3EaeqDO6RQz440/aOgVnuanWW4fGuVpOuF9tPyDSWVu5fgB/TAaoTg
         7rqw==
X-Forwarded-Encrypted: i=1; AKwUvBzDvazhFwjfAlID7ytMzffALgIx86YDL70nillfGKuq6AJ7DT6JgBP+Oqbkld8sAZUDB3u2CznC/ad/mUBo6m4=@lists.linux.dev
X-Gm-Message-State: APuU4Z8OlskBcI3+KQFGnedSFMoatJsuzcexfj5XrBoZLqTgmp2DSFqP
	oDjMvP3jdPLZFp1QVXrfT5pLfRKheXEMWVnp9PruLsc8wBFL+uRTp16iUc3zdY7TEY5x2iPv/bE
	PIZjnS+P6Q07hbHp+/9uw8BtZRUzH90MY0xjvcgIK7MoT0uzWuSMKcCvucpXjqDkP04cXXQ==
X-Gm-Gg: AYBFou3hSm743SJxKPSCXThL2ITXuIfEdcRwWXHKJurr+ZcSQeDUviQjjrOnh4XQM8d
	QNkZ2oCIc2fkQhDO2sK9F62GeoPnxVIJRva0Tn6emrEPtBhODGup0nL+dxCY4DWLuZMRzRHcpit
	mZiT7fFfwV4NgTxgUzqSe33fESJ469veNvNfoEBbjwlrKH/2tK3CAniDRDaWqjCRppt5WBj3IwL
	j20mzknLV0AkCM3xvdYVVJVrAX5w2LXUKI0KIEk/9TZiUw6yfaxp0NAfr2RILbt6B1JAzftoya1
	xBRjoyCXD1ELcdUNRKyqFFHhK+dm4ODkHRK719rrN9jx0cJ4NU5l6gQtDKyX2ZD3u1PvCBqemKx
	QiMHlaaKmqzgmPS63t5LHwFPN1i45F5PSWpjpOqBOU0UZuWLTJ4fzfQKGz3H5MIreUqnU6yR8Ss
	SrRw==
X-Received: by 2002:a17:90b:1f92:b0:3ad:6090:a183 with SMTP id 98e67ed59e1d1-3ae897c8014mr7947697a91.16.1793604242157;
        Sun, 01 Nov 2026 23:24:02 -0800 (PST)
X-Received: by 2002:a17:90b:1f92:b0:3ad:6090:a183 with SMTP id 98e67ed59e1d1-3ae897c8014mr7947678a91.16.1793604241625;
        Sun, 01 Nov 2026 23:24:01 -0800 (PST)
Received: from [10.218.33.235] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3aebc8942e0sm4048361a91.7.2026.11.01.23.23.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 01 Nov 2026 23:24:01 -0800 (PST)
Message-ID: <310fd443-4cbc-4dcc-884f-6cd23d5f9c10@oss.qualcomm.com>
Date: Mon, 2 Nov 2026 12:53:52 +0530
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDAyOSBTYWx0ZWRfX2tzI7boQjc04
 UkS176JTvueqWffPfY4nL8GSG+/rARFJJeKV9DruE62adfiroUZ55nL/DMxJuWj7M3EQ1eOTyJY
 pMWoYRjtm8gkuBEPRy7IUDUp1ErGe8xEb/la4Kj0JX8gm0qv4J2k9xgBiDB5HC4eIQaZU5E6FT6
 Ou+lAJ8I3Bp9bMEl3saN50EH1JRFLoaob1nKqGYwy/219EfNiydsR3Zn+3sx+QXevqUw95G3qr0
 CpQjL+d5lJ2/APplvNe3AFCA8aO4mqi6KVDTA+VyIxXE+yB/57rm/pw2TMzIrWU2/x0dqZcsjNU
 h/ZfECwS/slI9TUKghQBleFz+1s/XvhsqnVDmywwyquPhUbjfyZtKWhqEQFSRejx1/TuHmVGu3D
 Ax9QwFAg/j6H5wonUFeGB3NxB8nJ9X/Owe3SriRDHGJpDrJegWdfIWa7oTiWL3tR3rAc3aNFufd
 6684ftR0M4khjbqY5YQ==
X-Authority-Analysis: v=2.4 cv=FciiV5+6 c=1 sm=1 tr=0 ts=6ae83a93 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=ftlb9jb6QNwlQdeFhJ8A:9 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: rycPnSrfwEzUEqNRz_vkM-BhkpGBAPaI
X-Proofpoint-GUID: rycPnSrfwEzUEqNRz_vkM-BhkpGBAPaI
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDAyOSBTYWx0ZWRfXxrXI0sI59tBu
 DKtyWKhRDAMieRVZ4cG965YQg0qaF4tqVgJxxl1FLbtH/rWrx4COUTS0IHJDWNCBS0buQVp6t5j
 4ePj+uaWDIucTrvmSSPHBkvztlcq2uo=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 impostorscore=0 suspectscore=0 malwarescore=0
 lowpriorityscore=0 priorityscore=1501 phishscore=0 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020029

Hi Sebastian,

Gentle ping on this series. I've addressed all the comments 
raised till v16, and there are no outstanding concerns on v17 
from any maintainer --Matti, Daniel, and Bradley have reviewed 
with Reviewed-by tags, and you already gave one on patch 1.

Please let me know your thoughts, or if there's anything you'd 
like me to revise.

Thanks,
Faruque Ansari
