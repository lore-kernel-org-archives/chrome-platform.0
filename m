Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6634E3E51E7
	for <chrome-platform@lists.linux.dev>; Mon,  6 Jul 2026 08:28:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783326513; cv=none; b=SPVm8c7aaO5e2Ubvb+J5ptVgp7HAaW3sYGClsn6ESfbITn+ZMv2LGeQgRGcnxw0AjSoQpO9EaNmcy+0jY2bfeA1ShhvSr1Aj6O/RkL9rafRxfuzm8QBFQ99l9AjQU3fLWbDREmZzZHzy322aDge1lwTEvV8bDRcGJWzQqszmRE4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783326513; c=relaxed/simple;
	bh=JJvjvXzlCcli26w+i5Hirhm7MyXZ6wjDQGioyQ2O3Fo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CkuQ/bcp5H3/LZ2QKWibouKL0BfCc7R/55DXuwbyu7sTzBkKm1HRHTFc6sGDVVpevTPqToo7Wqwi/PJQ2OUw9dVrAEQPpGGU9DLs8G2Mhk8VM9xyWrAwO4Tq4BGiAPEZrWptwcIUa3bW8sISgnvbdvhq5WiTcwh90p4OE9f64pI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jm0Kg9lS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cdlsrvl2; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jm0Kg9lS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cdlsrvl2"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66678N8i3976966
	for <chrome-platform@lists.linux.dev>; Mon, 6 Jul 2026 08:28:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XAhBIVcIgoBMwzdmQI01e6U2QYtMrrtbbOHKP8KiZ8E=; b=jm0Kg9lSibJvV8Yi
	8hdJzAn4zgpP2byZ5O4vxPHA667bXVLXHofUt568kB49iHxnfwvFhctaInLtCjCZ
	sjNHRodxgeyEI+K4Sh5SeEFuH+eYubHtMfiWH/bAUEFyu7LxqpBoChobn1qyHVpZ
	1rLLI4FJJqj/Yk953HEONXVBT+N6ylBmW+SjTQeQEVhfTmxCK8O9BG8vaRt3Exir
	JXmS8JQhSMmJuTk8SMinF8d+mY+jVTVBRkY8NqkZa2/Ot0bSxasJBedLFZ9P4/jy
	oIqrv4PZJHfl9zhVgr7IHFht7qp40w3MPq61gyA4heu2IH0hVtB6bY7pBm7HdH1D
	jKj/ig==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f87q7g9ye-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <chrome-platform@lists.linux.dev>; Mon, 06 Jul 2026 08:28:22 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-8f000e221d7so26292506d6.0
        for <chrome-platform@lists.linux.dev>; Mon, 06 Jul 2026 01:28:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783326501; x=1783931301; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=XAhBIVcIgoBMwzdmQI01e6U2QYtMrrtbbOHKP8KiZ8E=;
        b=cdlsrvl2vGyGE/uh6jqpWUUZq8qEvjPkkkE9it941s2HM6s0OX7QOBFV8Yy16zZrmp
         7Lv4GIoKemmFOpjmQMJyKZ5zwPQdjdJyiUtUuHEsG68uyT+xtFk/jNaL9esciZ2RDbUF
         zbrl/q+w52Pb46nRBciJwQz0/nfxl1kstztrb/djJKHhEcD5JOxAeL8h0YQKqP3ZEHjw
         +SeY0fbCSwrNE8oQUPOqKunmcTz3C53F3E810dzMZHwFtiE+YEI7Jyhwvw5oY2/TwZpD
         tjaq3bt5lzujtKzJCua0LhEv5y3uEaAgPmCrAj+GqX+MxTFJHFTnqfwJ845VC7F9VyXt
         ERHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783326501; x=1783931301;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XAhBIVcIgoBMwzdmQI01e6U2QYtMrrtbbOHKP8KiZ8E=;
        b=c7fwE9D/7uDJaDgSEAQP4RvPR1wE9yE2zj34llCMYa+7h1HG0nS1Whi938Wsz2ImYN
         5UQxerzW0AivEqj6Fie7zUeWdSAyW1695M3d1mXwhhk6XoGkxjTw13OrGnzmRHU+cnLr
         kXcGD9OmYZpfFdQFXfaV6u0/V72oLso94W50jyBlp5sTbZ2pMu8tUeL8Q5dTUaj1uMRU
         M4zlYm5sEL4FI2yx/ZiyxbzUQLG5uK+yF5QjpHX+EIGtzn/GL6So3yruolUlAEtulQGe
         pY/NymlgW26KdL/8levR+IrHATP3+eymY9yktGfsolqNx4A/W9hi1f4iyv4eXAj7luQC
         w73A==
X-Forwarded-Encrypted: i=1; AHgh+RqdnHptEgiggI40jA9ovH9Gqh8x+xZxcKQYQNOghrkg19rDwn04MqX97D5Vzowcf6X8z3AtmunWr5cE1bk4S9M=@lists.linux.dev
X-Gm-Message-State: AOJu0YzEkhJiozmyesiFiXjGRbkvB++GYiak9PT/OrjOREOgrwJdQn47
	36+bVNwsfjNOxL4buRhJ4TmRYGDKyXjb0nGnkXDQnKwoJcFjp1KEsPBqpJ4ddcUmisDb4UJekbZ
	nPYw/7uqD00runVPa8jLpoSWrUO1jEOd3MyrioVD7P+zHZl/d0jA+29D36XT8eNjEUG6r/n8=
X-Gm-Gg: AfdE7cmu+CG8iFQSv6RehnICnjz4IIVfKt2KidazJUcN0RBxRffu8Gr46MjqIFemcAn
	wwamopVAVIlFpxh0f+aPglYvOQl3aE3ZuzUDizbqbm73sqvtr/QUGBO8a/CWxPLb7km4ZmGxjKA
	9zgqthGgN9OOKDRybUo3SNGAOD9zOvSZrBXgs8q7d9PP6WQ+FQxauIj20i7P30b6lNX53OV+xOm
	vhNNEmL3OPEcA0Hx87aIIL44S0UZyXhy6KptUpCo9adx8mpdXIuOX7i/ng/c1DykRs+gogyfard
	PFXaR84JM41jY0sd4Witc5tEssyKQtZ09+IM0nVRMWiFu1zhx+xLEx33e0x1+0aFz6dk709s8MU
	ySWgtjewMg7lfAiv/osGbKpM9nSej9Bf8iax18GjJbqQ1aebezE40Aa7BHAPVUA==
X-Received: by 2002:a05:620a:2b84:b0:92e:47d4:b485 with SMTP id af79cd13be357-92e9a4ed0e1mr1294190885a.62.1783326501608;
        Mon, 06 Jul 2026 01:28:21 -0700 (PDT)
X-Received: by 2002:a05:620a:2b84:b0:92e:47d4:b485 with SMTP id af79cd13be357-92e9a4ed0e1mr1294189385a.62.1783326501174;
        Mon, 06 Jul 2026 01:28:21 -0700 (PDT)
Received: from [192.168.69.219] (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c12b62907absm677939066b.33.2026.07.06.01.28.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jul 2026 01:28:20 -0700 (PDT)
Message-ID: <bc697542-b1e2-41c2-af36-b708ca4aad5c@oss.qualcomm.com>
Date: Mon, 6 Jul 2026 10:28:16 +0200
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 4/5] pwm: Unify coding style of of_device_id arrays
Content-Language: en-US
To: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig_=28The_Capable_Hub=29?=
 <u.kleine-koenig@baylibre.com>,
        Chen Wang <chen.wang@linux.dev>
Cc: linux-pwm@vger.kernel.org, Sven Peter <sven@kernel.org>,
        Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Claudiu Beznea <claudiu.beznea@tuxon.dev>, Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Benson Leung <bleung@chromium.org>,
        Guenter Roeck <groeck@chromium.org>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Paul Cercueil <paul@crapouillou.net>,
        Vladimir Zapolskiy <vz@mleia.com>,
        Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>, Heiko Stuebner <heiko@sntech.de>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Peter Griffin <peter.griffin@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>, Paul Walmsley <pjw@kernel.org>,
        Samuel Holland <samuel.holland@sifive.com>,
        Michael Walle
 <mwalle@kernel.org>,
        Inochi Amaoto <inochiama@gmail.com>, Orson Zhai <orsonzhai@gmail.com>,
        Baolin Wang
 <baolin.wang@linux.alibaba.com>,
        Chunyan Zhang <zhang.lyra@gmail.com>,
        Fabrice Gasnier <fabrice.gasnier@foss.st.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Chen-Yu Tsai <wens@kernel.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Hammer Hsieh <hammerh0314@gmail.com>,
        Nobuhiro Iwamatsu <nobuhiro.iwamatsu.x90@mail.toshiba>,
        Alexey Charkov <alchark@gmail.com>,
        Sean Anderson <sean.anderson@linux.dev>,
        Michal Simek <michal.simek@amd.com>, asahi@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-rpi-kernel@lists.infradead.org, chrome-platform@lists.linux.dev,
        imx@lists.linux.dev, linux-mips@vger.kernel.org,
        linux-amlogic@lists.infradead.org, linux-mediatek@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-riscv@lists.infradead.org,
        sophgo@lists.linux.dev, linux-stm32@st-md-mailman.stormreply.com,
        linux-sunxi@lists.linux.dev
