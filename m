Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com [209.85.218.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 646A7344D9D
	for <chrome-platform@lists.linux.dev>; Wed, 30 Sep 2026 18:55:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790794511; cv=none; b=nAdXebcVv4uJfvF8YlEyQvZoVMzKZ74c8pzqS0Rv5bmEiNRdFhmsEHjUFXR6Y7Si0RH2N6+ZcCIQpqcHBw5gXVneBAHccCKtQBWbp9QthYX9EgsTmU5SKkMrDhC+TaR+U5Y4CmedElMWDGg/CAvrlrsHrnSWOW7vZDNY+NgbS+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790794511; c=relaxed/simple;
	bh=cswiScNE3E9pNfXIpCP4WFi2Ae4RTtKOoPD0b7LSKkY=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=UnUs4c4EIdCmy4L3B0o/KKEkKyVKufFrOdTI35zXvtRJ7AL0jTGedSPg9/JWtRzafFyX4rQKyF3AurDNOWuuYdDb303kwSYukcFF22khSfE+zXXpfMcXQNBLBzTK8LUS6JBoIlv1Dvr2ITjbv9PXa5GZI9dRmWDq5lPiIp1NmnA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--mmaslanka.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=geIXFDGp; arc=none smtp.client-ip=209.85.218.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--mmaslanka.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="geIXFDGp"
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-c2e219eade5so106005266b.1
        for <chrome-platform@lists.linux.dev>; Wed, 30 Sep 2026 11:55:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790794507; x=1791399307; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xK4JYgRtStNo4V5zoea2qHX3qmnjaW/h2fp97VQUzUk=;
        b=geIXFDGpOD+8pVHovRlGtwMBbwtGkTrKrTonYn7mKYv3jelf4FY2DaUzza3twrAKXC
         ehKXpBKjWzdYvcFVA93ZfQ4bw31gadu9Cz8rXcsR4xxHn19VeU1Dk8BbQ5PrGJAWAWsR
         s6s6q6uQkF8G1bMKnyxYXg9SPQrKCQ0/KS9LJwqe9PjYJo722jq/AOi3Gk0K10MAyuSX
         LCrhQvS39qln/OiEAO8r+/qxZbzKTPjFQdKZNNRLcXM24hlIyBGItCSNdeW/QVxqAYxO
         IW62CvJvLaDpcaQGCboOZTdR7OEMlsdStQK/KsB0pE6kUZdy/X4vKhxB55oRXCiS2nT+
         Weeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790794507; x=1791399307;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xK4JYgRtStNo4V5zoea2qHX3qmnjaW/h2fp97VQUzUk=;
        b=h/M9ooDipAjqIMD+YnnQz0puS6huPB6Hsx+tT5IrsL+Npj1jKhsmyf4NDTULEjRU+b
         +GsGRPSZRpR4TOdJmb3OHLfx5xgBbowIhV0MWAk1ytGrkTsFTpTzk4xC/QpH4hVcmoSr
         N+MRn4sGnltNUxVf9aKq0Szi3Ermy12+yAncDaZ5kygCRdkECAIhatc5ctdv/eAhwO1x
         TG/0LyybAQcWHXYEBaUOTIPuys/+aSU4gEcZEJPJSA+qUNo6z6TfT6KNC+lvaIRKLZVG
         m15+AOshbMHQ7bmEF/uO41Ce9j03xKFnCZbF8t42gVjJMwBYN3hfKaCagIg/RSv+9PsJ
         GyVg==
X-Forwarded-Encrypted: i=1; AKwUvBzJPaGutKYesfClOUbILRt6HcD1OXiN7i2Qdnm3wjdIdsg2/p8QmJbzUEACybZz1fRbwH0juhH0Sfd4TRp1MnI=@lists.linux.dev
X-Gm-Message-State: AFuF++n9YTvcdF7/s65nhyuvuqywfErx1D9qf6K4vl7BTCNCREdfE+n4
	k+PWNBufDGzC9XnBuYXKm26ILml09grpM8jjuv3oUkc6PzzUBelHguD+AJ0xE9g1o+EshPOIgze
	BC0tiqlIi+7ep9fq6PA==
X-Received: from edvm11.prod.google.com ([2002:a05:6402:50b:b0:6a8:1d4c:399])
 (user=mmaslanka job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:907:8997:b0:c26:1cfd:4244 with SMTP id a640c23a62f3a-c2e33ef130cmr47630166b.11.1790794507256;
 Wed, 30 Sep 2026 11:55:07 -0700 (PDT)
Date: Wed, 30 Sep 2026 20:55:00 +0200
In-Reply-To: <art-pgdLHXiCm5l4@google.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260923174420.2343724-1-mmaslanka@google.com> <art-pgdLHXiCm5l4@google.com>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Message-ID: <20260930185500.198456-1-mmaslanka@google.com>
Subject: Re: [PATCH] platform/chrome: cros_ec_typec: Poll for role swap completion
From: Marek Maslanka <mmaslanka@google.com>
To: tzungbi@kernel.org
Cc: bleung@chromium.org, abhishekpandit@chromium.org, jthies@google.com, 
	akuchynski@chromium.org, groeck@chromium.org, raduvele@google.com, 
	chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Marek Maslanka <mmaslanka@google.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, Sep 29, 2026 at 09:02:30AM +0000, Tzung-Bi Shih wrote:
> On Wed, Sep 23, 2026 at 07:44:19PM +0200, Marek Maslanka wrote:
> > +	req.swap = USB_PD_CTRL_SWAP_NONE;
> > +	end = jiffies + msecs_to_jiffies(ROLE_SWAP_TIMEOUT_MS);
> > +	for (;;) {
> > +		if ((resp.enabled & PD_CTRL_RESP_ENABLED_CONNECTED) &&
> 
> Shouldn't PD_CTRL_RESP_ENABLED_CONNECTED remain set during the entire poll?
> 
> > +		    cros_typec_resp_to_role(&resp, swap_type) == target_role)
> > +			break;
> > +
> > +		if (time_after_eq(jiffies, end)) {
> > +			if (!(resp.enabled & PD_CTRL_RESP_ENABLED_CONNECTED)) {
> > +				dev_err(data->dev, "Port disconnected during role swap\n");
> > +				return -ENOTCONN;
> > +			}
> 
> Same here: if PD_CTRL_RESP_ENABLED_CONNECTED isn't set in the loop, should
> it return -ENOTCONN early (i.e., out of this if-block)?

Yea Right, thanks. PD_CTRL_RESP_ENABLED_CONNECTED remains set
throughout the role swap in the EC (both TCPMv2 and PDC keep the port
in an attached state while a PR_Swap or DR_Swap is in progress).

The original reason for checking PD_CTRL_RESP_ENABLED_CONNECTED before
comparing the role was to avoid misinterpreting a cleared resp.role (0)
on disconnect as TYPEC_SINK or TYPEC_DEVICE, but checking
!(resp.enabled & PD_CTRL_RESP_ENABLED_CONNECTED) at the start of the
loop and returning -ENOTCONN immediately is much cleaner and avoids
waiting for the timeout when the port disconnects.

I will update this in v2.
