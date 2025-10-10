Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA1F420C023
	for <chrome-platform@lists.linux.dev>; Fri, 10 Oct 2025 17:38:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760117908; cv=none; b=DMi6DYbLGCfDfRaFkklcSKOO3xnGIyFKlIVi4JqX4Ry43kaSRsgxjDh8B40X0zM4q4xlYGIfqvK2nbU3zP82Y3YwA+BQYeYwXIfvMxuVz1Il9s5L/UEBQ/GO7rBgpRY70JsODRRPBDeGjQR+z2y+WFEDvLiYjob7yW+0tYHQbWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760117908; c=relaxed/simple;
	bh=WlMRssIh5zYebG/2qOucIDbKqlW9Tme8xzWY4T8SErc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QbFOROBDET6noRBR9PwK4VVPQOBOMZDokonZ/07s/QSOnAMI4wrtfv4byd7gYOQqv4Tj1X7QY766N6givGKHyWXrVWAbrFEHmxDQansb8lRYk4Cqul1JTOD6GuUQVVibUyyC9IoiLha4WN3RrIAbPDyo0sN10BVv5ZckZWhThuo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eCXD/oji; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eCXD/oji"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59AFVfjA002364
	for <chrome-platform@lists.linux.dev>; Fri, 10 Oct 2025 17:38:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=bHopJWpMCYVDcAtBNZFS+e4d
	nBu6DmW8XDXrseCiOq8=; b=eCXD/ojiHGrMPEvKSChJR8lmJv2FWtHjBM6MQNwa
	C8h3O14kpQsEABo+IeaxcNbtq8M5irtYvws2H0DbxLfHPQTS+VZZOgxAaRQ3JFZe
	364CygO2+85Lo16LjbyZfWS7PjMyJpJCNogy6hK5BfNFIbuluuzlDbKBypTB13V4
	tAiehVEyHJ9AaC7Ab2r0CjOZfBNB+oxf5ttrF60zcD+xrg/aDZe9x51nduUZsx3N
	xDTCcYefXddrY2ZJo3G135m010sMLYTVrarWhriy2h5hpEG3NK26aO5a0R5Ys0Rp
	rOf8z6w2IUZqSEziGpm8VaeTKB03VFggFaegY8XKrnjUYA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49pgdsur81-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <chrome-platform@lists.linux.dev>; Fri, 10 Oct 2025 17:38:25 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8217df6d44cso774614985a.2
        for <chrome-platform@lists.linux.dev>; Fri, 10 Oct 2025 10:38:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760117905; x=1760722705;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bHopJWpMCYVDcAtBNZFS+e4dnBu6DmW8XDXrseCiOq8=;
        b=HnVL4xQSpmZzHm6cVfmeFfQkENIUdAnKmrATeCO2wKRh2JZsAKvoyAa7cE1uUio5w5
         3ChYpHxgblqAqTax4/egqlo2r6Zi46JNB1wyzb1IqmVWIniMJoMlp6GH7qgqSkOD8fjM
         hREWeyBve7Mfu0Vg/CSCrAn1p9ZMAJjINu99yfAOdaoFadi4q1/sUCkYPoCG2kkV1tLa
         ZIxGk3NamDUdHstO22qzepYAYkReC62Kl9o0M8uE0Cm8wJV+nHNr7yEUft+MwiSqfEUX
         zfEOkdSJjgwNVcvMkp3tEUOpz4+Y+cAWty95Ik2RNT9OY9ER7xNzvVwGstgdnTKN3k7+
         5UqA==
X-Forwarded-Encrypted: i=1; AJvYcCUi1lFlqM6shtQYxoeJTfUpOufJaKLnrPwNqqbaXhlWa7OF2W3a3eB0kNoJ/zEQQNv9eI5RoMdLooMS9Flh7Bc=@lists.linux.dev
X-Gm-Message-State: AOJu0YzKW9Llx0294PtrSDEZFzyFMkLCe6BL52FYoKUTTbnZ806M2hqX
	acXDdXjvUQAoM76kZuLtR8IXbsEm5QCOYo/8oc7iyt8SjVMWfcc4Vd2CoTEuM02RGZLjYgfB01g
	C/fXj+OD/EP0H6pbzKr7gRrua+/+qx9ITfpIvk8FtH9wsH+wD1o1DP74vYwrm+zzQPPI91Xo=
