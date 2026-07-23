Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D85C8472546;
	Thu, 23 Jul 2026 16:06:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784822765; cv=none; b=RLAireDevCNPl+LNanBp1XRXTPXi3+YWLngcFKQPsK547f311ZYcVuGn4Xq8W03XDGpxHq0vzbReSwbcrSed8yb8eRx6+nD8qcgrI7k9uhs562KvCBAuFH60aRcs8xtkzphbXECkc6zMCyXrg1Gs6aDOSXT23nMdj48CbPb0SpY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784822765; c=relaxed/simple;
	bh=ks0F3PxUmMYQE7RC3MOM8dEX4fQLNWjhT3uubPfgwbo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=crL5jK+YRwfzfD5TLFK4mm37FxKuDJUuY9dL+vaBt4vb7TTARdhjaMPhtZQyt16fVB9/w0JdEr561taE2oitOvi4DV0De0vUO6BOGiiVKwelWIFIYqyxtWKaZSsTNjl+Cfh+mtTsWW1evv1JcesZJdBnG9foXI1UerP2g79IHoo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A34EA1F000E9;
	Thu, 23 Jul 2026 16:06:00 +0000 (UTC)
Date: Thu, 23 Jul 2026 17:05:53 +0100
From: Lee Jones <lee@kernel.org>
To: Benson Leung <bleung@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>,
	Andrei Kuchynski <akuchynski@chromium.org>
Cc: Guenter Roeck <groeck@chromium.org>,
	Gwendal Grignou <gwendal@chromium.org>,
	chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/2] mfd: platform/chrome: Catch EC feature read
 errors during probe
Message-ID: <20260723160553.GC3526803@google.com>
References: <20260608211518.2214740-1-akuchynski@chromium.org>
 <178482259319.3530477.8287706988972276877.b4-ty@b4>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <178482259319.3530477.8287706988972276877.b4-ty@b4>

On Thu, 23 Jul 2026, Lee Jones wrote:

> On Mon, 08 Jun 2026 21:15:16 +0000, Andrei Kuchynski wrote:
> > This series fixes a sysfs duplicate name collision that occurs when the
> > Fingerprint device fails to respond during probe, causing it to
> > incorrectly fall back to the generic 'cros_ec' name.
> > 
> > Changes in v2:
> > - Split into a 2-patch series.
> > - Carried over Acked-by from Tzung-Bi Shih for Patch 1.
> > - Fixed an ec->class_dev resource leak by utilizing 'goto failed;'.
> > - Moved class_dev initialization to prevent a missing release()
> >   callback warning on the error path.
> > 
> > [...]
> 
> Applied, thanks!
> 
> [1/2] platform/chrome: cros_ec_proto: Introduce cros_ec_read_features helper
>       commit: d6ae9f9b9bd373461442f17ef157ed9ee850a413
> [2/2] mfd: cros_ec: Read EC features during probe to catch transfer error
>       commit: 5855464dff6a2171847463775c7cdac92742e0f9

Build testing now.

Note to self: ib-mfd-platform-chrome-7.3

-- 
Lee Jones
