Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BCC81DC9BB
	for <chrome-platform@lists.linux.dev>; Fri, 14 Feb 2025 06:10:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739513414; cv=none; b=kakW+DLHWP0G8UMLjZPBhO74j2k4Lt+UGlXOaH/+GtPj4sLdS+3Mx58hDxUWG76ADsQ97IwRQENIPcYDm03WlHsp2KJujtbD7msyG1RM3M/WB+UVmVs4TOUwnvuQOf8RhVJYo/UPMPIfAuaE75fU2/kCakdMLE37m2Hprazt92I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739513414; c=relaxed/simple;
	bh=HEPj1+gHAMLCK3/Z0IJ0NXXs1AgPxlGHcATvrPykWaw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GSAefEfTl8JqVPBDzqGh+IwLa5XiDoaVdnlLem/TfLl3mbtWLf/Y4fYpWxHoZ9htyRtOalLMOBXRM5/uezSrf3+a2PQ6QAbftNofRU2qHdWUV42iGSg2g6MxHf3NbHSfJp/eTyjIr8be9RtL4l9EZDdG7UE0TUF9X3qdf24QMfs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jmCDOisf; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jmCDOisf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 82632C4CED1;
	Fri, 14 Feb 2025 06:10:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739513413;
	bh=HEPj1+gHAMLCK3/Z0IJ0NXXs1AgPxlGHcATvrPykWaw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jmCDOisfUXKqXxiEy4z1ZUnWqWimTqtxgyi6/JasyJ8JSySBUpGK6eKebum1I01k4
	 xel9ZyHfreK86Kr2XZyzhp21hblUKbIRCvf02nJAMB/UM7vOrbtFOVGioFxBodCCIX
	 LVW9lTkjrcuihYf4giTsrGveT02u+QOLhu/n07kuyImxObnZx4L6NXEGIm+ny5HR15
	 vJK0rwrYAgXmbhR+yPAybVnvDcxHU2nMTukUisb8BS0AEqvdGh1dwo3us7bqfGYefV
	 R61cvAlBGw8/s3wog4CLu2WIGJ9J/1PmxBp7M+Bu5jc029C4BXdsmfebzKQq5wWIUs
	 n+2gIwJ/RmAwg==
Date: Fri, 14 Feb 2025 06:10:10 +0000
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Daniel Schaefer <dhs@frame.work>
Cc: chrome-platform@lists.linux.dev, linux@frame.work,
	"Dustin L . Howett" <dustin@howett.net>,
	Alexandru Stan <ams@frame.work>, bleung@chromium.org
Subject: Re: [PATCH v2] platform/chrome: cros_ec_lpc: Match on Framework ACPI
 device
Message-ID: <Z67eQg6-Gsq6swsV@google.com>
References: <20250128181329.8070-1-dhs@frame.work>
 <Z6AtlW7FwEwHMztW@google.com>
 <CAAjcXz5WbmKPWoL4Nsx17E+bcgDd1Y6qcbfifVu5A+S86MQZsQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAAjcXz5WbmKPWoL4Nsx17E+bcgDd1Y6qcbfifVu5A+S86MQZsQ@mail.gmail.com>

On Fri, Feb 14, 2025 at 01:00:07PM +0800, Daniel Schaefer wrote:
> Is there a chance this can still get into 6.14? I see it just barely

Sorry, no.  The patch just missed the previous merge window and it has
to wait for the next one unless it's a critical fix.

We want to queue patches a bit time to provide testing robots or pioneers
enough time to report if any issues.

Thank you for understanding.
