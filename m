Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF62A2FD7C6
	for <chrome-platform@lists.linux.dev>; Wed, 10 Dec 2025 18:00:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765389635; cv=none; b=gWQK8BqKqrKc4PV+eWtI6OYR9G00Q/gCV62rejPhuEV4n/2IAtCUrkEiKvfl9SgpPkrSSebwvr94nSIby5TfutaGt39Aaszh/uk2acKiM1o4Cj8fH6jUd0EI0q0XxTcrigOgP6Kfmg7QEWCfosub2dby2oycaBTVMWKNwLYvrbs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765389635; c=relaxed/simple;
	bh=a+WgLV8Me8he8vsaz9WjfiuVCZvCj6zKFhsOIiTYBLs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YmgW+bq1+JqLFBj31q8xz88a08bGkgRMWJhHbglXrjyCKyTaLy4QSWfrQa4YCD45NcPIg4agYVAqrG9j63HB15OZ8RuatJmVQGoEK5HOAHmwJAQpImEz5/UVoJj0UQ3QbrksEZzJcZtxI3RJ46Bi69GmGx+tozvZ4FbGM1sGeoY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=oIQjf9Jk; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="oIQjf9Jk"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-42e2e6aa22fso10550f8f.2
        for <chrome-platform@lists.linux.dev>; Wed, 10 Dec 2025 10:00:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1765389632; x=1765994432; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=vNo6uQ8AO0yOaAEJTUC3/zvI8C5HZVj+hKvmdCETuYM=;
        b=oIQjf9JktDYRz7qJLm1wESX5nTflrcUDv30Z9/mS3xmlJbNZMACUlCGJ9d/aTMJIAD
         Gr0sSX8jq9Swr39q8VFtuGiNzKG2teSb2+tQdpTBv6VnaVkMUMSD02kRmOW2kRKaSIAv
         u04FN8x/2qFRnv88lYChEuXZbMCaxPpODB1j8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765389632; x=1765994432;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vNo6uQ8AO0yOaAEJTUC3/zvI8C5HZVj+hKvmdCETuYM=;
        b=o3eEeDiZtayw29xhbuKJv0qX+zKux8iUCTQOlI/UBFUeKnd/Pl+v24FNpUMESYEvv9
         5u4mv1TD1g21K+gdK0gCep4MOtr6pB7ItmvvUtv5ImYlmPcF0pXDbiOQaL/Nbs4UGlu+
         A2qhEMgtcJxBJZpgovMAbuoLV8l+FxBvZaxbePyQAEYjYWQA93WuXtkOs1h05xl5mXh2
         jyN9T9mm5tUk1lhpJbNUtGmFDloY2MVDobkaWUHJBa2QMyXnFahDU+iJO1VVX7yvgShO
         8HGEvuXAvCNnBpoT1Guq/bKaqSQFZ3hqBTJU/C7LbJ8SbblUafDUxOdFp9iJAycm09Dh
         eKDA==
X-Forwarded-Encrypted: i=1; AJvYcCXxJoswobN17y6tyxnKvEBm5FljlG0LSGmhq7ER5rjmGswf/cFUAk+t4gLAUIgKtY94ys35llStMfRkzD4Hc5o=@lists.linux.dev
X-Gm-Message-State: AOJu0YwWYirwb62T/VvdCmtRFRPWwXRKIwD4/ike8fCj8XMw11a7SX2B
	DRRa0num+2tJ2zjz9yDf6Mm7/3rYvt0zFeeZunFSZRGdS3uhDjS3HGWPTQQuy5vaGg==
X-Gm-Gg: AY/fxX4Rgr4TQAreqQR17t2Z4UMlQOCyqkjbLzE4Zk8HN9/qq+bjey9gYpK620lYnqn
	6FAWhsFcuE35HXyhzygQZHdK67Kvl7eIG2jZJrDVxTpMctVOk9IMsLrL13dyEYfo99L5uBrtAC+
	KMkdIvNgehTuEtns8J4goBklSE/Iwl44or47UHDbR/50dFYEDKLr62aixqSO/yTaX427D2oJTzu
	8vQMh9vSwj5MGYLlxs2WX6vdMd9I6aHk0XS/7xBq3EpVgYlxws5AC+Ja6L0KOkFP5Lq68XBXwev
	4aH8auDx6XVfdY0ZmjwHMOvB5NJR/+pYc7DHCmjFzO25HS6bWrAsZyyioGpkJWd78ya4GgUcKLw
	Ipr/at8+1iBGSKiQv/x95rQ2hlyPzErBQspnRMu9M9w8UtKHHpBypvPRPiR7JpktYrR3HeGqf7y
	InsVWrwZ/Ia3xj8CAq6Q==
X-Google-Smtp-Source: AGHT+IGPESWqtdwT/XRTR5/RmcuAb3YXC3b7FMypahW+beW9pJZ9LM1+rqVviz4PyBnlnycCgdJNOQ==
X-Received: by 2002:a05:6000:608:b0:429:b9bc:e826 with SMTP id ffacd0b85a97d-42fa3b079c1mr3929886f8f.53.1765389632184;
        Wed, 10 Dec 2025 10:00:32 -0800 (PST)
Received: from google.com ([37.228.206.31])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42fa8b8601csm291118f8f.22.2025.12.10.10.00.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Dec 2025 10:00:31 -0800 (PST)
Date: Wed, 10 Dec 2025 18:00:29 +0000
From: Fabio Baltieri <fabiobaltieri@chromium.org>
To: Rob Herring <robh@kernel.org>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Benson Leung <bleung@chromium.org>,
	Guenter Roeck <groeck@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>, Simon Glass <sjg@chromium.org>,
	linux-input@vger.kernel.org, devicetree@vger.kernel.org,
	chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 3/3] dt-bindings: google,cros-ec-keyb: add fn-key and
 f-keymap props
Message-ID: <aTm1PVLrS7Ra0OTF@google.com>
References: <20251209154706.529784-1-fabiobaltieri@chromium.org>
 <20251209154706.529784-4-fabiobaltieri@chromium.org>
 <20251209192243.GA963693-robh@kernel.org>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251209192243.GA963693-robh@kernel.org>

Hey Rob, thanks for the review.

On Tue, Dec 09, 2025 at 01:22:43PM -0600, Rob Herring wrote:
> On Tue, Dec 09, 2025 at 03:47:06PM +0000, Fabio Baltieri wrote:
> > +  fn-key:
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    description: |
> > +      An u32 containing the coordinate of the Fn key, use the MATRIX_KEY(row,
> > +      col, code) macro, code is ignored.
> > +
> > +  fn-keymap:
> 
> If keymap is linux,keymap, then this should perhaps be linux,fn-keymap. 
> Depends if we still think linux,keymap is Linux specific?

I'm open for suggestions, trying to understand the pattern, these are
specific to this binding I think if anything they should be
google,fn-key and google,fn-keymap, similarly to the existing
google,needs-ghost-filter -- no idea why function-row-physmap was not
prefixed but I guess it slipped in and now it's not worth changing it.

Would it make sense?

Thanks,
Fabio

-- 
Fabio Baltieri
