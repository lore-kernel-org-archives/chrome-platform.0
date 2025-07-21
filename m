Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E8F71DACA7
	for <chrome-platform@lists.linux.dev>; Mon, 21 Jul 2025 06:13:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753078385; cv=none; b=EyWfJtGt+YHAHy8K7a/NoeDiMzTz82eaqqbPnC2XUBi8LeL4Mu2XTDrLEIKhLu29IURBKRd657wdQYJr2hKXf6Ru+7O4tZQh/IJ3mhV0JwIGUq+N6JKjZ2Mn9/OYBQZS+NahKLeukBvaf4P6t7EAn++YRQT7jCJEs+Foyu+KzNk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753078385; c=relaxed/simple;
	bh=ZfkIW2GigEDSNJVyrVnK9Xb2enpMsq75FOX36xA8zLo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TTUMmHIgj9HHpIHxzeVpRxvOuwvuLF85QYwJ3kTtEYzUabu8fxENoWxVVAYubkDVzsZ++eks/nXzzj+WDhEexWlqrs1CJzp0L4TxBNu5XiE5h8O3scPC4hbF84s88YNt4Ny/tODvkVvIBevXZaE1JPDc3wIpSO2VwAmO3Ejh8Mo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=r/310PAb; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="r/310PAb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9EE86C4CEF1;
	Mon, 21 Jul 2025 06:13:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1753078385;
	bh=ZfkIW2GigEDSNJVyrVnK9Xb2enpMsq75FOX36xA8zLo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=r/310PAbQQpDevB/PIlbT85PaO25tyo+mEnIwtWpNJCACWqIA3bs4fNLWLSmjW1AF
	 nGcXNphS2TQ/5BV8WUPBnrgs7jpTNTgqOAQrto+ibTfPBZ5Ou3VprTXS05DIRGXbSI
	 TzoqsY5/Ur5l9j1C6i0ahiTp2d1kDlXY5kuZdWsc=
Date: Mon, 21 Jul 2025 08:13:02 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: bleung@chromium.org, dawidn@google.com, chrome-platform@lists.linux.dev
Subject: Re: [PATCH v3 2/8] platform/chrome: cros_ec: Unregister notifier in
 cros_ec_unregister()
Message-ID: <2025072119-acronym-sensation-12df@gregkh>
References: <20250721044456.2736300-1-tzungbi@kernel.org>
 <20250721044456.2736300-3-tzungbi@kernel.org>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250721044456.2736300-3-tzungbi@kernel.org>

On Mon, Jul 21, 2025 at 04:44:50AM +0000, Tzung-Bi Shih wrote:
> The blocking notifier is registered in cros_ec_register(); however, it
> isn't unregistered in cros_ec_unregister().
> 
> Fix it.

Shouldn't this be an independent patch, with the proper Fixes: and cc:
stable on it, so it can be applied now and backported correctly?  Why is
a bugfix in the middle of a new feature series?

thanks,

greg k-h
