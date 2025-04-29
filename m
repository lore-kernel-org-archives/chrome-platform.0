Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D8F5274FF3
	for <chrome-platform@lists.linux.dev>; Tue, 29 Apr 2025 06:46:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745909221; cv=none; b=rREyyee+2ZDVuACvptyZhXEMMlFSoijVGhrmpdn1VkE2NuYoC2tPtHb4529mrOfGbKB7tqfIHqa8LndqF7nrEOe894nJ2mu/0+OTDVJqo6Jx0lKGpMajtVaJu5WCMVas9TgaWF5kLMoHwt9fyf0K67KVK1VUWTD0zmB3kiayIac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745909221; c=relaxed/simple;
	bh=tQU+tJgVddGo0bZ/bNkT49GRl80Y7q0CE1D4ZaVxOes=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ksCsk+lobT5ucZjGhpn9IUcJTWb/Gm5eraq4wjKU8Qz6fwKvFVohAj2Thc2mVNo4Ien/4d/iXMcuAmO3t1NnGjsxinY7E5esCymvcrWC89fF+dWwt9+t0RO/SRSd7Kv2M089Zmf2X4iXA10rlvu43TuDyqBak9cgrJbdK54Y2Mg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bolIncu5; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bolIncu5"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53SNqA5W011881
	for <chrome-platform@lists.linux.dev>; Tue, 29 Apr 2025 06:46:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fXD2/4RoMwMAQOQGCSOHyCUpamVhGvGUtKHG2LOsDSE=; b=bolIncu5OQPUuPaL
	qYylJxx/SL6MPyUEVmUMJy/rzA7MH3AT2sbSWoqguy0S73DIKGRMqHzUXcu7ltTs
	PIo1G/rfcbNcULKMzZ+o81pE8s/zmNuYgbtzQ00r781iuOMsjbGjz/dRCprBg12U
	P/k7AV5Fby1h0ZH7eRWEMw9xIH+fXi+uivf3sgPwR1WE82xiCH471mGI3pn18QsH
	0f30wJPw7kg74bafHZ8FqlJbea+LD8XSbXSqGJWVOCS42Ub1yU0La29G3Pr4QCGq
	h7joZdVkDcVwh2oCYymRA8Et6ewwbUjinyldzN27gllqDmBHRPVk+0Hdkvlgqh58
	tAVnbw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 468pg9bk04-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <chrome-platform@lists.linux.dev>; Tue, 29 Apr 2025 06:46:58 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c5e28d0cc0so936725685a.3
        for <chrome-platform@lists.linux.dev>; Mon, 28 Apr 2025 23:46:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745909218; x=1746514018;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fXD2/4RoMwMAQOQGCSOHyCUpamVhGvGUtKHG2LOsDSE=;
        b=Fw4idk1AvoDh0OxhGkVNWBNbpSEXldLqi+sAKlBEUr66K3q4YJ7ytN53XojNTKHDSL
         VYjhDDC/H6ZEMpRWkR3cxpncIRJ8Kh/bv+e5/qCK0dfRCUb4YJ0kartixl+bN6a7Qc/D
         6m7YTL7vspPR88Oa8wyujngf0BC4vL0J3EY0RWWiHJ27WyDkNhqBMn89vbQkrFDa+HzJ
         pGpwb7+MA2CV7XkV7kszqR9WTycZvOJ7lGdQVS3IZ+ctm7e4zxiV1lFChLzdF3mtiRZT
         nFhu8dsf9Jd0PXZnNUnyg/uMhPbEHd7kAvHqz7sbqPgrhwzODKFN4irvp8bbDdYM0rNK
         w3yw==
X-Forwarded-Encrypted: i=1; AJvYcCUVjUrVg/249RgnINq7ikNo1whfJZhxY7sLmTUWbd1AwfaJrG/268aIIZdkO3QjNSUug79ZNOEwyMNRbl6WvGM=@lists.linux.dev
X-Gm-Message-State: AOJu0Yyh/jd508eGd5G3VxQ2aM40UchxmuQU7niL1CuQPNvweVave/NL
	HCjJ/ytjdh1NHCTgyDQPBVFXmS4EKiXZ8dTcn/IwQvDIgEUrrBduebX/i2JpNvFpfhCj0dhA6EO
	SE/475zp6p+9RLCtD9n8MPqIHRTiFzhkPBo6XML3639xfr4wcf3iTgmRhD0MnePbinNo=
X-Gm-Gg: ASbGncsClqHAWS2cvEauKDqu3mpajZMDBHKg7Ms4ampMrK9/THTZcjoah1sHTzqp1I5
	M+o++bDclsTtjwn3SKS7chHiPGeBCNGHKUM/3/ibYY6IDeWde30PvRS5+lJVw1xhKnvT99cAYAD
	lAWmbAI5BDRtA1nzEHzf6EXmns4fDYQLEmAfSDCJ6EGLBb0zXMnw+GqMi3X5vtrjRpNMY7Y23VI
	YAy5SNpdB3CLqRRs6LQXlxvcHohjHaIHZlPdu1pT0gkZlIyVYVaRtvxe+x6+2DtDxSryYrVahFH
	maYEbAW4hTSzkB0LYWwi6cYRSMvDbV6pMJWJ2qGr56iy7mvPzP+F6U0GWviJQYBBNWxrVeMBqPw
	=
X-Received: by 2002:a05:622a:4184:b0:476:790c:73a7 with SMTP id d75a77b69052e-488682fcaf7mr32644121cf.40.1745909217938;
        Mon, 28 Apr 2025 23:46:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGK6Va6YvoqH/CzYGmylSrfBRs/HdUH0nb1egjkaNYM8I9FzI8kODYjY4grnbVXKRtCr8OiFg==
X-Received: by 2002:a05:622a:4184:b0:476:790c:73a7 with SMTP id d75a77b69052e-488682fcaf7mr32643841cf.40.1745909217649;
        Mon, 28 Apr 2025 23:46:57 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54e7ccb8a03sm1791093e87.259.2025.04.28.23.46.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Apr 2025 23:46:55 -0700 (PDT)
Date: Tue, 29 Apr 2025 09:46:52 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Stephen Boyd <swboyd@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>
Cc: linux-kernel@vger.kernel.org, patches@lists.linux.dev,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, devicetree@vger.kernel.org,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Rob Herring <robh@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Conor Dooley <conor+dt@kernel.org>, Benson Leung <bleung@chromium.org>,
        chrome-platform@lists.linux.dev, Pin-yen Lin <treapking@chromium.org>,
        Abhishek Pandit-Subedi <abhishekpandit@chromium.org>,
        =?utf-8?Q?=C5=81ukasz?= Bartosik <ukaszb@chromium.org>,
        Jameson Thies <jthies@google.com>,
        Andrei Kuchynski <akuchynski@chromium.org>
Subject: Re: [PATCH 2/7] platform/chrome: cros_ec_typec: Allow DP configure
 to work
Message-ID: <o5xngdkolgrkjp73yhq2gwzyo2koztpqxm7scbf6mfym3biwr7@msvf67d5envs>
References: <20250416000208.3568635-1-swboyd@chromium.org>
 <20250416000208.3568635-3-swboyd@chromium.org>
 <03cb5084-38ef-4827-9951-f54880ca8a07@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <03cb5084-38ef-4827-9951-f54880ca8a07@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=ZpvtK87G c=1 sm=1 tr=0 ts=681075e2 cx=c_pps a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=cm27Pg_UAAAA:8 a=VwQbUJbxAAAA:8 a=1XWaLZrsAAAA:8 a=yEET-rYJ_iZV8nkrigoA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: p08692neU965aVFGU69eWwu3HSmkVFHU
X-Proofpoint-GUID: p08692neU965aVFGU69eWwu3HSmkVFHU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI5MDA1MCBTYWx0ZWRfXxaFUTf4lObgs 2vfVeBkMhUdQydqdN0nqT0KXSW6xd5Ztr5egScd0vahY/5d0Y+4rheDcChhgrApbsfbNZjYZbem RjI1LIq9As8ObfoY2/J5xDS8I5RUK6ezKB3n8zFyLfVFZFwBqjnDfptbFE/3yIFq3/LXwqQ1ZYz
 oQp22t/IF23XZCsrtedeozO9VMXAoqCZeK4RKiZwzB9Sn2kajyFik0218Cc7PLXtiOVciM5mg/X gHNdKw1AZEuX1FcdOfV0slgjln9WaO9cFtPPJkalWXgfpbVe0i8DLfci/XbMW15D7enUtE+cAy/ e4GwrX0evDI4zWjn2PRPsdRwsm32jG3j266au1Hp5AtLu1x8gIR7//REqwICfcstBgwc4a3Vhfg
 MQwCPeNsN3CL7MNa8byoigmDiAK+5RUI/EplBg+u9W4cHZvsyiJ4aP+SKSeJaVpdYUAaweMO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-29_02,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 impostorscore=0
 mlxscore=0 bulkscore=0 mlxlogscore=999 malwarescore=0 adultscore=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 suspectscore=0
 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504290050

On Tue, Apr 22, 2025 at 04:37:53PM +0300, Dmitry Baryshkov wrote:
> On 16/04/2025 03:02, Stephen Boyd wrote:
> > The DP altmode driver fails the configure stage because the status VDO
> > that is spoofed in cros_typec_enable_dp() is missing a couple flags. Add
> > them so that the configure succeeds. This has the nice side effect of
> > properly reflecting the pin assignment and configuration of the DP
> > altmode in sysfs.
> 
> 
> Fixes?

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> 
> > 
> > Cc: Benson Leung <bleung@chromium.org>
> > Cc: Tzung-Bi Shih <tzungbi@kernel.org>
> > Cc: <chrome-platform@lists.linux.dev>
> > Cc: Pin-yen Lin <treapking@chromium.org>
> > Cc: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
> > Cc: Łukasz Bartosik <ukaszb@chromium.org>
> > Cc: Jameson Thies <jthies@google.com>
> > Cc: Andrei Kuchynski <akuchynski@chromium.org>
> > Signed-off-by: Stephen Boyd <swboyd@chromium.org>
> > ---
> >   drivers/platform/chrome/cros_ec_typec.c | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/platform/chrome/cros_ec_typec.c b/drivers/platform/chrome/cros_ec_typec.c
> > index 6ee182101bc9..2cbe29f08064 100644
> > --- a/drivers/platform/chrome/cros_ec_typec.c
> > +++ b/drivers/platform/chrome/cros_ec_typec.c
> > @@ -531,7 +531,7 @@ static int cros_typec_enable_dp(struct cros_typec_data *typec,
> >   	}
> >   	/* Status VDO. */
> > -	dp_data.status = DP_STATUS_ENABLED;
> > +	dp_data.status = DP_STATUS_ENABLED | DP_STATUS_CON_UFP_D | DP_STATUS_PREFER_MULTI_FUNC;
> >   	if (port->mux_flags & USB_PD_MUX_HPD_IRQ)
> >   		dp_data.status |= DP_STATUS_IRQ_HPD;
> >   	if (port->mux_flags & USB_PD_MUX_HPD_LVL)
> 
> 
> -- 
> With best wishes
> Dmitry

-- 
With best wishes
Dmitry
