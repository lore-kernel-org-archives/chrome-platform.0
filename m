Received: from mail-il1-f171.google.com (mail-il1-f171.google.com [209.85.166.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E59143AD5
	for <chrome-platform@lists.linux.dev>; Tue, 11 Jun 2024 18:11:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718129518; cv=none; b=R6QKf122sLq2m2NHt9+vFkiLJTex00r9HO0Qxnbuoo0mTzFcpY1z2F+9Aax6rG5YVVL2YSGQ2yn8CGgv78v4dhmC+bUI5tnuMByeuiZkddRLdrXrPInX3Cg2/rNCjplmazS/L9NVZZ17B65TluvT4NzQiFDNqGTKmBRdW0dH+O4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718129518; c=relaxed/simple;
	bh=Wg3BSKO9ze3H/vJA4+FngTXyThJMVk6fPylh5P0KmEA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NPAZNLWwGa88tesfdOZmlobS0fh48t0JoIQrpThN3hqv6GEGMZTFouQ8jSf0GeKlDFGGc7YkCCM5A+F+fhNFDzbpPRmw/DYiRIw+nX2I+ppENtLY8FoVYSrwq6jC+Zx1MEea8TRN4f/XWp/i9OfqWrnz+04S63xwSsTJJUHung8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eV3X9NtL; arc=none smtp.client-ip=209.85.166.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eV3X9NtL"
Received: by mail-il1-f171.google.com with SMTP id e9e14a558f8ab-3759a6423a6so6546475ab.1
        for <chrome-platform@lists.linux.dev>; Tue, 11 Jun 2024 11:11:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718129516; x=1718734316; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=v2Q7/e2RL6Iylt0JNf4WH+s+kRIK0AByBK4aInpj5Wk=;
        b=eV3X9NtLPGFkYfxvr3d1WFN7rtj3uuZ2WPlfeeoJls6DBwdU6jATcd1JgUL385fHVt
         OghJKnEhkik0jwBwVqp6urax70iOxnZveIf4W0ebdTGj/54bWODiGXspdBuIy1mSFTIP
         F9TIhzTBqcUD8bDz3EcfkvxxKz7JpB1HDtJDYli26NImfvaAyqBDX429B/zAJZcwkYwk
         UgO5u/I5OV0zF4Eaz/74hQUyOEiGplNFvKy7oF4E/Q72FM119c2Mwejsb3P0/PEpWFtm
         m0qZGFI0h+RSwJHiIOCkCs/aXl79YYeuYAkwH8CTY/UDxzTr5sA+M+P3zYA+PSu65q4i
         nJpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718129516; x=1718734316;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v2Q7/e2RL6Iylt0JNf4WH+s+kRIK0AByBK4aInpj5Wk=;
        b=vODL7rrgCZ7WuRyWfrCDUF6wUjNvJ/K06cbfihv4tz/NH+Fs5eM6iW6J4l4no/vkE/
         Gaqg/rktCVa1HWza/UAsloOuIRFo7upUaEBYO1M7a5NUwV0OG91ATyAwzGEqe5uHwSl8
         94NiLc5nrL25kmsEtLCwu1h52BVt/GmpFbq/TE5LmIp7sLAJYyOtWU03aUM6Rg4/On9M
         jWuO4UZOh/1eyPKPlgWl+2L5d6y3bxTTHg6Xsw4MiNHC9CgbmDYXDxn+SwReGybT7myS
         K3Rf9jcTCeE+5hyraSgJVtRMEuL2z3Z+ci5y7CG7HnkmGcim5fD/7EKWkCL06lEwr1OI
         0JBg==
X-Forwarded-Encrypted: i=1; AJvYcCUTX8MzR2wPBbCTCScGDYEs67y1VcbF7WorHOtHGlv2KMBn9F4y9yMQT1UEhj/M0QEjjzv+Z5YHL3Tz4Rp3kl/TSI0mg8A6J7BXfoEYlE6k
X-Gm-Message-State: AOJu0YwWNRHvSOvAv39Jt937NdFssPkK3q9X+9a/x6nnhwP6LlAqRRSv
	utUTc3cvrb+4mj5Ra6UM5YB50pfTv/jb+hwLsURxQ4GFfAKnE6NL
X-Google-Smtp-Source: AGHT+IHw3P6f5tmKGmSxzYYgPWvSLMNz4wApyPpb1GXPY82fpYCq2naoiYWVgJSvHA78LgqnOUEcLA==
X-Received: by 2002:a05:6e02:184a:b0:375:9dd4:d693 with SMTP id e9e14a558f8ab-3759dd4d92amr97091195ab.3.1718129516156;
        Tue, 11 Jun 2024 11:11:56 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:d73f:b49c:626c:fac7])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-6de211c93b0sm8061308a12.27.2024.06.11.11.11.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jun 2024 11:11:55 -0700 (PDT)
Date: Tue, 11 Jun 2024 11:11:53 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Daisuke Nojiri <dnojiri@chromium.org>
Cc: Benson Leung <bleung@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>,
	Guenter Roeck <groeck@chromium.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Reka Norman <rekanorman@chromium.org>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Pavan Holla <pholla@chromium.org>,
	Gwendal Grignou <gwendal@chromium.org>,
	Lukasz Majczak <lma@chromium.org>,
	Ching-Kang Yen <chingkang@chromium.org>,
	Stephen Boyd <swboyd@chromium.org>,
	Prashant Malani <pmalani@chromium.org>,
	chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-input@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v4 3/3] dt-bindings: cros-ec-keyboard: Add keyboard
 matrix v3.0
Message-ID: <ZmiTaXQd6Y1N3W8X@google.com>
References: <cover.1717779167.git.dnojiri@chromium.org>
 <2fdd4a2cb8526e60ba7143ec868e835f8ba8f55b.1717779167.git.dnojiri@chromium.org>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2fdd4a2cb8526e60ba7143ec868e835f8ba8f55b.1717779167.git.dnojiri@chromium.org>

On Fri, Jun 07, 2024 at 10:02:58AM -0700, Daisuke Nojiri wrote:
> Add support for keyboard matrix version 3.0, which reduces keyboard
> ghosting.

Could you add to the patch description an example of how this should be used?

Thanks.

-- 
Dmitry
