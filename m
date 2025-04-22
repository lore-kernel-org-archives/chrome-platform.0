Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BA1427CCD9
	for <chrome-platform@lists.linux.dev>; Tue, 22 Apr 2025 13:37:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745329082; cv=none; b=Jv0ZLZ+T5hnYQbeW540GdxlRM800vPDMNDKa0EMIipg6Glt4YGWb0FWx5jRiyIUB9K/oX6/oaTpco0VSt2zFq2stZBUNjKnVZL9pNiibftimjFootaCEf/DatvkR5D+y+49/HI3vACqQzuaMiCBZHqrGBD+npr+a1uP7ftGhyco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745329082; c=relaxed/simple;
	bh=hs/KULLT3NdIW9FT/4EVSYghokrCjq2zBPZXmtOIrKo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SR2zATXhxmfO65zwHHNnV4mn+hHxBiEHg1HYXbQ9NLnZThXLf20LI4PaiuoCg9ANUYMDW/ULLlye3tx/G74JE2NB1bGV9UJIWPLykbZXxr/U2P6Bh9aEmRge8GzjJQZo7ny9tNqHVT68tFOyJSgM+4Ie2OqBwQ+Jo3dOv459pq8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aeADmndm; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aeADmndm"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53MCQdQO025905
	for <chrome-platform@lists.linux.dev>; Tue, 22 Apr 2025 13:37:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GM4iFtyzqSsCummFikJQupbCmlSMeouuwE+lB7Uj1zQ=; b=aeADmndm6tJVAhfa
	m9hM9FuJQrSmny9BgTCNxJOzoQ4Aw0p46VZStJpnpYi2iHC6Uf7qzzbtPoeXWns/
	t9+vw/E2i5quOOBUxOH5tDxkVDOnyHBQzrXTL6s32o+o5aW7o+nAMqgDCjtDk0FK
	/6/x4n2i08PSmMc+U80uLETxgAvNB5Ls9QSsMz8AGZOs5FXgJcxp+WL8i1XJL/bu
	c/VfwFe7EMjLn08xeMb0fkm5d5aYi8kiBe1wh7IttwgLvmTQTFGE+GuGoQlQR8RQ
	LDbFA3VGPpC0MfsvUgoiWPCjhVFLNvm1kP6Y270XVq+2eWTuJNfGFsj/boJjDQ9V
	I5VJmQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4644kjffdp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <chrome-platform@lists.linux.dev>; Tue, 22 Apr 2025 13:37:57 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6e90788e2a7so72698236d6.0
        for <chrome-platform@lists.linux.dev>; Tue, 22 Apr 2025 06:37:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745329076; x=1745933876;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GM4iFtyzqSsCummFikJQupbCmlSMeouuwE+lB7Uj1zQ=;
        b=fCivACYWbOQun22gkg7anTCyrPvAk3+o3HfVoM/O3xp7XnGi03w7N6cOhlkJx7aOBV
         LIrYEJKEQBFf221QC/RDrkVhDcD8MCiwpPVEES1zO/vHSLFDcwtAr9g1E4Vzcd+nFBOt
         3S2FY19lltHG86lYlSnWGozMczt5+WIdqYS+bEUW6gRUdwU9nDD0xaCUcwGZJtB+pHHF
         Dhq/+3uGWfnxwcOiaeR4cujbAkZJNrOs7bCiSy6K/3PC9yEc6OvSsMyTgPCUPYMgAjDa
         1JeMRwGphmONdxT3Yr/Ib9o137oZmxvRvKYNtlo8GCQbz9OwtJdYCt6JQdLGT0DbwkUn
         dkiA==
X-Forwarded-Encrypted: i=1; AJvYcCXxZd/mddFGaW+6Q1GRHch8q98oVQ/myK40mgAFrNiWs905rv3Ug6CiQXc/4NPKYfztLhqAWSxbvgIv74Z7sts=@lists.linux.dev
X-Gm-Message-State: AOJu0YxeZC6nlXZYxSa5dl8glkYQa8n1p0I7ezx+vOnDFMr8hfxefubq
	GcN+12aZVtLGCbYB+Y1PQUm6Z6f6BH47bMfHIy30bgC30frSyv0aXOxv5N6BeU+DWLQ0YXnKVCz
	BO8z1D7ANDGXFOMiNyHYcg3CSqg8HP7hDzPzlgms+JSuK0+MEN0m5olW19jMgoJOkmfE=
X-Gm-Gg: ASbGncvIUAWRPpo2StTeKxwAYWMklM3SB+LhX53JesgiOc3Zdm8U/Lg8GiwHzvI9yAb
	16q0C5QLV0uaf0yEBEduxRIiFo6OpOEM6Jd96Kl5U0KnrwDz9ABlsGfTThbb+DZBUubI1bllHpl
	nTpDUBjjLWNazbKhYTkkT+DNRftioM5nIIPtoYMDbGBKkSXAO3MNVXsSrMIc1SX8H1/tuh+myxf
	gC/jykQ/AI9/w6qjr+7MgBUXUqNp/NCuQc/7twTR634QkCsWhqxQdU7wBdD8Wl0H4+wPXIH88e/
	L9RK/+l/73W+K5+TQXD1HcGvpZv/4DM5W8fS7jdfu89HLm2XRCle4/MA/cT8+HO/kRAEtWDi3Eh
	3tB1Cibpx2LBw+tQ4eUsWQ1uUips8wiPXzsgXvnDFwes7h1cTHfEK9t/IVS0Ktfk3
