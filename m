Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C277218E91
	for <chrome-platform@lists.linux.dev>; Thu, 24 Jul 2025 10:36:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753353383; cv=none; b=VJjT5W1kEwEJYscD7yBOiCyx6/PXxUnzXnIugjSGs/niKZ4I+qtCSjaIASblwgPNQ2GF6hUSpLUpgO51akVsmCVRE1m+VM5OI65IyVQsoHTp5xIlG9mVLwP4xhPjGHGIa+Wbks/OM9IBfGulRa2MRk72hF276HLa3bBfFJD7fCE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753353383; c=relaxed/simple;
	bh=m7UHQaUWwExi5LnRxnv6llvkxb6bNyjMKz4EvN8P/nk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dezfI7K7hWHu80jRrHBWYTSsq25+Mv5HdFedBFK8ZzmyjWJpisi8VoLz/Ch86ObQ5edGakaoZaCvH2xeeOEbxR1SIPLO90A/p+s+EZEiC5eEEQuASEORfn0QMShGuuHPnHxllTfHuHnFiWmBXmon47lshnUbOo74UmTu2QBhyzI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=Y94BlVqI; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="Y94BlVqI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6760AC4CEED;
	Thu, 24 Jul 2025 10:36:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1753353383;
	bh=m7UHQaUWwExi5LnRxnv6llvkxb6bNyjMKz4EvN8P/nk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Y94BlVqIZL/SMkehZhcTgWDJDZa+PkWhkcIv+jbTZmXmSeoQ4zmdTscU2DY5TEIJU
	 yI0wGo1V0qUzDoTNHbk18cD+ADyg8OhZJnUts1sgmw1rMKOGPt/jVdW1FkgV0PSLlq
	 cHGa6jWj0YH8sDwnGD5nCX+npfHKpmyE3KD8YLLc=
Date: Thu, 24 Jul 2025 12:36:18 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: bleung@chromium.org, dawidn@google.com, chrome-platform@lists.linux.dev,
	mhiramat@kernel.org
Subject: Re: [PATCH v3 5/8] platform/chrome: Introduce cros_ec_device_alloc()
Message-ID: <2025072428-marathon-anemia-c9f6@gregkh>
References: <20250721044456.2736300-1-tzungbi@kernel.org>
 <20250721044456.2736300-6-tzungbi@kernel.org>
 <2025072114-unifier-screen-1594@gregkh>
 <aIIDz_qtbRjZB8Sg@google.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aIIDz_qtbRjZB8Sg@google.com>

On Thu, Jul 24, 2025 at 09:58:39AM +0000, Tzung-Bi Shih wrote:
> On Mon, Jul 21, 2025 at 08:15:07AM +0200, Greg KH wrote:
> > On Mon, Jul 21, 2025 at 04:44:53AM +0000, Tzung-Bi Shih wrote:
> > > Prepare to decouple the lifecycle of struct cros_ec_device from specific
> > > device by introducing a kref.
> > 
> > Ick, are you sure?  This is a device, so use struct device for it.
> > That's what it is there for.
> > 
> > So shouldn't this be its own 'struct device' and let the driver core
> > handle it correctly instead of trying to have a "child" structure with a
> > reference count that is not shown in sysfs at all?
> 
> Thanks for the review.
> 
> To make sure I understand, do the following patches (draft and simplified) make
> sense?  Short summary:
> - cros_ec_device_alloc() allocates resources and setup the destructor.
> - cros_ec_register() adds the device to the device hierarchy.
> - cros_ec_unregister() removes the device.
> - cros_ec_chardev_open() gets a refcount of the device.
> - cros_ec_chardev_release() puts the refcount.

NEVER attempt to increment/decrement refcounts on open/release.  That
way lies madness and should not be needed at all, the underlying
infrastructure should keep things working properly here, right?

thanks,

greg k-h