X-Gm-Gg: ASbGncvDc6Q8jRE6KeBKeWJMS+ysIewoDxF42FH2SsuksPT2BSMWvfQifag6ZIBeLW+
	d1AO7rqPu5xyLRDGfkZuJgjip0KkAH8MfndIxedXH/ehdGHB2af85IFu+/Q7IcXRVq4u1V6pX9R
	X5s+cRldbvNlQ4cR4SWyKwbLHSofKPRFuOQ1Eh831BNHrgNl9A+4BlKdbS8vay8V07a3fRIdnjq
	A8Verm4iOm55GEHZAWtsSN/fMB3oS4dBS52yMHPn6MCadrAfWKMO+KM/A3QQj5gXba2GX0e0B4t
	tgCTjxLRhWIfjkDNMIrUs/dhFF31zpTc8tLMWIcBlcQ/CKBU2UNeNa2TDN9MoDAfKukaVhGqJmC
	dqKixSXzOgCR0wYcBVwaYkoTCgILt+SLsR/M09nMPLauFjy7YVekx
X-Received: by 2002:a05:622a:550b:b0:4d8:67fb:417c with SMTP id d75a77b69052e-4e6eacc6653mr200002831cf.16.1760117904783;
        Fri, 10 Oct 2025 10:38:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHKChfLnLv6uMZuWTNjeEXangYm9IkXBq61vh5oNYRc8TIuCkU2/pQdzdpKhqDcWyE0R351rA==
X-Received: by 2002:a05:622a:550b:b0:4d8:67fb:417c with SMTP id d75a77b69052e-4e6eacc6653mr200002151cf.16.1760117904234;
        Fri, 10 Oct 2025 10:38:24 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3762ea3aae3sm7638331fa.45.2025.10.10.10.38.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Oct 2025 10:38:23 -0700 (PDT)
Date: Fri, 10 Oct 2025 20:38:20 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jameson Thies <jthies@google.com>
Cc: akuchynski@chromium.org, abhishekpandit@chromium.org, krzk+dt@kernel.org,
        robh@kernel.org, bleung@chromium.org, heikki.krogerus@linux.intel.com,
        ukaszb@chromium.org, tzungbi@kernel.org, devicetree@vger.kernel.org,
        chrome-platform@lists.linux.dev, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 3/3] mfd: cros_ec: Don't add cros_ec_ucsi if it is
 defined in OF or ACPI
Message-ID: <zcs3utvlaac336ezw2y7mzbbjsqocbls3e4nx5sc4tufiig475@cekebowcrpmz>
References: <20251009010312.2203812-1-jthies@google.com>
 <20251009010312.2203812-4-jthies@google.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251009010312.2203812-4-jthies@google.com>
X-Proofpoint-ORIG-GUID: Ltyn29uFzjsWrjit62mPXMbTzDAUjVJW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA5MDA5OCBTYWx0ZWRfX3lbd64GAOClA
 VVEQcJfLr8ns+bswc8qRfORYEDie/0qZyRzv722T0t4RM47DVJ6ca9XEg0Zg7qoWFcpuqMoaH1w
 N/GX6kdKSqgcuGNE2gvuLaSrcx3qcllhE8R9yE32gnEgp88VKFJBvHO7l7iZcBn48DnODxAatbs
 gyntkMGwap92B2bGer2pw3Lu/OLHnYDUefBJ8ixKzBjSDNzxRnx1t3aem+U+Dp9nq5iBuUvUUyA
 bGh+xW2udGL+LTvtDyIsjBELJ7x9mO26quIaDCVADDsT7V/9VDR6tZHv1ncmv7f8eXP0kaZ6vhR
 PGgrSoHr4gSx2wgDDI4pDQ/GG2rdN3xoevTX/gJ6dqwqQbzkvGWKC8Nh8EbGwgbYYREL6ssPNbb
 OHL77E4qpwaZiwDOam7rL4n/cB9dlw==
X-Authority-Analysis: v=2.4 cv=DISCIiNb c=1 sm=1 tr=0 ts=68e94491 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=1XWaLZrsAAAA:8 a=aqZUw6bxmdrI7EJOglwA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: Ltyn29uFzjsWrjit62mPXMbTzDAUjVJW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-10_04,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 spamscore=0 clxscore=1015
 priorityscore=1501 suspectscore=0 phishscore=0 impostorscore=0 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510090098

On Thu, Oct 09, 2025 at 01:03:08AM +0000, Jameson Thies wrote:
> On devices with a UCSI PPM in the EC, check for cros_ec_ucsi to be
> defined in the OF device tree or an ACPI node. If it is defined by
> either OF or ACPI, it does not need to be added as a subdevice of
> cros_ec_dev.

It still can be a subdevice of the EC, if it has a correct DT node.

> 
> Signed-off-by: Jameson Thies <jthies@google.com>
> ---
>  drivers/mfd/cros_ec_dev.c | 23 ++++++++++++++++++-----
>  1 file changed, 18 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/mfd/cros_ec_dev.c b/drivers/mfd/cros_ec_dev.c
> index dc80a272726b..1928c2ea2b8f 100644
> --- a/drivers/mfd/cros_ec_dev.c
> +++ b/drivers/mfd/cros_ec_dev.c
> @@ -5,6 +5,7 @@
>   * Copyright (C) 2014 Google, Inc.
>   */
>  
> +#include <linux/acpi.h>
>  #include <linux/dmi.h>
>  #include <linux/kconfig.h>
>  #include <linux/mfd/core.h>
> @@ -131,11 +132,6 @@ static const struct cros_feature_to_cells cros_subdevices[] = {
>  		.mfd_cells	= cros_ec_rtc_cells,
>  		.num_cells	= ARRAY_SIZE(cros_ec_rtc_cells),
>  	},
> -	{
> -		.id		= EC_FEATURE_UCSI_PPM,
> -		.mfd_cells	= cros_ec_ucsi_cells,
> -		.num_cells	= ARRAY_SIZE(cros_ec_ucsi_cells),
> -	},
>  	{
>  		.id		= EC_FEATURE_HANG_DETECT,
>  		.mfd_cells	= cros_ec_wdt_cells,
> @@ -264,6 +260,23 @@ static int ec_device_probe(struct platform_device *pdev)
>  		}
>  	}
>  
> +	/*
> +	 * FW nodes can load cros_ec_ucsi, but early PDC devices did not define
> +	 * the required nodes. On PDC systems without FW nodes for cros_ec_ucsi,
> +	 * the driver should be added as an mfd subdevice.
> +	 */
> +	if (cros_ec_check_features(ec, EC_FEATURE_USB_PD) &&
> +	    cros_ec_check_features(ec, EC_FEATURE_UCSI_PPM) &&
> +	    !acpi_dev_found("GOOG0021") &&
> +	    !of_find_compatible_node(NULL, NULL, "google,cros-ec-ucsi")) {
> +		retval = mfd_add_hotplug_devices(ec->dev,
> +						 cros_ec_ucsi_cells,
> +						 ARRAY_SIZE(cros_ec_ucsi_cells));
> +
> +		if (retval)
> +			dev_warn(ec->dev, "failed to add cros_ec_ucsi: %d\n", retval);
> +	}
> +
>  	/*
>  	 * UCSI provides power supply information so we don't need to separately
>  	 * load the cros_usbpd_charger driver.
> -- 
> 2.51.0.710.ga91ca5db03-goog
> 

-- 
With best wishes
Dmitry