X-Received: by 2002:a05:6214:124e:b0:6e4:4adb:8c29 with SMTP id 6a1803df08f44-6f2c270088fmr272713796d6.12.1745329075734;
        Tue, 22 Apr 2025 06:37:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFs5xmFsFakaRJU+iwqHLQfYpkknb90+sqtIxpjfjRPKBSqlIlI7xF2xKWLEcXvzJJAnoNEDA==
X-Received: by 2002:a05:6214:124e:b0:6e4:4adb:8c29 with SMTP id 6a1803df08f44-6f2c270088fmr272713396d6.12.1745329075396;
        Tue, 22 Apr 2025 06:37:55 -0700 (PDT)
Received: from ?IPV6:2001:14bb:a2:9556:18c8:3d0b:b936:c848? (2001-14bb-a2-9556-18c8-3d0b-b936-c848.rev.dnainternet.fi. [2001:14bb:a2:9556:18c8:3d0b:b936:c848])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3109084d9d0sm14805871fa.97.2025.04.22.06.37.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Apr 2025 06:37:54 -0700 (PDT)
Message-ID: <03cb5084-38ef-4827-9951-f54880ca8a07@oss.qualcomm.com>
Date: Tue, 22 Apr 2025 16:37:53 +0300
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/7] platform/chrome: cros_ec_typec: Allow DP configure to
 work
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
        =?UTF-8?Q?=C5=81ukasz_Bartosik?= <ukaszb@chromium.org>,
        Jameson Thies <jthies@google.com>,
        Andrei Kuchynski <akuchynski@chromium.org>
References: <20250416000208.3568635-1-swboyd@chromium.org>
 <20250416000208.3568635-3-swboyd@chromium.org>
Content-Language: en-US
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
In-Reply-To: <20250416000208.3568635-3-swboyd@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: wRK9_EZiE_msEbxKxUoY76FR9eYsF0Ym
X-Authority-Analysis: v=2.4 cv=f5pIBPyM c=1 sm=1 tr=0 ts=68079bb5 cx=c_pps a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=cm27Pg_UAAAA:8 a=VwQbUJbxAAAA:8 a=1XWaLZrsAAAA:8 a=3E2bT0mqOhGjLt7avEEA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-ORIG-GUID: wRK9_EZiE_msEbxKxUoY76FR9eYsF0Ym
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-22_06,2025-04-21_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 malwarescore=0
 mlxlogscore=999 mlxscore=0 impostorscore=0 adultscore=0 priorityscore=1501
 clxscore=1015 suspectscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504220103

On 16/04/2025 03:02, Stephen Boyd wrote:
> The DP altmode driver fails the configure stage because the status VDO
> that is spoofed in cros_typec_enable_dp() is missing a couple flags. Add
> them so that the configure succeeds. This has the nice side effect of
> properly reflecting the pin assignment and configuration of the DP
> altmode in sysfs.


Fixes?

> 
> Cc: Benson Leung <bleung@chromium.org>
> Cc: Tzung-Bi Shih <tzungbi@kernel.org>
> Cc: <chrome-platform@lists.linux.dev>
> Cc: Pin-yen Lin <treapking@chromium.org>
> Cc: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
> Cc: Łukasz Bartosik <ukaszb@chromium.org>
> Cc: Jameson Thies <jthies@google.com>
> Cc: Andrei Kuchynski <akuchynski@chromium.org>
> Signed-off-by: Stephen Boyd <swboyd@chromium.org>
> ---
>   drivers/platform/chrome/cros_ec_typec.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/platform/chrome/cros_ec_typec.c b/drivers/platform/chrome/cros_ec_typec.c
> index 6ee182101bc9..2cbe29f08064 100644
> --- a/drivers/platform/chrome/cros_ec_typec.c
> +++ b/drivers/platform/chrome/cros_ec_typec.c
> @@ -531,7 +531,7 @@ static int cros_typec_enable_dp(struct cros_typec_data *typec,
>   	}
>   
>   	/* Status VDO. */
> -	dp_data.status = DP_STATUS_ENABLED;
> +	dp_data.status = DP_STATUS_ENABLED | DP_STATUS_CON_UFP_D | DP_STATUS_PREFER_MULTI_FUNC;
>   	if (port->mux_flags & USB_PD_MUX_HPD_IRQ)
>   		dp_data.status |= DP_STATUS_IRQ_HPD;
>   	if (port->mux_flags & USB_PD_MUX_HPD_LVL)


-- 
With best wishes
Dmitry
