Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD8C0265626
	for <chrome-platform@lists.linux.dev>; Tue,  8 Apr 2025 11:59:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744113561; cv=none; b=j8dB1posFBXU1luHyJ1B98bVdi0skb8AYDIwMY7OMXBW1cqSRSFzfeZcyVkfLDoQnwlHSxIEc3bIkO3YqAlHa26M7UKoR8rUtSmdUkQM0i15xdgLEPpUVfDaHOu06o9p7KdHefbHhkZUmawwq4V98DbOQioDlc6I9M3/2SS9eO8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744113561; c=relaxed/simple;
	bh=ywAtJrOZahSuq67rgk+Cy/2yM9z9HliyPt1CSsso76k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UYpYQEdu3WZUYWW+v2ycoUBrdcgxzOrLnKYVqAYv2p1LH+oRnWpUtM9niSDYIAaCphziTYJv0RTnM2RwTx3xQqAsTMcptY5UPJZCIgAjBB8NK+5n1/7mpqI26ycMHDUiR9jO5JTG5VuKrNjMSOdN3xmIrwOmilVE+lbmQBOYL8s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Qq0eafbl; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Qq0eafbl"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 538AtnKq027883
	for <chrome-platform@lists.linux.dev>; Tue, 8 Apr 2025 11:59:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=SfYGShmqcwDU8m6aPQIeDmLf
	R7GexvsEqe4YAvcqLMU=; b=Qq0eafblor3qJaHW7n07AL9wxfveW1I8JCHLiC+H
	V9piv80KGismzTB5g0giCp2vGl5NiuE7MPsCrHob7HF3WBxcbnvH4rsyfI7Yblve
	d4oodt5CF5fF6IXEi0rv6AqzVcmFMl7ZC1dboI/ZcG+wydrdymBzznPgskQc4DA9
	ljYD+HmmufXng68S2WBHECRg873kfgxI9H9JUsg+hUbihvlrKD0WuyVt6Hhc6Ri7
	1wYLucM3v118dxFdb/2QCDt2lAEYCyF/CfSofY0qFHsugaZE7mRqZyjO8xHL1Adt
	QF3D+iZw6JMSAiSbMUhcFQk3AO/1eQvB+vYKhBfJfKx4Ew==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twcyynv8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <chrome-platform@lists.linux.dev>; Tue, 08 Apr 2025 11:59:18 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6e905e89798so74796156d6.3
        for <chrome-platform@lists.linux.dev>; Tue, 08 Apr 2025 04:59:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744113558; x=1744718358;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SfYGShmqcwDU8m6aPQIeDmLfR7GexvsEqe4YAvcqLMU=;
        b=J5VI+B20HjabTRQxmHDiIdBlPsV4BtwtFCBfoUO9YqRPngXa044scQSD2JvCtgLE6C
         dIc2ug79VYF5BWuZU+lH1gRv6yyI7x2wwZWs/MKUE47Wgy76ol9zIICdHfAx/n2btdYu
         jwKyjPCEMaxxVz7UuHGVwicFjXe5/jZt1ot/CpzURh6eZ5+TclGL9XLcBmfJYAvno8QH
         zoPBMfsAxdunegllKzBOL+OAe94ZI05Z8XY6c6dEvPzWoNPD41sKaBAQsxJlmZW98kQR
         /PbzRy/Il+0/69EvBYC19LU1rIjRAlC3I9Eq1L6tHi9hnvYygnIc0dUgKhsmahZWvhFn
         PQMQ==
X-Forwarded-Encrypted: i=1; AJvYcCU4ggL+fDSihsn4LUi84cI+xWB3UBxTCV4u1fU7eNpXlUaGa3baKOFvPBeGs3Tdzb1efCiAeAxfs5DzM8JG6So=@lists.linux.dev
X-Gm-Message-State: AOJu0Yyn2ftF0Z/50MKxPVbXNS7P0Wqk+UNc8bGytBoBWnaBDixEffAu
	WhBc5Xh55AcOggsUOsfh4L3xv7Q8ljd/zB0x0gC7R3LGKoH35kceTVbrGfgyO90CnbUUX4djQ3X
	xARriJ/R+6e93KW/fdPd51tH9ykK44/t1HfDzdnEaCXg9oXg6gnQOw2D/Mqr6RvWovWA=