References: <cover.1783263835.git.ukleinek@kernel.org>
 <20de6cd60c2938aad2d21397b92742849418ab1b.1783263835.git.ukleinek@kernel.org>
 <973f3d6f-6ff4-4685-9c9f-b07987f74d98@linux.dev> <aktWoIfY_DdO6gb4@monoceros>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <aktWoIfY_DdO6gb4@monoceros>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDA4MyBTYWx0ZWRfXxBzplyJunP9l
 rU79BP4QG8Drch2O22OhGtL+O7UTh6QifpIA5vB7gB5oVkR3ypgUCKd6omc/YfuEnGH5WMQxlTZ
 0HfQ83HfvmqId7206tn2q3jnVQ0MdOiMq5SBZBvomNj3NSE8loGYsBg1dHfrcGv9T0kQ9vwTb4U
 WAHeH+mySioXuDpf3NLnx305U7syMpyL4RTQEg6QD3gPQtbaL6YcXgnxxeTSwkZWT2BXy3Z26Rm
 c5HgfwgCB579gsNkTJ0RQP+hkEsu37pnlXsBplbCbjxaWO2L7ydDIU3WkZ1WGJPcBKaueH7gy45
 /Omvuxnsh+SBsWK5R+mEQrijpXIEH8/4iVx3HgaggRV1L84/fC77NqBl5qpwoAM27UKTZOs7WSe
 vMC7Zj4WaZ0+5u6HeI6bh8msCjHszH5g7/WnmmpYL4ebChVESQDZX36S4sEI0P9K4P3opxOskLr
 Nj+cSeRuIRrZP2ApHYg==
X-Proofpoint-ORIG-GUID: NuznDikUIh1_HhUPYb2spuqqsJfE_uoO
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDA4MyBTYWx0ZWRfX/McnmXT14a8+
 Qpm+g/AH/Ta1GGZQz+KG+Oif27H3Px0VOBIwJ4loIlHni0DN1JlsjyHkYE2XNAiCOnckkvt5jf2
 fLWUhiqzduI4vgIns+kP3VoOOSZVdwI=
X-Proofpoint-GUID: NuznDikUIh1_HhUPYb2spuqqsJfE_uoO
X-Authority-Analysis: v=2.4 cv=f9N4wuyM c=1 sm=1 tr=0 ts=6a4b6726 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=8pif782wAAAA:8 a=IpJZQVW2AAAA:8 a=TiEZW8bMWLlPbLH3YMsA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22 a=IawgGOuG5U0WyFbmm1f5:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-05_02,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 impostorscore=0 bulkscore=0 suspectscore=0
 clxscore=1011 spamscore=0 phishscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060083

Hi Uwe,

On 6/7/26 09:19, Uwe Kleine-KÃ¶nig (The Capable Hub) wrote:
> Hello Chen,
> 
> On Mon, Jul 06, 2026 at 08:33:47AM +0800, Chen Wang wrote:
>> On 7/5/2026 11:14 PM, Uwe Kleine-König (The Capable Hub) wrote:
>>>    - Use a single space in a of_device_id array terminator; A single space
>>>      after the opening { and before the closing } in non-empty
>>>      initializers;
>>>    - No comma after an array terminator;
>>>    - Also no trailing comma after a named initializer iff the
>> iff -> if
> 
> This is actually intended. iff = "if and only if", see e.g.
> https://en.wikipedia.org/wiki/If_and_only_if .

I agree this scientific idiomatic expression is not well known
by non-native English speakers, and using the expanded form is
just simpler to review (thinking at non-native English speaker
reading your commit in the future).

> 
>>>      closing } is on the same line;
>>>
>>> Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
>>
>> [......]