X-Gm-Gg: ASbGnct5YSTsH8xVU/Wo81HlrHfyl3gLAsB9+8WqkfCIwheT5AvBYgWUmD/+R3dsbcb
	9KPFBdQnfSKOQz97BYE11eU1if5bAAr1vhY1p4mMRvm/YknaFBLNqnJLq4O4JigAZZN4L1QWohJ
	eD0Yq/HbqEL5KNtAp1NLGQvhJZEl+bykm1YIEEJN34Uo2l3NmSsuZ9O4SWYZk7XIHs4dbLlcPBy
	xZrYp6sYgc7md+CL+KZ8pPeZ+60q6mKw2ryTbjzMjqAE9L8BAKGWjt9NHj9zQo30yW0zWBjKeT7
	OYYYmHVr/zGFa05VtIxWfGqPVDKkbeP6TIqgyj3xSjQtJIrWwHLMT+oyY8Om+gN9F8lWPmUrszP
	XkAk=
X-Received: by 2002:a05:6214:20a1:b0:6ea:d629:f48b with SMTP id 6a1803df08f44-6f0b7471828mr249820866d6.19.1744113557872;
        Tue, 08 Apr 2025 04:59:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHUpzBYgQ78WcZ+1SeialBgHtwM9sX7c9zUkOnk8QyfR5MRu/+7FIzLJ9zYjIy/Tt3IVQbLfw==
X-Received: by 2002:a05:6214:20a1:b0:6ea:d629:f48b with SMTP id 6a1803df08f44-6f0b7471828mr249820476d6.19.1744113557475;
        Tue, 08 Apr 2025 04:59:17 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54c1e65cc04sm1517615e87.164.2025.04.08.04.59.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 04:59:14 -0700 (PDT)
Date: Tue, 8 Apr 2025 14:59:12 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Jagan Teki <jagan@amarulasolutions.com>,
        Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Douglas Anderson <dianders@chromium.org>,
        Chun-Kuang Hu <chunkuang.hu@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Anusha Srivatsa <asrivats@redhat.com>,
        Paul Kocialkowski <paulk@sys-base.io>,
        Dmitry Baryshkov <lumag@kernel.org>,
        =?utf-8?B?SGVydsOp?= Codina <herve.codina@bootlin.com>,
        Hui Pu <Hui.Pu@gehealthcare.com>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        dri-devel@lists.freedesktop.org, asahi@lists.linux.dev,
        linux-kernel@vger.kernel.org, chrome-platform@lists.linux.dev,
        imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-amlogic@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org,
        linux-stm32@st-md-mailman.stormreply.com,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
Subject: Re: [PATCH 18/34] drm/msm/hdmi: convert to devm_drm_bridge_alloc()
 API
Message-ID: <6aeiyzkrjgq44lhdjsh6o6rzibwmpcgxjwwx4vefoyk5n3p7h6@uipdbbcxwsbn>
References: <20250407-drm-bridge-convert-to-alloc-api-v1-0-42113ff8d9c0@bootlin.com>
 <20250407-drm-bridge-convert-to-alloc-api-v1-18-42113ff8d9c0@bootlin.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250407-drm-bridge-convert-to-alloc-api-v1-18-42113ff8d9c0@bootlin.com>
X-Proofpoint-ORIG-GUID: 6S8Js42x30nzSRR4-wpNBijrbULzMypW
X-Authority-Analysis: v=2.4 cv=Q4vS452a c=1 sm=1 tr=0 ts=67f50f96 cx=c_pps a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=XR8D0OoHHMoA:10 a=P-IC7800AAAA:8 a=COk6AnOGAAAA:8 a=tVI0ZWmoAAAA:8 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8
 a=MqdoT2xZwiyagvIbdbwA:9 a=CjuIK1q_8ugA:10 a=pJ04lnu7RYOZP9TFuWaZ:22 a=d3PnA9EDa4IxuAV0gXij:22 a=TjNXssC_j7lpFel5tvFf:22 a=-BPWgnxRz2uhmvdm1NTO:22
X-Proofpoint-GUID: 6S8Js42x30nzSRR4-wpNBijrbULzMypW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-08_04,2025-04-08_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 impostorscore=0 lowpriorityscore=0 spamscore=0 clxscore=1011 phishscore=0
 bulkscore=0 adultscore=0 malwarescore=0 mlxscore=0 suspectscore=0
 mlxlogscore=928 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504080085

On Mon, Apr 07, 2025 at 04:23:33PM +0200, Luca Ceresoli wrote:
> This is the new API for allocating DRM bridges.
> 
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> 
> ---
> 
> Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Cc: Marijn Suijten <marijn.suijten@somainline.org>
> Cc: Rob Clark <robdclark@gmail.com>
> Cc: Sean Paul <sean@poorly.run>
> ---
>  drivers/gpu/drm/msm/hdmi/hdmi_bridge.c | 9 ++++-----
>  1 file changed, 4 insertions(+), 5 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry
